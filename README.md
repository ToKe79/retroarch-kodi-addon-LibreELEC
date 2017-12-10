# RetroArch KODI add-on for LibreELEC
This script creates KODI add-on from Lakka sources for LibreELEC devices. Still work-in-progress, resulting builds have not been tested yet. Default build is for S905 ARM devices.

*Note: I did not have time yet to test the resulting builds, so it might happen, that LibreELEC will miss a library or two to run RetroArch or one of the cores. Please submit an [issue](https://github.com/ToKe79/retroarch-kodi-addon-LibreELEC/issues/new) with the name of the missing library.*

Builds for testing / testing repository can be found [here](https://www.vudiq.sk/repository_kodi/). Currently available builds:
- Generic PC (64-bit)
- RPi
- RPi2
- Odroid C2
- imx6 devices
- WeTek Core
- WeTek Hub
- WeTek Play
- WeTek Play 2
- S8X2 devices
- S805 devices
- S905 / S905X devices

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
git clone https://github.com/ToKe79/retroarch-kodi-addon-LibreELEC
cd retroarch-kodi-addon-LibreELEC
```

Edit the script `retroarch-kodi.sh` and change `LAKKA` to folder, where the Lakka repository was cloned, e.g. to:
```bash
LAKKA="/home/joe/repositories/Lakka-LibreELEC"
```
If you cloned to `src` folder in your home, you don't have to change `LAKKA`.

Check remaining variables and adjust them as required, but in most cases there is no need to change them.

Run the build script:
```bash
./retroarch-kodi.sh
```

Examples for other devices (the project/device/system/architecture must be the same, as you use on the LibreELEC device):
```bash
PROJECT=Generic ARCH=x86_64 ./retroarch-kodi.sh     # build for generic 64-bit PC
PROJECT=RPi ARCH=arm ./retroarch-kodi.sh            # build for Raspberry Pi
PROJECT=S805 ARCH=arm ./retroarch-kodi.sh           # build for devices with S805 SoC
```
First time the building/compiling process will take some time (the first package will look like it is compiling really long, but in the background the whole toolchain is being compiled), when it is finished, you will have the result stored in the folder defined in `REPO_DIR`. You can install this add-on in [KODI](http://kodi.wiki/view/HOW-TO:Install_add-ons_from_zip_files) (copy the ZIP file to your LibreELEC device via scp or samba). After the installation is successful, in add-on settings run the Script Permissions to make the add-on scripts and binaries executable.

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

Also thanks to [JoKeRzBoX](https://github.com/JoKeRzBoX) - I based my work on his [work](https://github.com/JoKeRzBoX/JoKeRzBoX_LibreELEC_Repo_S905).

