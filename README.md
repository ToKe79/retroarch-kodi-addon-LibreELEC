# RetroArch KODI add-on for LibreELEC / S905.arm builds
This script creates KODI add-on from Lakka sources for S905 devices. Still work-in-progress, resulting build has not been tested yet. Can be used to build also for other devices (e.g. S805, RPi, etc.), just change PROJECT/ARCH to your needs.

*Note: I did not have time yet to test the resulting builds, so it might happen, that LibreELEC will miss a library or two to run RetroArch or one of the cores. Please submit an [issue](https://github.com/ToKe79/retroarch_kodi_addon_LE_S905arm/issues/new) with the name of the missing library. To get the output from the start, just change this line in the build script:*
```
systemd-run \$ADDON_DIR/bin/retroarch.start
```
*to:*
```
systemd-run \$ADDON_DIR/bin/retroarch.start &> /storage/.config/retroarch/output.txt
```
*or modify the file `/storage/.kodi/addons/emulator.tools.retroarch/bin/retroarch.start` on the LibreELEC device.*

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
cd retroarch_kodi_addon_LE_S905arm
```

Edit the script `build_retroarch.sh` and change `LAKKA` to folder, where the Lakka repository was cloned, e.g. to:

```bash
LAKKA="/home/joe/repositories/Lakka-LibreELEC"
```

If you cloned to `src` folder in your home, you don't have to change `LAKKA`.

Check remaining variables and adjust them as required, but in most cases there is no need to change them.

Run the build script:

```bash
./build_retroarch.sh
```

First time the building/compiling process will take some time, when it is finished, you will have a file called `emulator.tools.retroarch.zip` in your folder. You can install this add-on in [KODI](http://kodi.wiki/view/HOW-TO:Install_add-ons_from_zip_files) (copy it to your LibreELEC device via scp). After the installation is successful, in add-on settings run the Script Permissions to make the add-on scripts and binaries executable.

You have to put BIOS files (see [Lakka documentation - BIOSes](http://www.lakka.tv/doc/BIOSes/)) to the `/storage/.config/retroarch/system` folder. This folder (and all other folders) will be created with the first start of RetroArch. *Never ask for BIOS files in IRC channels or formus of LibreELEC or Lakka!*

## Folders:

`/storage/.config/retroarch` is the root folder for RetroArch configurations. It includes the `retroarch.cfg` main configuration file and following subfolders:

`savestates` for storing the savestates

`savefiles` for storing the saves (e.g. memory card files)

`remappings` for storing remapped controls

`playlists` for storing RetroArch playlists - lists of games per emulated system

`system` put your BIOS files here

`thumbnails` Boxarts / Screenshots / Title screens will be stored here (use the online update in RetroArch to download these)

Put your ROM files to folder `/storage/roms`. You may put them in separate folders by systems, but it is not required by RetroArch.

Screenshots are stored in `/storage/screenshots`.

The add-on includes also following subfolders in the `resources` folder, so you don't have to download these:

`assets` contains wallpapers, themes, icons, fonts, etc.

`audio_filters` various audio filters

`database` contains subfolders `cht` (cheats), `cursors` (saved searches) and `rdb` (games databases for scanning your files)

`joypads` configuration files for autoconfiguration of attached joystics and gamepads

`overlays` for touch-devices only - on screen gamepad overlays

`shaders` various shaders to enhance the visuals of the emulated systems on current display devices

`video_filters` various video filters

The emulation cores are stored in `lib/libretro` subfolder of the add-on.

# Future
My dream is to create and host own KODI add-on repository to provide the RetroArch add-on for various LibreELEC devices.

# Credits
Thanks to [Lakka](http://lakka.tv) for their work.

Also thanks to [JoKeRzBoX](https://github.com/JoKeRzBoX) - I based my work on his [work](https://github.com/JoKeRzBoX/JoKeRzBoX_LibreELEC_Repo_S805).

