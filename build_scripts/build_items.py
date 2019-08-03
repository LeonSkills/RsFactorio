import collections
from io import BytesIO
import rdflib
import json
import urllib.request
import math
from PIL import Image
from bs4 import BeautifulSoup
import urllib
import os.path

user_agent = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7'

headers = {'User-Agent': user_agent, }
max_icon_size = 32


def main():
    # Loop over all mods
    cur_folder = os.path.dirname(os.path.abspath(__file__))
    mods_folder = os.path.join(cur_folder, "..", "mods")

    mods = os.listdir(mods_folder)

    for folder_name in mods:
        mod_folder = os.path.join(mods_folder, folder_name)
        if not os.path.isdir(mod_folder):
            continue
        print("Checking items for ", folder_name)

        with open(os.path.join(mod_folder, "mod", "info.json")) as f:
            mod_name = json.load(f)["name"]

        item_file = os.path.join(mod_folder, "rs_items.json")
        with open(item_file, "r") as f:
            item_data = json.load(f)

        factorio_items = {}

        locale_data = {}

        icons_folder = os.path.join(mod_folder, "mod", "graphics", "icons", "auto_generated")
        if not os.path.exists(icons_folder):
            os.makedirs(icons_folder)

        item_data_changed = False

        for item_name, data in item_data.items():
            rs_name = item_name.replace(" ", "_")
            icon_location = os.path.join(icons_folder, rs_name.lower() + ".png")

            # If image is already there assume
            if not os.path.isfile(icon_location) or "icon_size" not in data:
                icon_size = add_icon(icon_location, rs_name, version=data["version"] if "version" in data else None)
                data["icon_size"] = icon_size
                item_data_changed = True

            icon = "__" + mod_name + "__/graphics/icons/auto_generated/" + rs_name.lower() + ".png"
            if "icon" not in data or data["icon"] != icon:
                data["icon"] = icon
                item_data_changed = True

            if "locale_name" not in data:
                data["rs_name"] = rs_name.lower()
                rs_data = get_rs_data(rs_name, data["version"] if "version" in data else None)

                data["name"] = "rs-" + item_name.replace(" ", "-").lower()
                data["type"] = "item"
                data["flags"] = {}

                for key, value in rs_data.items():
                    data[key] = value

                item_data_changed = True

            locale_data[data["name"]] = {"item-name": data["locale_name"], "item-description": data["examine"]}
            factorio_items[item_name] = data

        sorted_locale = collections.OrderedDict(sorted(locale_data.items()))

        write_locale_file(mod_folder, sorted_locale)
        write_lua_file(mod_folder, factorio_items)

        if item_data_changed:
            with open(item_file, "w") as f:
                json.dump(factorio_items, f, indent=2)


def to_lua_table(data, depth=1):
    if type(data) == int:
        return str(data)
    if type(data) == str:
        return '"' + data + '"'
    if type(data) == str(data).lower():
        return
    if type(data) == bool:
        return str(data).lower()
    if type(data) == dict:
        dict_str = "{\n"
        for key, val in data.items():
            dict_str += "  " * depth + '["' + str(key) + '"] = ' + to_lua_table(val, depth + 1) + ",\n"
        dict_str += "  " * (depth - 1) + "}"

        return dict_str
    if type(data) == set or type(data) == list:
        set_str = "{\n"
        for val in data:
            set_str += "  " * depth + to_lua_table(val, depth + 1) + ",\n"
        set_str += "  " * (depth - 1) + "}"
        return set_str

    if data is None:
        return "'nil'"

    raise ValueError('Unknown type of data ' + str(type(data)))


def write_lua_file(mod_folder, data):
    lua_string = "return " + to_lua_table(data)
    items_file = os.path.join(mod_folder, "mod", "scripts", "item")
    if not os.path.exists(items_file):
        os.makedirs(items_file)
    item_file = os.path.join(items_file, "auto_generated_items.lua")
    with open(item_file, "w") as f:
        f.write(lua_string)


def write_locale_file(mod_folder, data):
    locale_folder = os.path.join(mod_folder, "mod", "locale", "en")
    if not os.path.exists(locale_folder):
        os.makedirs(locale_folder)
    locale_file = os.path.join(locale_folder, "auto_generated_locale.cfg")
    name_string = "[item-name]\n"
    description_string = "[item-description]\n"
    for name, value in data.items():
        name_string += name + "=" + value["item-name"] + "\n"
        description_string += name + "=" + value["item-description"] + "\n"

    with open(locale_file, "w") as f:
        f.write(name_string)
        f.write(description_string)


def get_rs_data(rs_name, version=None):
    print("Fetching data", rs_name)
    rs_data = {}
    file = "https://runescape.wiki/w/Special:ExportRDF/" + rs_name
    g = rdflib.Graph()
    g.parse(file, format="xml")
    high_alch = list(g[:rdflib.URIRef('https://runescape.wiki/w/Property-3AHigh_Alchemy_value')])
    if high_alch:
        rs_data["high_alch"] = int(high_alch[0][1].value)
    low_alch = list(g[:rdflib.URIRef('https://runescape.wiki/w/Property-3ALow_Alchemy_value')])
    if low_alch:
        rs_data["low_alch"] = int(low_alch[0][1].value)

    x_list = list(g[:rdflib.URIRef('https://runescape.wiki/w/Property-3AItem_JSON')])
    if len(x_list) == 0:
        print("Can't find item " + rs_name + " on wiki")
        return False
    for x in x_list:
        x_loaded = json.loads(x[1])

        if "version" not in x_loaded or \
                ((version is None and x_loaded["version"] != "used" and x_loaded["version"] != "broken")
                 or x_loaded["version"] == version):
            rs_data["examine"] = x_loaded["examine"]
            print(rs_data["examine"])
            name = x_loaded["name"]
            # armour set stuff
            name = name.replace(" (lg)", "").replace("--28lg-29", "").replace(" (3)", "").replace(" (6)", "")

            rs_data["locale_name"] = name
            factorio_name = "rs-" + name.lower().replace("_", "-").replace(" ", "-")
            rs_data["name"] = factorio_name
            break

    assert "name" in rs_data
    return rs_data


def add_icon(icon_location, rs_name, use_detailed=False, version=None):
    print("Fetching icon", rs_name)
    if version:
        rs_name += "_"+version

    if use_detailed:
        rs_name += "_detail"

    url = "https://runescape.wiki/w/File:" + rs_name + ".png"

    req = urllib.request.Request(url, headers=headers)
    html = str(urllib.request.urlopen(req).read())
    parser = BeautifulSoup(html, features="html.parser")

    image_link = parser.body.find("div", attrs={"class", "fullImageLink"})

    image_url = "https://runescape.wiki" + image_link.a.img.attrs['src']
    image_req = urllib.request.Request(image_url, headers=headers)
    #
    # opener.retrieve(image_url, item_name + ".png")
    # image_html = urllib.request.Request(image_url, headers=headers)
    file = BytesIO(urllib.request.urlopen(image_req).read())
    img = Image.open(file)
    x, y = img.size
    m = max(x, y)
    im_size = max(m, max_icon_size)
    bg = Image.new("RGBA", (im_size, im_size), (0, 0, 0, 0))
    # img = img.resize((math.floor(x/m*icon_size), math.floor(y/m*icon_size)), Image.ANTIALIAS)
    # x, y = img.size
    x_diff = math.floor((im_size - x) / 2)
    y_diff = math.floor((im_size - y) / 2)
    bg.paste(img, (x_diff, y_diff))
    bg.save(icon_location)

    return im_size


if __name__ == '__main__':
    main()
