.. _boot-civ-bare-metal:

Boot CiV on Bare Metal
######################

This article describes the steps to run a Celadon CIV image on bare
metal using an Intel® NUC.

Prerequisites
*************

-  Intel NUC model `NUC11PAQI7 <https://www.intel.in/content/www/in/en/products/details/nuc/kits.html>`__

-  Type-C cable for display

-  USB flash drive, formatted as FAT 32

-  USB headphone

-  3.5mm jack headphone

-  Bluetooth® device to test connectivity

-  Wireless access point or hotspot to test Wi-Fi\* connectivity

-  Wi-Fi device (such as laptop, smartphone, or tablet) to test the NUC
   serving as a hotspot.

Steps to sync to latest HEAD for bare metal
*******************************************

Run the following commands to sync to the approved release and run CiV
on bare metal.

1. repo init -u `https://github.com/projectceladon/manifest <https://github.com/projectceladon/manifest>`__ -b celadon/r/mr0/stable

2. repo sync -c -q -j${nproc}

3. Cherry-pick the following patch:

   `*https://github.com/projectceladon/device-androidia/pull/1285* <https://github.com/projectceladon/device-androidia/pull/1285>`__

4. This is using Yocto as the Guest Kernel.


Build steps on the latest HEAD
==============================

1. source build/envsetup.sh

2. lunch caas-userdebug

3. make BASE_LTS2020_YOCTO_KERNEL=true flashfiles -JN
   this is for
   `NUC11PAQI7 <https://www.intel.in/content/www/in/en/products/details/nuc/kits.html>`__ as Bare Metal.

Flashing a CIV image as bare metal
**********************************

1. Unzip flashfiles zip file to U disk. ( Be sure to format the U disk
   as FAT32 mode).

2. Insert U disk to the NUC and power on the NUC.

3. Press F2 to go into BIOS, select Boot -> Boot Priority -> Internal
   UEFI Shell, and then save it.

4. Power on again and press F10, select “UEFI : Built-in UEFI Shell”.

5. It can auto flash and boot up after the flashing is successful.

Steps to collect serial logs on bare metal for debugging boot issues
******************************************************************************

.. note::
	Device's with debug port only will support serial log collection

1. Connect SUT to Ubuntu machine via micro USB port on board to USB type-A port on Ubuntu machine.

2. If minicom is not already installed, install minicom on Ubuntu:$ sudo apt install minicom

3. Run "sudo minicom -D /dev/ttyUSB0" (default baud rate 115200 it uses) 
   Please make sure ttyUSB0 is available, or use relevant ttyUSBx.
   Logs will be printed on screen during target device reboot.

Sanity Results
**************

Confirm that you are able to boot as bare metal on
`NUC11PAQI7 <https://www.intel.in/content/www/in/en/products/details/nuc/kits.html>`__
(with a type-C cable to drive your display) by testing the following
components:

+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Test these components     |   Component type           |   By running these commands                                                                    |   Expected results                                                                              |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Connectivity              | Wi-Fi                      | Wi-Fi basic on/off, scan, and connect. Run  `speedtest.net  <https://www.speedtest.net/>`__.   | Network found and connected. Ping time and network speed are acceptable for your network.       |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|                             | Bluetooth                  | Bluetooth turn on/off, scan, and connect                                                       | Device found and connection made.                                                               |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Media                     | Audio (USB)                | Check audio output through USB headphone                                                       | Sound is audible.                                                                               |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Media                     | Audio (3.5mm)              | Check audio output through 3.5mm headphone                                                     | Sound is audible.                                                                               |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Audio                     | sound                      | Settings->Sound                                                                                | Sound level has acceptable range.                                                               |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | (volume adjustment)                                                                            |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   ADB                       | External Storage           | 1. adb connect IP:5555                                                                         | Contents of external device are detected.                                                       |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 2. adb root                                                                                    |                                                                                                 |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 3. adb connect IP:5555                                                                         |                                                                                                 |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 4. adb push <files> /sdcard/                                                                   |                                                                                                 |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 5. adb shell                                                                                   |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   USB                       | ADB                        | Settings -> Storage                                                                            | Contents of the USB disk are detected.                                                          |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | (Read USB Disk)                                                                                |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Security lock             | PIN/password/pattern       | Settings -> Security                                                                           | Correct PIN/password/pattern unlocks access. Incorrect PIN/password/pattern denies access.      |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | Set lock screen type to PIN, then password, and finally pattern.                               |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Reboot                    | ADB over ethernet          | 1. adb connect IP:5555                                                                         | NUC reboots.                                                                                    |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 2. adb reboot                                                                                  |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Web browsing              | Browsing                   | Browsing via ethernet                                                                          | Websites, such as  `www.intel.com  <http://www.intel.com>`__, can be accessed.                  |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Settings                  | Enable developer options   | Settings -> About tablet (Click the build number seven times in a row)                         | Developer options added to Settings.                                                            |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | Settings -> System -> Advanced                                                                 |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Playback                  | Video playback             | 1. Push video clip to device sdcard directory and then reboot.                                 | Video plays well.                                                                               |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 2. adb connect IP:5555                                                                         |                                                                                                 |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 3. adb push <video files> /sdcard                                                              |                                                                                                 |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 4. adb reboot                                                                                  |                                                                                                 |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | 5. play video with Photos App                                                                  |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Type C port               | Verify type C port         | Can be verified by Type-C display cable                                                        | Video display has appropriate level of quality.                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Reconnect                 | WI-FI                      | Connect to WI-FI, then reboot.                                                                 | Wi-Fi reconnects automatically.                                                                 |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | WI-FI should reconnect after reboot.                                                           |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Hotspot                   | Wi-Fi hotspot              | Settings-> Network->Hotspot                                                                    | NUC hotspot found and connected. Ping time and network speed are acceptable for your network.   |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Display                   | HDMI display               | With a type C port, the display works correctly.                                               | Video displays correctly.                                                                       |
|                             |                            |                                                                                                |                                                                                                 |
|                             |                            | On NUC with one HDMI port, the display works correctly.                                        |                                                                                                 |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
|   Factory reset             |                            | Settings-> System->Advanced->Reset Options->Erase all data                                     | System resets.                                                                                  |
+-----------------------------+----------------------------+------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
