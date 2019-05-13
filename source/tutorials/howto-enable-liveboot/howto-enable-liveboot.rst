.. _Howto_Enable_Live_Boot:

Howto enable live boot:
=======================

The live boot feature allow the user to flash a live boot image to a USB disk, and boot from this USB disk to Android directly without install Android to internal storage at first.

In order to use live boot, in general use the following steps: 1. Build a live boot image.  2. Flash this image to a USB disk.  3. Boot from this USB disk to Android directly.

In Celadon, we just build a GPT disk image, and flash it to a USB disk, like install the Android to the USB disk, then boot the Android from this USB disk. Use this solution, we can support full features, except some security features need hardware binding.

Step by step guide:
-------------------

1. Build a live boot image:

   Follow the general steps to prepare for the local development and download the source code.

   Add the **'KERNELFLINGER_SUPPORT_USB_STORAGE=true'** when build the images.

   This option can let the kernelflinger to support load Android from USB disk, it is needed by support USB live boot.

   Use the following command to build a live boot image:
     make SPARSE_IMG=true **KERNELFLINGER_SUPPORT_USB_STORAGE=true** **gptimage** -j 10

   You can change the '-j 10' to other value according your server CPU cores.

   After build successfully, then you can get a out/target/product/[lunch_target]/[lunch_target_gptimage.img. Such as out/target/product/cel_kbl/cel_kbl_gptimage.img if you use cel_kbl lunch target.

   This image size is 14GB. It is an image of a whole gpt disk.

   You can change the device/intel/project-celadon/[luch_target]/mixins.spec following line to change the image size:

     gptbuild: true(size=14G,generate_craff=false)

2. Flash this image to a USB disk.

   Prepare for a USB disk with 16GB size or above.

   In linux, use tool 'dd' to simple flash this image file to the USB disk. For example:
     dd if=cel_kbl_gptimage.img of=/dev/sdc bs=1M

     Note: You MUST change the '/dev/sdc' to the real USB disk device.

   In Windows, use tool 'rufus' to falsh this image file to the UBS disk.

   Note: please make sure all the buffered data are written to USB disk before plug out the USB disk, such as run 'sync' command in Linux.

3. Boot from this USB disk to Android directly.

   Plugin this USB disk, then power on, and press some function key to enter BIOS boot menu, select boot from this USB disk.

   Then can boot to Android directly.

   If you save some data to this Android, it will be saved to this USB disk, and you can try to use it in other computer.


Note:
-----
1. If you already install Android in the internal storage, please disable the internal storage if you want to try USB live boot.
2. If you want to use one USB disk in two computers, then make sure the lock status are same in the two computers.
