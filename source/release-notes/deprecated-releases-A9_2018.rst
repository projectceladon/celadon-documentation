.. _deprecated-releases-A9_2018:

Android 09 [2018] Deprecated Releases
#####################################

.. contents::
   :local:
   :depth: 1


ww201852_KBLNUC
===============

================================  =====
Build ID                          cel_apl-userdebug 9 PPR2.181005.003.A1 eng.build.20190102.114437 test-keys
Software Version                  Android version 9
Mesa                              18.2.6
Kernel Version                    4.19
Manifest Link                     https://github.com/projectceladon/manifest/blob/master/stable-build/ww201852.xml
================================  =====

Important note
--------------
* This is a Pre-Production Release for evaluation and development purpose and it cannot be used for production purposes.


Integrated Features
-------------------

* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.0 support for Display
* Adb & Fastboot supported over USB 2.0 and USB 3.0
* Adb over WIFI and Ethernet is supported
* USB digital audio playback support
* Since no default sound card is present we should connect USB headsset for any BT or media related activities for KBL COMMERCIAL NUC hardware
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Android Kernelflinger boot support
* Thermal Daemon is enabled for CELADON
* 4K support is enabled on CELADON
* Video Codec support on celadon

  Decoder

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  Encoder

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)
* Art-extension is enabled in CELADON
* f2fs filesystem support enabled
* S3 Suspend/Resume is supported
* Audio decoders supported: MP3/AAC-LC/HEAAC/HEAAC-v2/FLAC/VORBIS/OPUS/AMRNB/AMRWB
* Audio Encoders: AAC-LC, AAC ELD, HEAAC, AMR-NB, AMR-WB, WAV
* SDHCI host controller is enabled
* Security reference solution - TPM based h/w binding reference implementation


Important notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       BT is working
Audio over USB                 OK       MP3/AAC/MIDI/FLAC/WAV Audio playback
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Display /Touch and Gesture     OK
Storage/SD Card                OK
Security                       OK
Boot/Kernel                    OK
USB devices over OTG           OK
Ethernet                       OK
Fastboot                       OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG4/VP8/VP9 Video Playback
=============================  =======  ========


Known issues
------------

* UI Flicker observed in few Screens for example - Under AOSP settings .
* Bluetooth file transfer fails in the first attempt after DUT reboot and it works fine once BT is reset
* Lets Drive screen seen, on click of applications under "New User"
* While executing DEPQ CTS  , at a certain point there is adb disconnect observed where the DUT freezes , however once the adb is reconnected the test continues but the DUT is frozen
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

--------

Status
-------

* This WW52 Release has achieved 99.99% CTS pass rate .


ww201851_KBLNUC
===============

================================  =====
Build ID                          cel_apl-userdebug 9 PPR2.181005.003.A1 eng.build.20181227.102437 test-keys
Software Version                  Android version 9
Mesa                              18.2.6
Kernel Version                    4.19
Manifest Link                     https://github.com/projectceladon/manifest/blob/master/stable-build/ww201851.xml
================================  =====

Important note
--------------
* This is a Pre-Production Release for evaluation and development purpose and it cannot be used for production purposes.


Integrated Features
-------------------

* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.0 support for Display
* Adb & Fastboot supported over USB 2.0 and USB 3.0
* Adb over WIFI and Ethernet is supported
* USB digital audio playback support
* Since no default sound card is present we should connect USB headsset for any BT or media related activities for KBL COMMERCIAL NUC hardware
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Android Kernelflinger boot support
* Thermal Daemon is enabled for CELADON
* 4K support is enabled on CELADON
* Video Codec support on celadon

  Decoder

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  Encoder

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)
* Art-extension is enabled in CELADON
* f2fs filesystem support enabled
* S3 Suspend/Resume is supported
* Audio decoders supported: MP3/AAC-LC/HEAAC/HEAAC-v2/FLAC/VORBIS/OPUS/AMRNB/AMRWB
* Audio Encoders: AAC-LC, AAC ELD, HEAAC, AMR-NB, AMR-WB, WAV
* SDHCI host controller is enabled
* Security reference solution - TPM based h/w binding reference implementation


Important notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       Bluetooth is working
Audio over USB                 OK       MP3/AAC/MIDI/FLAC/WAV Audio playback
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Display /Touch and Gesture     OK
Storage/SD Card                OK
Security                       OK
Boot/Kernel                    OK
USB devices over OTG           OK
Ethernet                       OK
Fastboot                       OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG4/VP8/VP9 Video Playback
=============================  =======  ========


Known issues
------------

* UI Flicker observed in few Screens for example - Under AOSP settings .
* Bluetooth file transfer fails in the first attempt after DUT reboot and it works fine once BT is reset
* Lets Drive screen seen, on click of applications under "New User"
* While executing DEPQ CTS  , at a certain point there is adb disconnect observed where the DUT freezes , however once the adb is reconnected the test continues but the DUT is frozen
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

--------

Status
-------

* This WW51 Release has achieved 99.97% CTS pass rate and we are trending to achieve 100% CTS pass rate that we will be announcing shortly .. STAY TUNED.

---------------

ww201851_APLNUC
===============

================================  =====
Build ID                          cel_apl-userdebug 9 PPR2.181005.003.A1 eng.build.20181227.102437 test-keys
Software Version                  Android version 9
Mesa                              18.2.6
Kernel Version                    4.19
manifest Link                     https://github.com/projectceladon/manifest/blob/master/stable-build/ww201851.xml
================================  =====

Important note
--------------
* This is a Pre-Production Release for evaluation and development purpose and it cannot be used for production purposes.


Integrated Features
-------------------

* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.0 support for Display
* Adb & Fastboot supported over USB 2.0 and USB 3.0
* Adb over WIFI and Ethernet is supported
* USB digital audio playback support
* DMIC support
* Realtek ALC283 HD Audio via a stereo microphone/headphone 3.5 mm jack on the front panel is supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Android Kernelflinger boot support
* Thermal Daemon is enabled for CELADON
* 4K support is enabled on CELADON
* Video Codec support on celadon

  Decoder

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps) (Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  Encoder

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)
* Art-extension is enabled in CELADON
* f2fs filesystem support enabled
* S3 Suspend/Resume is supported
* Audio decoders supported: MP3/AAC-LC/HEAAC/HEAAC-v2/FLAC/VORBIS/OPUS/AMRNB/AMRWB
* Audio Encoders: AAC-LC, AAC ELD, HEAAC, AMR-NB, AMR-WB, WAV
* SDHCI host controller is enabled
* Security reference solution - TPM based h/w binding reference implementation


Important notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC6CAYH  <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       Bluetooth is working
Audio over 3.5mm jack          OK       MP3/AAC/MIDI/FLAC/WAV Audio playback
Audio over USB                 OK       MP3/AAC/MIDI/FLAC/WAV Audio playback
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Display /Touch and Gesture     OK
Storage/SD Card                OK
Security                       OK
Boot/Kernel                    OK
USB devices over OTG           OK
Ethernet                       OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG4/VP8/VP9 Video Playback
=============================  =======  ========


Known issues
------------

* DUT freezes while using 4k monitor as display
* Lets Drive screen seen on click of applications under "New User"
* Need to press power button twice to wake-up from S3"
* Basic Functionality of VGA port works like multidisplay support but there are issues with hotplug and some new Video Post Processing features (adjust Hue/Contrast/Saturation of video)
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

Status
-------
* APL_NUC validation is done until WW48 , the manifest is taken based on WW51
* BIOS public drop for APL_NUC is available , Adb & Fastboot is supported over USB 2.0 and USB 3.0
* BIOS Link : https://downloadcenter.intel.com/download/28478/?product=95078
* BIOS_Release Notes: https://downloadmirror.intel.com/28478/eng/AY_0059_ReleaseNotes.pdf

--------

ww201840
========

================================  =====
Build ID                          cel_apl-userdebug 9 PPR1.180610.011 eng.build 20181003.120126 test-keys
Software Version                  Android version 9
Mesa                              18.2.0-rc4
Kernel Version                    4.14.67
Manifest Link                     https://github.com/projectceladon/manifest/blob/master/stable-build/ww201840.xml
================================  =====

Important note
--------------
* This is a Pre-Production Release for evaluation and development purpose and it cannot be used for production purposes.

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
* Android Kernelflinger boot support
* Thermal Daemon is enabled for CELADON
* Media sdk 4K support is enabled on CELADON
* Art-extension is enabled in CELADON
* f2fs filesystem support enabled

Important notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC6CAYH  <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
BT                             OK       Bluetooth is working
Audio over USB                 OK       MP3/AAC/MIDI/FLAC/WAV Audio playback
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


Known issues
------------

* Backlight on/off is not working
* Media is not getting paused after disconnecting USB headset
* Video playback works. Hangs observed on some random runs
* ADB over USB is not enabled due to lack of device mode
* Basic Functionality of VGA port works like multidisplay support but there are issues with hotplug and some new Video Post Processing features (adjust Hue/Contrast/Saturation of video)
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key
