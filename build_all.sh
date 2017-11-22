#!/bin/bash
[ -z "$VERSION" ] && VERSION=$(date +%Y%m%d.%H%M%S)
BUILDS="S905 S805 S8X2 Generic RPi RPi2 imx6 Allwinner Rockchip WeTek_Core WeTek_Hub WeTek_Play WeTek_Play_2 OdroidC1 Odroid_C2 OdroidXU3 Gamegirl"
ARCH_default="arm"
ARCH_Generic="x86_64 i386"
DEVICE_default=""
DEVICE_Rockchip="TinkerBoard ROCK64 MiQi"
SCRIPT="retroarch-kodi.sh"
for p in $BUILDS ; do
	for v in ARCH DEVICE ; do
		vp=$v"_$p"
		vd=$v"_default"
		[ -n "${!vp}" ] && declare p_$v="${!vp}" || declare p_$v="${!vd}"
	done
	for a in $p_ARCH ; do
		if [ -z "$p_DEVICE" ] ; then
			VERSION=$VERSION PROJECT=$p ARCH=$a ./$SCRIPT
		else
			for d in $p_DEVICE ; do
				VERSION=$VERSION PROJECT=$p ARCH=$a DEVICE=$d ./$SCRIPT
			done
		fi
	done
done
