# Error on < Android 8.
if [ "$API" -lt 26 ]; then
    abort "- !!! You can't use this module on Android < 8.0"
fi

# PIF module is obsolete and it's incompatible with PIF.
if [ -d /data/adb/modules/playintegrityfix ]; then
	rm -rf /data/adb/modules/playintegrityfix
    ui_print "- ! PIF module will be removed. Do NOT install it again along safetynet-fix."
fi

# MagiskHidePropsConf module is obsolete in Android 8+ but it shouldn't give issues.
if [ -d /data/adb/modules/MagiskHidePropsConf ]; then
    ui_print "- ! WARNING, MagiskHidePropsConf module may cause issues with safetynet-fix."
fi

# Remove xiaomi.eu apps

if [ -d "/product/app/XiaomiEUInject" ]; then
	
	directory="$MODPATH/product/app/XiaomiEUInject"

	[ -d "$directory" ] || mkdir -p "$directory"

	touch "$directory/.replace"
		
	ui_print "- XiaomiEUInject app removed."
fi
	
if [ -d "/system/app/XInjectModule" ]; then
	
	directory="$MODPATH/system/app/XInjectModule"

	[ -d "$directory" ] || mkdir -p "$directory"

	touch "$directory/.replace"
		
	ui_print "- XInjectModule app removed."
fi