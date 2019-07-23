
#RsFactorio

-----
READ AHEAD IF YOU WANT TO CONTRIBUTE

NOTE: Not tested on OS and LINUX systems, need people who can test it.  

Any and all code within this repo is not used and may not be used for any commercial ends  

This project creates a lot of concepts of RuneScape into Factorio with mods  
The mods can be found in the mods folder  
A mod_template folder is available to be copied over in the mods folder to create a new mod. Stick to this layout.  

# Issue Tracker

Use the issue tracker to make suggestions, report bugs and bring incompatibilities with other mods to my attention. 

-----------
# Building mods
Run `build_scripts/build_all.py` to create items and build the mods in the [application directory of Factorio](https://wiki.factorio.com/Application_directory). Currently only tested on windows systems \
This will check for any changes in each mod. If there are changes these are applied to the mod in the application directory, and the version is automatically increased.  
Items can be defined in `rs_items.json`. The build all will automatically fetch icons and data about the item from the [runescape wiki](https://runescape.wiki). The only fields that should be manually added are `stack_size`, `subgroup` and `order`.

# Contributing
Before contributing:
* Create a new issue if none exist yet
* Mention within the issue that you will be working on it
* Create a new branch from Develop called \<Issue-number\>-\<ModName\>-\<Issue-name\>. Issue name can be a short version if it is otherwise too long
* Increase the middle version number of the mod you are going to work on by one

Before creating a pull request into Develop make sure you did the following:

* Changed title, description and name in `mod/info.json`. Note that the name of the mod will be the one defined in `info.json` not the folder name
* Updated the CHANGELOG.md, preferably with the same message as the commit messages. See `mod_template/CHANGELOG.md` for examples
* Add yourself to the list of contributors in the DESCRIPTION.md

I might automate the latter two at some point if I figure out how and have time

# Disclaimer

Images from RuneScape have been directly taken from the wiki at [https://runescape.wiki](https://runescape.wiki), [https://oldschool.runescape.wiki](https://oldschool.runescape.wiki), the API's available at [https://runescape.com](https://runescape.com) or from screenshots in game. 

Some entities and icons have been taken and modified from the Factorio base game.  

These images belong to Jagex and Wube respectively. If any of these parties need me to remove them for legal reasons, please contact me [https://github.com/LeonSkills/](https://github.com/LeonSkills/)

