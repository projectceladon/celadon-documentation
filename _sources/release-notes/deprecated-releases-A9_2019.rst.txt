.. _deprecated-releases-A9_2019:

Android 09 [2019-2020] Deprecated Releases
##########################################

.. contents::
   :local:
   :depth: 1


CELADON_01.20.01.12_A09
=======================

* This is a Pre-Production Release for evaluation and development purpose
  and it cannot be used for production purposes. This release is supported
  on Intel Platform and Kaby Lake |NUC| (NUC7i5DNHE) is the leading platform
  for PMR0 Bare Metal .


Features
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
* HDMI audio playback is enabled
* SDHCI host controller is enabled
* Security reference solution - TPM based h/w binding reference implementation
* Selinux: enabled the neverallow check for selinux

     * User guide:

        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging

* Currently HDMI with stereo is enabled by default to support HDMI audio playback as there is no support for channel map, card and device detection from kernel space.

   * To test the multichannel 5.1 channel playback, use setprop vendor.audio.hdmi_multichannel 1 from adb shell and make sure to unplug and re-plug HDMI device before testing . On commercial NUC currently HDMI device port 3 is enabled.

Known issues
------------

* Lets Drive screen seen, on click of applications under "New User"
* saved system time changes to default after reboot

Validation results
------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK
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
Video playback                 OK       H264/H265/MPEG2/VP8/VP9 Video Playback
=============================  =======  ========


Helpful Hints/Links
-------------------
* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CELADON_01.20.01.12_A09.xml
* Binary Link :   https://github.com/projectceladon/celadon-binary/blob/master/CELADON_01.20.01.12_A09/cel_kbl-flashfiles-eng.build.zip
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

---------------

21-Oct-2019
============

.. note::
    * Android Q is supported on Intel Platform and Apollo Lake NUC (`NUC6CAYH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_) is the leading platform for IVI configuration (lunch target: ``celadon_ivi``).
    * This is a Pre-Production binary Q Release for evaluation and development purposes and it cannot be used for production purposes.
    * Manifest : https://github.com/projectceladon/manifest/blob/master/stable-build/ww201941_B.xml

Integrated Features
-------------------

* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.3 support for Display
* Mass Storage USB 2.0 and 3.x devices are supported
* adb & fastboot supported over USB 2.0
* adb over DbC is supported
* adb over WIFI and Ethernet is supported
* Audio playback over USB and 3.5mm Headset supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Android Kernelflinger boot support
* Thermal Daemon is enabled for project |C|
* Video Codec support on |C|

    **Decoder**

        * AVC High profile @ Level 5.1 (4k@30fps)
        * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)

        .. note::
            Main 10 with BT2020 and ST2084 information is not supported

        * VP9 profile 0 @ Level 5 (4k@30fps)
        * Vp8 8 bits 1080p@60fps

    **Encoder**

        * AVC High profile @ level 4.1 (1080P@30fps)
        * HEVC Main profile @ Level 4 (1080P@30fps)
* Art-extension is enabled
* f2fs filesystem support enabled
* S3 Suspend/Resume is supported
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV
* Audio Encoders supported: AAC-LC, AAC ELD, HEAAC, HEAAC-V2, PCM/WAV
* SDHCI host controller is enabled
* Security

    * SELinux enforcing, File Based Encryption, Trusty, Keymaster 3.0
    * Reference solution - TPM based h/w binding reference implementation
    * User guide:

        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging

Important notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC6CAYH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_ in the following function domains:

.. list-table::
    :widths: 30 10 60
    :header-rows: 1

    * - Component
      - Results
      - Comments
    * - Wi-Fi
      - OK
      -
    * - Wi-Fi Hotspot
      - OK
      -
    * - BT
      - OK
      - BT is working
    * - Audio Playback over USB/3.5mm Headset
      - OK
      - MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
    * - Audio Record over USB HS/3.5mm Headset-in/Main Mic
      - OK
      - AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, PCM/WAV  formats supported
    * - adb connect over WIFI
      - OK
      -
    * - adb connect over Ethernet
      - OK
      -
    * - Display /Touch and Gesture
      - OK
      -
    * - Storage/SD Card
      - OK
      -
    * - Security
      - OK
      -
    * - Boot/Kernel
      - OK
      -
    * - USB devices over OTG
      - OK
      -
    * - Ethernet
      - OK
      -
    * - Fastboot
      - OK
      -
    * - Web browsing
      - OK
      -
    * - Video playback
      - OK
      - H264/H265/MPEG2/VP8/VP9 Video Playback

Known issues
------------
* adb over wifi and ethernet works only after, ``setprop service.adb.tcp.port 5555`` and restart of USB debugging.
* Device seen offline for 4-5 seconds on disconnect and reconnect of dbc cable.
* Time and lock icon are displayed once on Android Start Animation when power on the DUT when connected with dual display.
* Time flickers on All apps screen when launch Intel@Phone Doctor and touch menu button.
* Glitch observed while the DUT is booting to UI at the intel logo screen.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

20-Sept-2019
============

.. note::
    * The :abbr:`CaaS (Celadon as a Service)` releases are supported on Intel Platforms running Android on various Bare Metal x86 systems, Virtual Machines (KVM/Qemu), and also Containers.
    * The ingredients of the CaaS release can be used to build a service architecture, so that with customers we can deliver a **Celadon as a Service** solution.
    * These are Pre-Production CaaS Releases for evaluation and development purposes, they cannot be used for production.

Important notes and Remarks
---------------------------

This |C| build has been validated on |NUC| Kit NUC7i5DNH in the following function domains. The boot up function is supported on most Intel@ X86 platforms.

* Bare Metal

    ======================== ======
    Test Case                Result
    ======================== ======
    Image Flash               Pass
    System Boot Up            Pass
    WIFI WEB_BROWSING         Pass
    Bluetooth Pair            Pass
    Ethernet Browner          Pass
    Media Local Playback      Pass
    Video H264 Decode         Pass
    Audio Playback            Pass
    Adb over USB              pass
    Adb over WIFI             Pass
    Adb over Ethernet         Pass
    USB storage               Pass
    Touch Screen              Pass
    Touch Screen Zoom In/Out  Pass
    ======================== ======

* VM (Qemu-KVM)

    ======================== ====== =======
    Test Case                Result Comment
    ======================== ====== =======
    Image Flash               Pass
    System Boot Up            Pass
    Ethernet Browner          Pass  in Host OS clearlinux, make sure service systemd-networkd is up:  Check: systemctl status systemd-networkd Enable: systemctl enable systemd-networkd
    Media Local Playback      Pass  Video can be displayed but still overlay blue screen after using command : adb shell service call SurfaceFlinger 1008 i32 1
    Audio Playback            Pass  Pass on Usb devices (audio etc.) passthrough: Add "-device usb-host,vendorid=,productid=" into startandroid_qcow2.sh.
    Adb over Ethernet         Pass
    USB storage               Pass  Add "-device usb-host,vendorid=,productid=" into startandroidqcow2.sh.
    Touch Screen              Pass
    Touch Screen Zoom In/Out  Pass
    ======================== ====== =======

* Container (Only cover Boot Function)

    ======================== =======
    Test Case                Results
    ======================== =======
    Image Flash               Pass
    System Boot Up            Pass
    Touch Screen              Pass
    ======================== =======

Known issues
------------

* Bluetooth function is not ready on CAAS VM release.
* Audio 3.5 mm headphone function is not ready on CAAS VM release.
* CAAS performance is under tuning.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

05-Sept-2019
============

.. note::
    * Android Q is supported on Intel Platform and Apollo Lake NUC (`NUC6CAYH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_) is the leading platform for IVI configuration (lunch target: ``celadon_ivi``).
    * This is a Pre-Production Early Q Release for evaluation and development purposes and it cannot be used for production purposes.

Integrated Features
-------------------

* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.3 support for Display
* Mass Storage USB 2.0 and 3.x devices are supported
* adb & fastboot supported over USB 2.0
* adb over DbC is supported
* adb over WIFI and Ethernet is supported
* Audio playback over USB and 3.5mm Headset supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Android Kernelflinger boot support
* Thermal Daemon is enabled for project |C|
* Video Codec support on |C|

    **Decoder**

        * AVC High profile @ Level 5.1 (4k@30fps)
        * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)

        .. note::
            Main 10 with BT2020 and ST2084 information is not supported

        * VP9 profile 0 @ Level 5 (4k@30fps)
        * Vp8 8 bits 1080p@60fps

    **Encoder**

        * AVC High profile @ level 4.1 (1080P@30fps)
        * HEVC Main profile @ Level 4 (1080P@30fps)
* Art-extension is enabled
* f2fs filesystem support enabled
* S3 Suspend/Resume is supported
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV
* Audio Encoders supported: AAC-LC, AAC ELD, HEAAC, HEAAC-V2, PCM/WAV
* SDHCI host controller is enabled
* Security

    * SELinux enforcing, File Based Encryption, Trusty, Keymaster 3.0
    * Reference solution - TPM based h/w binding reference implementation
    * User guide:
        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging

Important notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC6CAYH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_ in the following function domains:

.. list-table::
    :widths: 30 10 60
    :header-rows: 1

    * - Component
      - Results
      - Comments
    * - Wi-Fi
      - OK
      -
    * - Wi-Fi Hotspot
      - OK
      -
    * - BT
      - OK
      - Bt is working
    * - Audio Playback over USB/3.5mm Headset
      - OK
      - MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
    * - Audio Record over USB HS/3.5mm Headset-in/Main Mic
      - OK
      - AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, PCM/WAV  formats supported
    * - adb connect over WIFI
      - OK
      -
    * - adb connect over Ethernet
      - OK
      -
    * - Display /Touch and Gesture
      - OK
      -
    * - Storage/SD Card
      - OK
      -
    * - Security
      - OK
      -
    * - Boot/Kernel
      - OK
      -
    * - USB devices over OTG
      - OK
      -
    * - Ethernet
      - OK
      -
    * - Fastboot
      - OK
      -
    * - Web browsing
      - OK
      -
    * - Video playback
      - OK
      - H264/H265/MPEG2/VP8/VP9 Video Playback

Known issues
------------
* Android Open Source Music Player crashes if headset disconnected and reconnected during audio playback.
* Cannot save images captured in "TestingCam" app.
* Glitch observed while the DUT is booting to UI at the intel logo screen.
* Compliance testing is still on-going.
* DUT doesn't boot to main UI if rebooted with a 4k monitor.
* adb over wifi and ethernet works only after, ``setprop service.adb.tcp.port 5555`` and restart of USB debugging.
* Screen flicker with black stripe during video playback for the first time on a touch screen.
* Time and lock icon are displayed once on Android Start Animation when power on the DUT when connected with dual display.
* Videos/pictures taken by Camera cannot show in Gallery.
* Device seen offline for 4-5 seconds on disconnect and reconnect of dbc cable.
* Time flickers on All apps screen when launch Intel@Phone Doctor and touch menu button.
* BT PAN and Wi-Fi direct UI support removed for automotive variant.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

ww201925_KBLNUC
===============

================================  =====
Software Version                  Android version 9
Mesa                              18.3.6
Kernel Version                    4.19.46
Manifest Link                     https://github.com/projectceladon/manifest/blob/master/stable-build/ww201925_H.xml
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
* HDMI audio playback is enabled
* SDHCI host controller is enabled
* Security reference solution - TPM based h/w binding reference implementation
* Selinux: enabled the neverallow check for selinux

     * User guide:

        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging
* Currently HDMI with stereo is enabled by default to support HDMI audio playback as there is no support for channel map, card and device detection from kernel space.

   * To test the multichannel 5.1 channel playback, use setprop vendor.audio.hdmi_multichannel 1 from adb shell and make sure to unplug and re-plug HDMI device before testing . On commercial NUC currently HDMI device port 3 is enabled.

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
Video playback                 OK       H264/H265/MPEG2/VP8/VP9 Video Playback
=============================  =======  ========


Setup
---------------
USB headset should always be connected to DUT


Known issues
------------

* UI Flicker observed in few Screens for example - Under AOSP settings .
* Lets Drive screen seen, on click of applications under "New User"
* media file copying from external memory to internal memory fails when huge file is copied
* saved system time changes to default after reboot
* Bluetooth pairing fails in first boot cycle
* Bluetooth pairing fails if USB headset is not connected to DUT
* Media KW errors are present in this build
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

---------------


ww201925_CLK
===============

================================  =====
Software Version                  Android version 9
Mesa                              18.3.6
Kernel Version                    4.19.46
Manifest Link                     https://github.com/projectceladon/manifest/blob/master/stable-build/ww201925_clk.xml
================================  =====

Important note
--------------
* This is a Pre-Production Release for evaluation and development purpose and it cannot be used for production purposes.

Integrated Features
-------------------

* Device boots fine on M.2 & SATA based SSD's and eMMC based storage devices
* 4K multiple displays are supported. Three 4K displays @ 60fps works fine simultaneously
* Support OpenGL ES 3.2 ; Display port support up to maximum possible 2560x1440 Quad HD (QHD) ; Support Vulkan 1.1 ; Support clone mode (Mirroring)
* Image / video capture and multiple USB camera enabled

  Model

    * logitech C922 pro stream webcam
* Wifi / BT / Ethernet enabled and works fine on discrete module Thunder Peak [Model: 9260NGW]
* OTA upgrade of full & incremental packages works fine
* S3 power state implemented. Able to enter suspend(S3) by initiating power key event & able to be waked up from S3 by setting a specific RTC timer alarm
* SD-Card enabled
* The thermal shutdown feature have been enabled for hardware thermal protection with tuned thermal parameters. Thermal management solution doc is added in https://01.org/projectceladon/documentation/tutorials/thermal/thermal-daemon
* Touchscreen & Touchpanel works fine [Model: ViewSonic TD2230]
* adb over dbc is enabled
* Trusty Execution Environment / SELinux / File Based Encryption enabled
* Audio is enabled. Supports audio over USB/3.5mm jack/HDA. Formats : MP3/AAC/MIDI/FLAC/WAV
* Video Codec support is enabled on celadon. Multiple-ways simultaneous decode/encode video supported. More than 16 simultaneous decode streams @ 1080p

  Decoder

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps
    * MPEG4 SP decode
    * HTML 5 HW acceleration

  Encoder

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)

Important notes and Remarks
---------------------------

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       BT is working
Ethernet                       OK       IP/Browsing
Audio playback                 OK
USB Camera                     OK
Adb connect over USB           OK
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Storage/SD Card                OK
Security                       OK
Boot/Kernel                    OK
USB devices over OTG           OK
Fastboot                       OK
Web browsing                   OK
Video playback                 OK
=============================  =======  ========

Known issues
------------

* Too many button events generated after single power button press. This partially affects suspend/resume using power-button.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

---------------

ww201913_KBLNUC
===============

================================  =====
Software Version                  Android version 9
Mesa                              18.3.2
Kernel Version                    4.19.19
Manifest Link                     https://github.com/projectceladon/manifest/blob/master/stable-build/ww201913.xml
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
* HDMI audio playback is enabled
* SDHCI host controller is enabled
* Security reference solution - TPM based h/w binding reference implementation
* Selinux: enabled the neverallow check for selinux

     * User guide:

        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging
* Currently HDMI with stereo is enabled by default to support HDMI audio playback as there is no support for channel map, card and device detection from kernel space.

   * To test the multichannel 5.1 channel playback, use setprop vendor.audio.hdmi_multichannel 1 from adb shell and make sure to unplug and re-plug HDMI device before testing . On commercial NUC currently HDMI device port 3 is enabled.

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
* Lets Drive screen seen, on click of applications under "New User"
* media file copying from external memory to internal memory fails when huge file is copied
* saved system time changes to default after reboot
* Call,Alarm volume and alarm sound not audible via USB headset
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

---------------

ww201904_KBLNUC
===============

================================  =====
Build ID                          cel_kbl-userdebug 9 PPR2.181005.003.A1 eng.build.20190130.145741 test-keys
Software Version                  Android version 9
Mesa                              18.2.6
Kernel Version                    4.19
Manifest Link                     https://github.com/projectceladon/manifest/blob/master/stable-build/ww201904.xml
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
* Bluetooth file transfer fails in the first attempt after DUT reboot and it
  works fine once BT is reset
* Lets Drive screen seen, on click of applications under "New User"
* webM format video hangs during switch from full screen to normal
* If you plan to use Celadon in your product, please replace all the test
  keys under device/intel/build/testkeys/ with your product key.

Status
-------
