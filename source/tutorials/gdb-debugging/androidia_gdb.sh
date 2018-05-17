#!/bin/bash

if [ -z $ANDROID_PRODUCT_OUT ]; then
	echo "Run source build/envsetup.sh and lunch <target> before executing this script"
	exit
fi

PROCNAME=
FILE=
if [ $# -lt 1 ]; then
    echo -n "Enter the name of process to debug on android side: "
    read tmp
    PROCNAME=tmp
else
    PROCNAME=$1
fi

FILE=$(find $ANDROID_PRODUCT_OUT/{system,vendor} -name $PROCNAME)
FILE=$(echo $FILE | sed -e "s|$ANDROID_PRODUCT_OUT/||")

if [ -z $FILE ]; then
	echo "Unable to find exectuable in vendor/system"
	echo "exiting..."
	exit
fi

PROCPID=$(adb shell pidof "$PROCNAME")
echo $PROCPID

echo "set auto-load safe-path /" > ~/.gdbinit
echo "file $ANDROID_PRODUCT_OUT/$FILE" > .gdbinit
echo "symbol-file $ANDROID_PRODUCT_OUT/symbols/$FILE" >> .gdbinit
echo "set sysroot $ANDROID_PRODUCT_OUT/symbols" >> .gdbinit
echo "set solib-search-path $ANDROID_PRODUCT_OUT/symbols/vendor/lib64:$ANDROID_PRODUCT_OUT/symbols/system/lib64:$ANDROID_PRODUCT_OUT" >> .gdbinit
echo "target remote localhost:6000" >> .gdbinit

adb shell gdbserver64 :6000 --attach "$PROCPID" &
adb forward tcp:6000 tcp:6000
gdb
