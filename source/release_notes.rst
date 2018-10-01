.. _release_notes:

Release Notes
#############

.. contents:: :local:


--------

ww201840
========

================================  =====
Build ID                          cel_apl-userdebug 9 PPR1.180610.011 eng.build 20181003.120126 test-keys 
Software Version                  Android version 9
Mesa                              18.2.0-rc4
Kernel Version                    4.14.67
Download Link                     https://github.com/projectceladon/celadon-binary/tree/master/ww201840
================================  =====

Integrated Features
-------------------

* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.0 support for Display
* USB digital audio playback support
* Analog Audio (MP3/AAC) playback on stereo wired Headset
* Audio parameter framework for audio routing policy
* Wi-Fi 802.11 a/b/g/n
* Wired Ethernet support
* Android Grub boot support
* Android Kernel Flinger boot support
* Thermal Daemon is enabled for CELADON
* Media sdk 4K support is enabled on CELADON
* Art-extension is enabled in CELADON
* f2fs filesystem support enabled

Important Notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC6CAYH  <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
BT                             OK       File Transfer Protocol
Audio over USB and             OK       MP3/AAC/MIDI/FLAC/WAV Audio playback
Audio over 3.5mm jack          OK       MP3/AAC/MIDI/FLAC/WAV Audio playback
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Display /Touch and Gesture     OK
Storage/SD Card                OK
Security                       OK
Boot/Kernel                    OK
USB devices over OTG           OK
Fastboot                                Not available
GRUB Boot                      OK
Web browsing                   OK
SD card                        OK
=============================  =======  ========


Known Issues
------------

* Backlight on/off is not working 
* Media is not getting paused after disconnecting USB headset 
* System hangs observed while playing Video formats
* ADB over USB is not working 

--------

