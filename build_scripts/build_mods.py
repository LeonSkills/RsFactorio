# COPYRIGHT LeonSkills 2019.

import os, json
import shutil
import time


def main():
    _read_mod_info()


def copy_mod(from_folder, to_folder):
    # Replaces files whose data changed in to_folder. Removes files from to_folder not in from_folder.
    # to_folder will be the same as from_folder
    changed = False
    to_files = os.listdir(to_folder)
    from_files = os.listdir(from_folder)
    # loop over all files that are already in the destination
    for file in to_files:
        to_file_path = os.path.join(to_folder, file)
        from_file_path = os.path.join(from_folder, file)
        # if the file isn't in the from folder anymore, remove it
        if file not in from_files:
            if os.path.isfile(to_file_path):
                os.remove(to_file_path)
            else:
                shutil.rmtree(to_file_path)
        else:  # otherwise see if it has changed and should be overridden
            from_files.remove(file)
            # check if it has changed by checking if the from_folder time is newer
            if os.path.isfile(to_file_path):
                if os.path.getmtime(to_file_path) < os.path.getmtime(from_file_path):
                    print("Replaced", from_file_path)
                    shutil.copy2(from_file_path, to_file_path)
                    changed = True
            else:
                req_changed = copy_mod(from_file_path, to_file_path)  # call recursively in sub folders
                changed = changed or req_changed

    # for any files that weren't already in the to_folder, copy them over
    for file in from_files:
        to_file_path = os.path.join(to_folder, file)
        from_file_path = os.path.join(from_folder, file)
        if os.path.isfile(from_file_path):
            shutil.copy2(from_file_path, to_file_path)
        else:
            shutil.copytree(from_file_path, to_file_path)
        changed = True
    return changed


def get_last_modification_time(file):
    # We ignore auto generated files.
    if "auto_generated" in file:
        return 0
    if os.path.isfile(file):
        return os.path.getmtime(file)
    return max([get_last_modification_time(os.path.join(file, sub_file)) for sub_file in os.listdir(file)] or [0])


def _read_mod_info():
    mods_folder = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "mods")

    mods = os.listdir(mods_folder)

    # Update utility first

    mod_folder = os.path.join(mods_folder, "Utility")
    utility_version = _update_mod("Utility", mod_folder)

    # loop over all mods in the /mods folder
    for folder_name in mods:
        if folder_name != "Utility":
            mod_folder = os.path.join(mods_folder, folder_name)
            _update_mod(folder_name, mod_folder, utility_version)


def _update_mod(folder_name, mod_folder, utility_version=None):
    print("Updating", folder_name)
    info_file = os.path.join(mod_folder, "mod", "info.json")

    # Get current version number and mod name
    with open(info_file, "r") as f:
        info_data = json.load(f)
        version = info_data["version"] or "0.0.0"
        mod_name = info_data["name"]

    folder_modified_time = get_last_modification_time(mod_folder)
    version_modified_time = os.path.getmtime(info_file)
    # Nothing has changed in this mod since last modification. Skip
    if version_modified_time == folder_modified_time:
        return version

    # Create mod folder in appdata folder if it doesn't exist yet
    appdata = os.getenv('APPDATA')  # Probably only works on windows?
    factorio_mod_folder = os.path.join(appdata, "Factorio", "mods", mod_name + "_" + version)
    if not os.path.exists(factorio_mod_folder):
        os.mkdir(factorio_mod_folder)

    # copy mod from repo over to appdata folder
    is_changed = copy_mod(os.path.join(mod_folder, "mod"), factorio_mod_folder)

    # change version number if things have changed
    if is_changed:
        # increase version number
        version_split = version.split(".")
        version_split[2] = str(int(version_split[2]) + 1)
        new_version = ".".join(version_split)

        print("New version for " + mod_name + ": " + new_version)

        new_factorio_mod_folder = os.path.join(appdata, "Factorio", "mods", mod_name + "_" + new_version)

        os.rename(factorio_mod_folder, new_factorio_mod_folder)

        factorio_info_file = os.path.join(new_factorio_mod_folder, "info.json")
        with open(factorio_info_file) as info:
            mod_info = json.load(info)
            mod_info["version"] = new_version
            mod_info["author"] = "LeonSkills"
            mod_info[
                "contact"] = "https://www.reddit.com/message/compose?to=LeonSkills&subject=RsFactorio" + mod_name + "_" + new_version
            mod_info["homepage"] = "https://github.com/LeonSkills/RsFactorio/tree/master/" + folder_name
            mod_info["factorio_version"] = "0.17"
            if utility_version is not None:
                mod_info["dependencies"].append("RsUtility >= " + utility_version)

        with open(factorio_info_file, "w") as f:
            json.dump(mod_info, f, indent=2)

        # write new version to folder
        with open(info_file, "w") as f:
            info_data["version"] = new_version
            json.dump(info_data, f, indent=2)

        return new_version
    return version


if __name__ == '__main__':
    main()
