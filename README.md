
#RsFactorio

-----
READ AHEAD IF YOU WANT TO CONTRIBUTE

NOTE: Not tested on OS and LINUX systems, need people who can test it.  

Any and all code within this repo is not used and may not be used for any commercial ends  

This project creates a lot of concepts of RuneScape into Factorio with mods  
The mods can be found in the mods folder  
A mod_template folder is available to be copied over in the mods folder to create a new mod  

# Suggestions

If you have any suggestions please add them as an issue. 

-----------
# Building mods
Run `build/build_mods.py` to create the mods in the [application directory of Factorio](https://wiki.factorio.com/Application_directory). Currently only tested on windows systems
This will check for any changes in each mod. If there are changes these are applied to the mod in the application directory, and the version is automatically increased.  

# Contributing
Before contributing:
* Create a new issue if none exist yet
* Mention within the issue that you will be working on it
Create a new branch from Develop called <ModName>-<Issue-name>-<Issue-number>. Issue name can be a short version if it is otherwise too long

Before creating a pull request into Develop make sure you did the following:

* Change title, description and name in `mod/info.json`. Note that the name of the mod will be the one defined in `info.json` not the folder name
* Updated the CHANGELOG.md, preferably with the same message as the commit messages. See `mod_template/CHANGELOG.md` for examples
* Add yourself to the list of contributors in the DESCRIPTION.md
* In `info.json` increase the middle version number (the second) to one higher than the current version in Develop and set the minor version (the third) to 0. In case of multiple pull requests I will adjust the minor version myself

I might automate the latter three at some point if I figure out how
