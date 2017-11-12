# RetroArch KODI addon for LibreELEC / S905.arm builds
This script creates KODI addon from Lakka sources for S905 devices.

# Usage
Go to the folder, where you keep source code, e.g. if `src` folder in your home folder, then:

```bash
cd ; cd src
```

Or make a `src` folder in your home, if it does not exist:

```bash
cd ; mkdir src ; cd src
```

Clone the Lakka-LibreELEC repository:

```bash
git clone https://github.com/libretro/Lakka-LibreELEC
cd Lakka-LibreELEC
```

Edit `config/path` file - uncomment like this:

```
# Uncomment this line to ignore version when building
BUILD=$ROOT/$BUILD_BASE.$DISTRONAME-${DEVICE:-$PROJECT}.$TARGET_ARCH
```

This will make sure, that when the version changes, the build subfolder, which will be created by the first compilation, will be re-used.

Clone this repository:

```bash
cd ..
git clone https://github.com/ToKe79/retroarch_kodi_addon_LE_S905arm
cd retroarch_kod_addon_LE_S905arm
```

Edit the script `build_retroarch.sh` and change `LAKKA` to folder, where the Lakka repository was cloned, e.g. to:

```bash
LAKKA="/home/joe/Lakka-LibreELEC"
```

Check remaining variables and adjust them as required, but in most cases there is no need to change them.

Run the build script:

```bash
./build_retroarch.sh
```

First time the building/compiling process will take some time, when it is finished, you will have a file called `emulator.tools.retroarch` in your folder. You can install this addon in LibreELEC (copy it to your LibreELEC device via scp or samba). After the installation is successful, in add-on settings run the Script Permissions to make addon scripts and binaries executable.

You have to put BIOS files (see [Lakka documentation - BIOSes](http://www.lakka.tv/doc/BIOSes/)) to the `/storage/.config/retroarch/system` folder. This folder (and all other folders) will be created with the first start of RetroArch.

##Folders:

`/storage/.config/retroarch` is the root folder for RetroArch configurations. It includes the `retroarch.cfg` main configuration file and following subfolders:

`savestates` For storing the savestates

`savefiles` For storing the saves (e.g. memory card files)

`remappings` For storing remapped controls

`playlists` For storing RetroArch playlists - lists of games per emulated system

`system` Put your BIOS files here

`thumbnails` Boxarts / Screenshots / Title screens will be stored here (use the online update in RetroArch to download these)

Put your ROM files to folder `/storage/roms`. You may put them in separate folders by systems, but it is not required by RetroArch.

Screenshots are stored in `/storage/screenshots`.

The addon includes also following subfolders in the `resources` folder:

`assets` Contains wallpapers, themes, icons, fonts, etc.

`audio_filters` Various audio filters

`database` Contains subfolders `cht` (cheats), `cursors` (saved searches) and `rdb` (games databases for scanning your files)

`joypads` Configuration files for autoconfiguration of attached joystics and gamepads

`overlays` For touch-devices only - on screen gamepad overlays

`shaders` Various shaders to enhance the visuals of the emulated systems on current display devices

`video_filters` Various video filters

The emulation cores are stored in `lib/libretro` subfolder of the add-on.

# Credits
Thanks to [Lakka](http://lakka.tv) for their work.

Also thanks to [JoKeRzBoX](https://github.com/JoKeRzBoX) - I based my work on his [work](https://github.com/JoKeRzBoX/JoKeRzBoX_LibreELEC_Repo_S805).

