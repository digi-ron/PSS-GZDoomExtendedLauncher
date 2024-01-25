# PSS-GZDoomExtendedLauncher
 Simple and configurable GZDoom launcher for Windows, with separation of save files and portable config

## Purpose
The purpose of this solution is simple: I wanted a configurable interface with which I could launch any version of DOOM WAD, without needing some third party launcher which hadn't been updated since forever, with basic savefile management and portable use baked in. This all started as a hobby project for myself but I figure someone else might like something like this.

Also I like being able to launch things through a interactive style CLI if I need something... that one's pure personal preference

## Limitations
- The double-edged elephant in the room is the obvious one: these scripts won't auto-detect a damn thing. I wanted that as auto-detection of PWADS gets messy if you download a mod with WAD files as additional resources for a mod etc., but if that's what you're looking for I'm afraid I can't help
- I kept all the WAD and pk3 file references in the same directory as the GZDoom instance. I intend on improving this but if you're reading this then I haven't gotten around to it yet (or I hit an issue trying)
- requires powershell to have execution policy set to something other than restricted. I'm a harbinger of chaos and set mine to unrestricted on everything other than my personal rig, but you can probably do something safer.
- the config files are essentially ```|``` separated text files, instead of something probably "safer" like xml. I have no excuse for this except laziness, and a hatred of having to add everything as a tag for something I whipped up over a weekend essentially
- at the end of the day I only tested this with 2 big mods, Brutal Doom, and Project Brutality, as the former has been abandoned and I wanted to see what the new shiny was. *In theory* this should work with any other mod but *realistically* I haven't tested that

## Instructions
1. download [GZDoom](https://zdoom.org/downloads) and place the files from the zip download into the Engine folder
1. download any IWAD files you need (if you're looking to go free, might I suggest [Freedoom](https://github.com/freedoom/freedoom/releases/latest)?)
1. add any of the files you wish to add into the Engine folder alongside the GZDoom executable
1. download any PWAD files you need (some of the best ones can still be found [On the doomworld forums](https://www.doomworld.com/idgames/))
1. add any of the PWAD files you wish to add into the Engine folder alongside the GZDoom executable
1. [configure the mod files](#file-syntaxes)
1. run the launcher using ```_RUN.bat```
1. done

## file syntaxes
Included in this repo is a [MODS.txt](./MODS.txt) and [PWADS.txt](./PWADS.txt). I have left them populated to serve as an example of what these config files should look like, but if you'd like more information, this can be found below:

### MODS.txt
This file is the file for any mod files that can be used (e.g Project_Brutality-master.zip). the Syntax for each line of this file is as follows:
```
Friendly Name|DOOM.WAD|savefileLoc
```
- Friendly Name: exactly what it says, just the name to remember what the WAD *actually is*
- DOOM.WAD: the IWAD file to be loaded. This file must be in the Engine folder, but can have any extension (.pk3, .zip, etc.)
- savefileLoc: the location for the save files to be stored (as larger mods break eachothers saves I discovered). Note that this is relative to the location of this directory, *not* within the Engine directory like everything else

### PWADS.txt
This file is the file for any PWAD and IWAD files that can be used (e.g. AV.WAD and DOOM2.WAD). the syntax for each line of this file is as follows:
```
Friendly Name|PWAD.WAD|DOOM2.WAD
```
- Friendly Name: exactly what it says, the user recognizable name for the PWAD file
- PWAD.WAD: also pretty much what it says, the filename for the PWAD file to be loaded. Generally this is a mappack with additional textures such as AV.WAD
- DOOM2.WAD: the IWAD to be used. Ideally this is going to be something such as freedoom1.wad or DOOM2.WAD