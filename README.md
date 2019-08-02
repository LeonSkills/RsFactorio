
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
Run `build_scripts/build_mods.py` to copy over the mods to the [application directory of Factorio](https://wiki.factorio.com/Application_directory). Currently only tested on windows systems  
This file accepts some arguments.  
* `build_scripts/build_mods.py --version patch` will increase the patch version in the version number. Will only increase the version number if changes are made. Do not change the major/minor version, only the patch.
* `build_scripts/build_mods.py --mods mod1 mod2 mod3` will only update mod1, mod2 and mod3. Case sensitive. 
* `build_scripts/build_mods.py' --force --mods mod1 mod2 mod3` will force increase the version numbers of mod1, mod2 and mod3, even if there were no changes made. `--mods` is required with this option to prevent accidentally increasing version number of all mods.  
* `build_scripts/build_mods.py --help` for more options/info.


Run `build_scripts/build_items.py` to create items as defined in `rs_items.json`. The will automatically fetch icons and data about the item from the [runescape wiki](https://runescape.wiki). 
The only fields that should be manually added are `stack_size`, `subgroup` and `order`. 
It creates lua code that will add the items in game.  

Both scripts can be run with `build_scripts/build_all.py`. This will accept the same arguments as `build_mods.py`.

# Contributing
Before contributing:
* Create a new issue if none exist yet
* Mention within the issue that you will be working on it/assign yourself
* Create a new branch from Develop called \<Issue-number\>-\<ModName\>-\<Issue-name\>. Issue name can be a short version if it is otherwise too long

Before creating a pull request into Develop make sure you did the following:

* Changed title, description and name in `mod/info.json`. Note that the name of the mod will be the one defined in `info.json` not the folder name
* Updated the changelog.txt, preferably with the same message as the commit messages. See `mod_template/mod/changelog.txt` for layout. 
* Have the version number increased by at least one. Make sure the changelog mentions this version.  
* Add yourself to the list of contributors in the DESCRIPTION.md
* Added the correct dependencies in `mods/dependencies.json`


# Disclaimer

Images from RuneScape have been directly taken from the wiki at [https://runescape.wiki](https://runescape.wiki), [https://oldschool.runescape.wiki](https://oldschool.runescape.wiki), the API's available at [https://runescape.com](https://runescape.com) or from screenshots in game. 

Some entities and icons have been taken and modified from the Factorio base game.  

These images belong to Jagex and Wube respectively. I do not own them. You are not allowed to distribute, modify or use pictures found in this project for public use without my permission.   
If any of these parties need me to remove them for legal reasons, please contact me [https://github.com/LeonSkills/](https://github.com/LeonSkills/)

