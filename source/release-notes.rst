.. _release-notes:

Release Notes
#############

.. contents:: :local:


CIC_00.20.01.08_A09
===================

.. note::

    * The :abbr:`CiC (Celadon in Container)` manifest release is curently supported on Intel Platform : KBL NUC (NUC7i5DNHE).
    * This is a Pre-Production CiC Releases for evaluation and development purposes, they cannot be used for production.

Important Notes and Remarks
---------------------------

This |C| build has been validated on |NUC| Kit NUC7i5DNHE in the following function domains.

* Container

    ======================== =======
    Test Case                Results
    ======================== =======
    Image Flash               Pass
    System Boot Up            Pass
    Touch Screen              Pass
    Basic Video Playback      Pass
    Basic Audio Playback      Pass
    Music App                 Pass
    Multi touch               Pass
    Navigation bar            Pass
    UI Display                Pass
    Wifi [Host]               Pass
    Network [Wifi/Ethernet]   Pass
    Multi camera              Pass
    Screen lock               Pass
    Docker commands           Pass
    adb                       Pass
    BT [Host]                 Pass
    Wired Headset             Pass
    ======================== =======

Known Issues
------------

* Multiple instances under implementation.
* Boot time optimization in progress.
* need to reboot device after 'adb reboot' for files to be reflected.
* CiC performance is under tuning.


CIV_00.20.01.09_A10
======================

This is a Pre-Production February Manifest Release for evaluation and development purposes and it cannot be used for production purposes.
This release is supported on Intel Platform and KBL NUC (NUC7i5DNHE) is the leading platform for Celadon in VM (lunch target: caas-userdebug).

Integrated Features
-------------------
* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.3 support for Display
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported.
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Thermal Daemon is enabled for project-celadon
* Video Codec support on celadon

  **Decoder**

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  **Encoder**

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)
* Art-extension is enabled
* f2fs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* QEMU version is upgraded to 4.2
* Security
  SELinux enforcing, Trusty TEE, File Based Encryption, Trusty, Keymaster 3.0

  User guide:

    SELinux Configuration and Rules
    How to Enable or Disable Trusty for Debugging

Important Notes and Remarks
---------------------------
|C| build has been validated on |NUC| Kit NUC7i5DNHE in the following function domains:

.. list-table::
    :widths: 30 10 60
    :header-rows: 1

    * - Component
      - Results
      - Comments

    * - Wi-Fi
      - OK
      - Host wifi is been used in QEMU

    * - BT
      - OK
      - Host BT is been used in QEMU for HOGP profile (LE profile)

    * - Audio Playback over USB Headset /HDMI devices
      - OK
      - MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported

    * - Adb connect over Wi-Fi
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
      - Add “-device usb-host,vendorid=,productid=” into startandroidqcow2.sh.

    * - Security
      - OK
      -
    * - Boot/Kernel
      - OK
      - Boots on QEMU 3.0.0

    * - Ethernet
      - OK
      -
    * - Image Flash
      - OK
      -
    * - Web browsing
      - OK
      -
    * - Video playback
      - OK
      - H264/H265/MPEG2/VP8/VP9 Video Playback
      
    * - USB
      - OK
      - MTP/PTP Initiator Role 

Known Issues
------------
* Video play is not smooth on 4K monitor.
* Touch Screen operation is not smooth on 4K monitor.

CIC_00.19.04.20.03_A09
======================

.. note::
    * The :abbr:`CiC (Celadon in Container)` release is curently supported on Intel Platform : KBL NUC (NUC7i5DNHE).
    * This is a Pre-Production CiC Releases for evaluation and development purposes, they cannot be used for production.

Important Notes and Remarks
---------------------------

This |C| build has been validated on |NUC| Kit NUC7i5DNHE in the following function domains.

* Container

    ======================== =======
    Test Case                Results
    ======================== =======
    Image Flash               Pass
    System Boot Up            Pass
    Touch Screen              Pass
    Basic Video Playback      Pass
    Basic Audio Playback      Pass
    Music App                 Pass
    Multi touch               Pass
    Navigation bar            Pass
    UI Display                Pass
    Wifi [Host]               Pass
    Network [Wifi/Ethernet]   Pass
    Multi camera              Pass
    Screen lock               Pass
    Docker commands           Pass
    adb                       Pass
    BT [Host]                 Pass
    Wired Headset             Pass
    ======================== =======

Known Issues
------------

* Multiple instances under implementation.
* Boot time optimization in progress.
* need to reboot device after 'adb reboot' for files to be reflected.
* CiC performance is under tuning.

CIV_00.19.04.20.02_A10
======================

This is a Pre-Production Release for evaluation and development purposes and it cannot be used for production purposes.
This release is supported on Intel Platform and KBL NUC (NUC7i5DNHE) is the leading platform for Celadon in VM (lunch target: caas-userdebug).

Integrated Features
-------------------
* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.3 support for Display
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported.
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Thermal Daemon is enabled for project-celadon
* Video Codec support on celadon

  **Decoder**

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  **Encoder**

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)
* Art-extension is enabled
* f2fs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* File sharing between Multi guest-OSes is enabled.
* Security
  SELinux enforcing, Trusty TEE, File Based Encryption, Trusty, Keymaster 3.0

  User guide:

    SELinux Configuration and Rules
    How to Enable or Disable Trusty for Debugging

Important Notes and Remarks
---------------------------
|C| build has been validated on |NUC| Kit NUC7i5DNHE in the following function domains:

.. list-table::
    :widths: 30 10 60
    :header-rows: 1

    * - Component
      - Results
      - Comments

    * - Wi-Fi
      - OK
      - Host wifi is been used in QEMU.

    * - BT
      - OK
      - File Transfer Protocol

    * - Audio Playback over USB Headset /HDMI devices
      - OK
      - MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported

    * - Adb connect over Wi-Fi
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
      - Add “-device usb-host,vendorid=,productid=” into startandroidqcow2.sh.

    * - Security
      - OK
      -
    * - Boot/Kernel
      - OK
      - Boots on QEMU 3.0.0

    * - Ethernet
      - OK
      -
    * - Image Flash
      - OK
      -
    * - Web browsing
      - OK
      -
    * - Video playback
      - OK
      - H264/H265/MPEG2/VP8/VP9 Video Playback


Known Issues
------------
* Audio recording is not supported currently.
* Video play is not smooth on 4K monitor.
* Touch Screen operation is not smooth on 4K monitor.

CIV_00.19.04.51_A10
===================

This is a Pre-Production Release for evaluation and development purposes and it cannot be used for production purposes.
This release is supported on Intel Platform and KBL NUC (NUC7i5DNHE) is the leading platform for Celadon in VM (lunch target: caas-userdebug).

Integrated Features
-------------------
* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.3 support for Display
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported.
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Thermal Daemon is enabled for project-celadon
* Video Codec support on celadon

  **Decoder**

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  **Encoder**

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)
* Art-extension is enabled 
* f2fs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* File sharing between Multi guest-OSes is enabled.
* Security
  SELinux enforcing, Trusty TEE, File Based Encryption, Trusty, Keymaster 3.0

  User guide:

    SELinux Configuration and Rules
    How to Enable or Disable Trusty for Debugging

Important Notes and Remarks
---------------------------
|C| build has been validated on |NUC| Kit NUC7i5DNHE in the following function domains:

.. list-table::
    :widths: 30 10 60
    :header-rows: 1

    * - Component
      - Results
      - Comments

    * - Wi-Fi
      - OK
      - Host wifi is been used in QEMU.

    * - BT
      - OK
      - File Transfer Protocol

    * - Audio Playback over USB Headset /HDMI devices
      - OK
      - MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported

    * - Adb connect over Wi-Fi
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
      - Add “-device usb-host,vendorid=,productid=” into startandroidqcow2.sh.

    * - Security
      - OK
      -
    * - Boot/Kernel
      - OK
      - Boots on QEMU 3.0.0

    * - Ethernet
      - OK
      -
    * - Image Flash
      - OK
      -
    * - Web browsing
      - OK
      -
    * - Video playback
      - OK
      - H264/H265/MPEG2/VP8/VP9 Video Playback

 
Known Issues
------------
* Video can be displayed with green flickering during playback.
* Audio recording is not supported currently.
* Audio is not routing through USB speakers.
* Android UI doesn’t boot up with Full Screen.
* Video play is not smooth on 4K monitor.
* Touch Screen operation is not smooth on 4K monitor.


21-Oct-2019
============

.. note::
    * Android Q is supported on Intel Platform and Apollo Lake NUC (`NUC6CAYH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_) is the leading platform for IVI configuration (lunch target: ``celadon_ivi``).
    * This is a Pre-Production binary Q Release for evaluation and development purposes and it cannot be used for production purposes.

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
* Flashing binaries via |PFT|

    * To reduce the flash time, Platform flash Tool can be used with the following configurations:
 
        * Blank_without_lock (used for first time install or GPT layout change case)
        * Update_without_lock (used for image update on installed device)

    If your device is in unlocked state:

        * "Blank_without_lock" duration is 30% of "Blank"
        * "Update_without_lock" duration is 5% of "Update"

Important Notes and Remarks
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
      - File Transfer Protocol
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

Known Issues
------------
* Flashing time takes longer while using the kernelflinger method (~30mins), To reduce the flash time, Platform flash Tool can be used. Also the "installer.cmd" file can be altered (as per the PFT configurations) and flashed using kernel flinger method.
* adb over wifi and ethernet works only after, ``setprop service.adb.tcp.port 5555`` and restart of USB debugging.
* Device seen offline for 4-5 seconds on disconnect and reconnect of dbc cable.
* Time and lock icon are displayed once on Android Start Animation when power on the DUT when connected with dual display.
* Time flickers on All apps screen when launch Intel@Phone Doctor and touch menu button.
* Glitch observed while the DUT is booting to UI at the intel logo screen.

20-Sept-2019
============

.. note::
    * The :abbr:`CaaS (Celadon as a Service)` and :abbr:`CIC (Celadon in Container)` releases are supported on Intel Platforms running Android on various Bare Metal x86 systems, Virtual Machines (KVM/Qemu), and also Containers.
    * The ingredients of the CaaS release can be used to build a service architecture, so that with customers we can deliver a **Celadon as a Service** solution.
    * These are Pre-Production CaaS and CIC Releases for evaluation and development purposes, they cannot be used for production.

Important Notes and Remarks
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

Known Issues
------------

* Only cover boot up function in early android 10 CIC image release.
* Bluetooth function is not ready on CAAS VM release.
* Audio 3.5 mm headphone function is not ready on CAAS VM release.
* CAAS and CIC performance is under tuning.

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
* Flashing binaries via |PFT|

    * To reduce the flash time, Platform flash Tool can be used with the following configurations:

        * Blank_without_lock (used for first time install or GPT layout change case)
        * Update_without_lock (used for image update on installed device)

    If your device is in unlocked state:

        * "Blank_without_lock" duration is 30% of "Blank"
        * "Update_without_lock" duration is 5% of "Update"

Important Notes and Remarks
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
      - File Transfer Protocol
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

Known Issues
------------

* Flashing time takes longer while using the kernel flinger method (~30mins), To reduce the flash time, Platform flash Tool can be used. Also the "installer.cmd" file can be altered (as per the PFT configurations) and flashed using kernel flinger method.
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

ww201925_KBLNUC
===============

================================  =====
Software Version                  Android version 9
Mesa                              18.3.6
Kernel Version                    4.19.46
================================  =====

Important Note
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

* Flashing binaries via PFT – Platform Flash Tool
* Currently HDMI with stereo is enabled by default to support HDMI audio playback as there is no support for channel map, card and device detection from kernel space.

   * To test the multichannel 5.1 channel playback, use setprop vendor.audio.hdmi_multichannel 1 from adb shell and make sure to unplug and re-plug HDMI device before testing . On commercial NUC currently HDMI device port 3 is enabled.

Important Notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       File Transfer Protocol
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

Known Issues
------------

* UI Flicker observed in few Screens for example - Under AOSP settings .
* Lets Drive screen seen, on click of applications under "New User"
* webM format video hangs during switch from full screen to normal : only on chrome browser
* media file copying from external memory to internal memory fails when huge file is copied
* saved system time changes to default after reboot
* Bluetooth pairing fails in first boot cycle
* Bluetooth pairing fails if USB headset is not connected to DUT
* Media KW errors are present in this build 

---------------


ww201925_CLK
===============

================================  =====
Software Version                  Android version 9
Mesa                              18.3.6
Kernel Version                    4.19.46
================================  =====

Important Note
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


Important Notes and Remarks
---------------------------

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       File Transfer Protocol
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


Known Issues
------------

* Too many button events generated after single power button press. This partially affects suspend/resume using power-button.

---------------

ww201913_KBLNUC
===============

================================  =====
Software Version                  Android version 9
Mesa                              18.3.2
Kernel Version                    4.19.19
================================  =====

Important Note
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

* Flashing binaries via PFT – Platform Flash Tool
* Currently HDMI with stereo is enabled by default to support HDMI audio playback as there is no support for channel map, card and device detection from kernel space.

   * To test the multichannel 5.1 channel playback, use setprop vendor.audio.hdmi_multichannel 1 from adb shell and make sure to unplug and re-plug HDMI device before testing . On commercial NUC currently HDMI device port 3 is enabled. 

Important Notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       File Transfer Protocol
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


Known Issues
------------

* UI Flicker observed in few Screens for example - Under AOSP settings .
* Lets Drive screen seen, on click of applications under "New User"
* webM format video hangs during switch from full screen to normal : only on chrome browser
* media file copying from external memory to internal memory fails when huge file is copied
* saved system time changes to default after reboot
* Call,Alarm volume and alarm sound not audible via USB headset

---------------

ww201904_KBLNUC
===============

================================  =====
Build ID                          cel_kbl-userdebug 9 PPR2.181005.003.A1 eng.build.20190130.145741 test-keys
Software Version                  Android version 9
Mesa                              18.2.6
Kernel Version                    4.19
Download Link                     https://github.com/projectceladon/celadon-binary/tree/master/ww201904
================================  =====

Important Note
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
* Flashing binaries via PFT – Platform Flash Tool


Important Notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       File Transfer Protocol
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


Known Issues
------------

* UI Flicker observed in few Screens for example - Under AOSP settings .
* Bluetooth file transfer fails in the first attempt after DUT reboot and it works fine once BT is reset
* Lets Drive screen seen, on click of applications under "New User"
* webM format video hangs during switch from full screen to normal 

--------

Status
-------


ww201852_KBLNUC
===============

================================  =====
Build ID                          cel_apl-userdebug 9 PPR2.181005.003.A1 eng.build.20190102.114437 test-keys
Software Version                  Android version 9
Mesa                              18.2.6
Kernel Version                    4.19
Download Link                     https://github.com/projectceladon/celadon-binary/tree/master/ww201852
================================  =====

Important Note
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
* Flashing binaries via PFT – Platform Flash Tool


Important Notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       File Transfer Protocol
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


Known Issues
------------

* UI Flicker observed in few Screens for example - Under AOSP settings .
* Bluetooth file transfer fails in the first attempt after DUT reboot and it works fine once BT is reset
* Lets Drive screen seen, on click of applications under "New User"
* While executing DEPQ CTS  , at a certain point there is adb disconnect observed where the DUT freezes , however once the adb is reconnected the test continues but the DUT is frozen

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
Download Link                     https://github.com/projectceladon/celadon-binary/tree/master/ww201851
================================  =====

Important Note
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
* Flashing binaries via PFT – Platform Flash Tool 


Important Notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       File Transfer Protocol
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


Known Issues
------------

* UI Flicker observed in few Screens for example - Under AOSP settings .
* Bluetooth file transfer fails in the first attempt after DUT reboot and it works fine once BT is reset
* Lets Drive screen seen, on click of applications under "New User"
* While executing DEPQ CTS  , at a certain point there is adb disconnect observed where the DUT freezes , however once the adb is reconnected the test continues but the DUT is frozen 

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
Download Link                     https://github.com/projectceladon/celadon-binary/tree/master/ww201851
================================  =====

Important Note
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
* Flashing binaries via PFT – Platform Flash Tool


Important Notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC6CAYH  <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
Wi-Fi Hotspot                  OK
BT                             OK       File Transfer Protocol
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


Known Issues
------------

* DUT freezes while using 4k monitor as display
* Lets Drive screen seen on click of applications under "New User" 
* Need to press power button twice to wake-up from S3"
* Basic Functionality of VGA port works like multidisplay support but there are issues with hotplug and some new Video Post Processing features (adjust Hue/Contrast/Saturation of video)

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
Download Link                     https://github.com/projectceladon/celadon-binary/tree/master/ww201840
================================  =====

Important Note
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

Important Notes and Remarks
---------------------------

|C| build has been validated on |NUC| Kit `NUC6CAYH  <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK       WiFi Direct, WiFi streaming
BT                             OK       File Transfer Protocol
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


Known Issues
------------

* Backlight on/off is not working 
* Media is not getting paused after disconnecting USB headset 
* Video playback works. Hangs observed on some random runs
* ADB over USB is not enabled due to lack of device mode
* Basic Functionality of VGA port works like multidisplay support but there are issues with hotplug and some new Video Post Processing features (adjust Hue/Contrast/Saturation of video)
