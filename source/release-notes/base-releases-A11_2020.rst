.. _base-releases-A11_2020:

Android 11 [2020] Base Releases
###############################

.. contents::
   :local:
   :depth: 1


CIV_01.20.04.50_A11
===================

* This is a Production Manifest Release for evaluation and development
  purposes. This release is supported on CML NUC - NUC10i7FN* Celadon in VM.

New features
-----------------

* API Level 30 & FCM target Level 5

 * Other Changes that came as part of API level Up

     * AIDL for Power and Light HALs
     * Audio & Audio effects HAL 6.0
     * Health HAL 2.1
     * Boot HAL upgraded to 1.1

* Upgraded Mainline modules
* Soft restart
* Updatable APEX
* Config store HAL deprecated
* Graphics Memory Allocator (Gralloc) 4.0
* HWC 2.4 support for Display

Existing features
-----------------
* This release uses start_civ.sh to launch Link -https://docs.01.org/celadon/getting-started/on-vm.html?highlight=start_civ#use-start-civ-sh
* Trusty Hardware Seed binding
* Power Management - Suspend,Resume
* Android key Input Manager Framework is implemented for Power and
  Volume buttons
* Integrated Sensor Hub Enablement for Android Supported Sensors
* Ethernet Wired Network Bridge
* Android Thermal HAL and Thermal Manager Service
* BZIP2 performance improvements
* Audio Solution based on HDA
* Bluetooth Control from Android in VM
* HDMI Audio Output Support
* Virtio-gpu Support
* File Sharing between Guest OSes
* SDHCI mediation enabled and supported SD card

   * CIV launch script for SD Card: sudo -E ./scripts/start_android_qcow2.sh --sdonly

* Graphics GVT-g and GVT-d support
* HDMI display support
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Setting Proxy for Wireless Network
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Wifi Control from Android in VM using usb passthrough
* To passthrough USB host controller in CML NUC, run the CIV launch script
  like this:
  sudo -E ./start_android_qcow2.sh  --usb-host-passthrough
* Power Management - Shutdown and Reboot
* Ethernet Wired Network Bridge is enabled
* Android Time keeping with Host OS
* Product Information to Guest OS
* ODM partition for vendor customizations
* Only logitech C922 pro stream webcam is supported for all camera related
  testing
* Video Codec support on celadon

  **Decoder**

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)
      (Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  **Encoder**

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)

* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS,
  OPUS, MIDI, FLAC, PCM/WAV
* Generic storage HAL supported
* SATA emulation is supported
* 9pfs based file transfer
* Security SELinux enforcing, Trusty TEE, File Based Encryption, Trusty,
  Keymaster 3.0

    * User guide:

        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging


Important remarks
-----------------

* For CaaS-CIV

  * Recommended system requirements for Host

     * CPU:  4 cores or more
     * RAM: 4GB or more
     * Disk:  40GB or more

  * Recommended configuration for CPU cores & Memory allocated to Guest VM

     * CPU: [default 1 core]
     * RAM: [default 2GB]
  * Note: Allocating 100% Host resources in terms of memory and cores to
    guest is not recommended currently and it can cause instabilities.


Known issues
------------

* After deprecation of sdcardFS in Android R, Storage stats are not having
  correct values
* /data/logs folder not seen after flashing the image
* Logs, Kpanic and hdcp directory not created in /data with CONFIG_SDCARDFS disabled
* Android is not booting in Mosaic mode
* GLrenderer : Virtio or Google swiftshader : Unable to launch Android
* Guest auto exit after several suspend/resume
* Suspend and wake up device, Wifi will re-connect
* GTS Exo-player failure due to DRM process crash
* After changing resolution, recorded video fallsback to default resolution
* BLE Scanner role is not working
* Sometimes, the device doesn't show simultaneous two camera preview
* Camera flicker in Preview and Recording
* Hotplug support for USB Camera fails
* Device hang , preview lags and camera application not responding
* AV1 Video doesn't play smoothly
* Unable to get media volume with adb shell

Validation results
------------------

|C| build has been validated on CML NUC - NUC10i7FN* in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio over USB                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Display /Touch and Gesture     OK
Security                       OK
Boot                           OK       Boots on QEMU 4.2.0
Ethernet                       OK
Image Flash                    OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG2/VP8/VP9 Video Playback
USB                            OK       Keyboard , Mouse , Pen drive

=============================  =======  ========


Tools/Configuration
-------------------

* QEMU Version 4.2.0
* Host Ubuntu 20.04
* Host Kernel Version 5.4.76
* Guest kernel 5.4.76


Helpful hints / Links
---------------------

* Build Celadon in VM  https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm
* Manifest Link :https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_01.20.04.50_A11.xml
* If you plan to use Celadon in product, please replace all the test keys under device/intel/build/testkeys/ with your product key.
* Steps To build the host kernel for this Manifest
    * Download  caas-releasefiles-userdebug.tar.gz and put it under ~/civ
    * cd ~/civ && tar zxvf caas-releasefiles-userdebug.tar.gz
    * cd patches/kernel/lts2019-chromium
    * ./build_weekly.sh
    * Deb files will be generated in patches/kernel/lts2019-chromium/host_kernel
    * sudo dpkg -i \*.deb
    * Update grub to wait indefinitely for kernel selection on boot
        * sudo vim /etc/default/grub
        * Comment out GRUB_TIMEOUT_STYLE=hidden
          #GRUB_TIMEOUT_STYLE=hidden
        * Uncomment following line and modify grub timeout to -1 for indefinite wait or 5 for 5secs wait
          #GRUB_TIMEOUT=-1
        * Save the file
        * sudo update-grub
    * sudo reboot
    * Select compiled kernel from "Advanced options for Ubuntu"

CIV_00.20.04.39_A11
======================
* This is a Pre-Production Manifest Release for evaluation and development purposes and it cannot be used for production purposes. This release is supported on CML NUC - NUC10i7FN* Celadon in VM.


New Features
-----------------
* Trusty Hardware Seed binding
* Power Management - Suspend,Resume
* Android key Input Manager Framework is implemented for Power & Volume buttons
* Integrated Sensor Hub Enablement for Android Supported Sensors
* Ethernet Wired Network Bridge
* Android Thermal HAL and Thermal Manager Service
* BZIP2 performance improvements
* Audio Solution based on HDA
* Bluetooth Control from Android in VM
* HDMI Audio Output Support
* Virtio-gpu Support
* File Sharing between Guest OSes
* SDHCI mediation enabled and supported SD card
   * CIV launch script for SD Card: sudo -E ./scripts/start_android_qcow2.sh --sdonly
* Graphics Memory Allocator (Gralloc) 1.0
* Graphics GVT-g and GVT-d support
* HDMI display support
* HWC 2.3 support for Display
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Setting Proxy for Wireless Network
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Wifi Control from Android in VM using usb passthrough
* To passthrough USB host controller in CML NUC, run the CIV launch script like this:
  sudo -E ./start_android_qcow2.sh  --usb-host-passthrough
* Power Management - Shutdown and Reboot
* Ethernet Wired Network Bridge is enabled
* Android Time keeping with Host OS
* Product Information to Guest OS
* ODM partition for vendor customizations
* Only logitech C922 pro stream webcam is supported for all camera related testing
* Video Codec support on celadon

  **Decoder**

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020 and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  **Encoder**

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, MIDI, FLAC, PCM/WAV
* Generic storage HAL supported
* SATA emulation is supported
* 9pfs based file transfer
* Security SELinux enforcing, Trusty TEE, File Based Encryption, Trusty, Keymaster 3.0
    * User guide:
        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging


Known issues
-------------
*	Camera Preview doesn't show , unable to capture photo/record video
*	During HFP Audio call , audio is not routed to BT headset via Hangouts[GVT-d and GVT-g]
*	Device shutdown fail in thermal chamber.
*	Not able to authorize device in user build as " allow usb debugging pop up disappear"
*	Mouse and KB is not detecting after adb reboot
*	File-Based Encryption is failing & Encryption shows device not encrypted
*	3rd Display is blank in extend mode
*	Android UI not Displaying in eDP Display after adb reboot.
*	dEQP-VK(Vulkan) tests failed.
*	Sluggish video playback observed for H.264 4K 60fps video file
*	Noise heard when tap/seek is performed on seekbar during Video playback.
*	Touch sound is very low while tapping on home / back button [USB Headset]
*	Glitch observed in audio playback while doing pause/play operation.
*	Audio is not heard until volume level 3
*	Audio routing fails to be expected sync device.
*	Audio is not recording with 3.5 mm Headset in gvt-d
*	Device unable to enter in suspend after 1st attempt.
*	Unable to get media volume with adb shell
*	Not able set screen lock Pattern / Pin / Password
*   All the USB peripheral devices has to be connected before the VM is launched
*   Power Button Long Press is not implemented , only short press and very long button press
*   Userspace Fastboot functionality is not implemented in this release
*   Android adoptable storage developer feature virtual sdcard format never completes
*   When enabling GVT-d, the Guest OS may not light up the physical screen before the OS driver loads. As a result, the Guest BIOS and the Fastboot UI is not visible on the physical screen. This occurs because the physical display is initialized by the GOP driver or VBIOS before the OS driver loads, and the Guest BIOS doesn’t have them.


Validation results
------------------

|C| build has been validated on CML NUC - NUC10i7FN* in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio over USB                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Display /Touch and Gesture     OK
Security                       OK
Boot                           OK       Boots on QEMU 4.2.0
Ethernet                       OK
Image Flash                    OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG2/VP8/VP9 Video Playback
USB                            OK       Keyboard , Mouse , Pen drive

=============================  =======  ========


Tools/Configuration
-------------------
* QEMU Version 4.2.0
* Host Ubuntu 20.04
* Host Kernel Version 5.4.67
* Guest kernel 5.4.67


Helpful Hints / Links
---------------------
* Build Celadon in VM with Android 10 https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm
* Manifest Link :https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.20.04.39_A11.xml
* If you plan to use Celadon in product, please replace all the test keys under device/intel/build/testkeys/ with your product key.
* Steps To build the host kernel for this Manifest
    * Download  caas-releasefiles-userdebug.tar.gz and put it under ~/civ
    * cd ~/civ && tar zxvf caas-releasefiles-userdebug.tar.gz
    * cd patches/kernel/lts2019-chromium
    * ./build_weekly.sh
    * Deb files will be generated in patches/kernel/lts2019-chromium/host_kernel
    * sudo dpkg -i \*.deb
    * Update grub to wait indefinitely for kernel selection on boot
        * sudo vim /etc/default/grub
        * Comment out GRUB_TIMEOUT_STYLE=hidden
          #GRUB_TIMEOUT_STYLE=hidden
        * Uncomment following line and modify grub timeout to -1 for indefinite wait or 5 for 5secs wait
          #GRUB_TIMEOUT=-1
        * Save the file
        * sudo update-grub
    * sudo reboot
    * Select compiled kernel from "Advanced options for Ubuntu"
