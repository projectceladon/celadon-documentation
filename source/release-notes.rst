.. _release-notes:

Release Notes
#############

Releases
********

.. note::

    Refer to :ref:`release-naming-convention` to decode the the release tags of the following |C| releases.

.. contents::
   :local:
   :depth: 1


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


Known Issues
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


Validation Results
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
    * sudo dpkg -i *.deb
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


CIV_00.20.03.39_A10
======================

* This is a Pre-Production Manifest Release for evaluation and development purposes and it cannot be used for production purposes. This release is supported on CML NUC - NUC10i7FN* Celadon in VM.

New Features
-------------
* Trusty Hardware Seed binding

Existing Features
-----------------
* Power Management - Suspend,Resume
* ADB on xHCI DbC for Android USB Host only systems
* Android key Input Manager Framework is implemented for Power & Volume buttons
* Integrated Sensor Hub Enablement for Android Supported Sensors
* Ethernet Wired Network Bridge
* Android Thermal HAL and Thermal Manager Service
* BZIP2 performance improvements
* Audio Solution based on HDA
* OTA Android Update from USB Disk
* Bluetooth Control from Android in VM
* HDMI Audio Output Support
* Virtio-gpu Support
* Battery and Thermal mediation support for Android guest OS
   * Battery percentage of host os will be propagated to Android guest.
   * Thermal temperature information will be sent to Android for graceful shutdown of guest
   * CIV launch script: sudo -E ./scripts/start_android_qcow2.sh --enable-vsock
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
* OTA offline update
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
* Sdcardfs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, MIDI, FLAC, PCM/WAV
* Generic storage HAL supported
* SATA emulation is supported
* 9pfs based file transfer
* Security SELinux enforcing, Trusty TEE, File Based Encryption, Trusty, Keymaster 3.0
    * User guide:
        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging

Known Issues
-------------
* When enabling GVT-d, the Guest OS may not light up the physical screen before the OS driver loads. As a result, the Guest BIOS and the Fastboot UI is not visible on the physical screen. This occurs because the physical display is initialized by the GOP driver or VBIOS before the OS driver loads, and the Guest BIOS doesn’t have them.
* All the USB peripheral devices has to be connected before the VM is launched
* Power Button Long Press is not implemented , only short press and very long button press
* Userspace Fastboot functionality is not implemented in this release
* USB Disk is detected as SD Card in android and OTA update fails when we select U Disk
* Android adoptable storage developer feature virtual sdcard format never completes
* USB Hotplug of camera can lead to
    * Application Crash
    * Capture and Recording issue which makes application hang
    * Camera Preview becomes green
    * Solution : Needs application restart (close and open application ) to work properly.


Validation Results
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
* Host Kernel Version 5.4.58
* Guest kernel 5.4.58

Helpful Hints / Links
---------------------
* Build Celadon in VM with Android 10 https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm
* Manifest Link :https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.20.03.39_A10.xml
* If you plan to use Celadon in product, please replace all the test keys under device/intel/build/testkeys/ with your product key.
* Steps To build the host kernel for this Manifest
    * Download  caas-releasefiles-userdebug.tar.gz and put it under ~/civ
    * cd ~/civ && tar zxvf caas-releasefiles-userdebug.tar.gz
    * cd patches/kernel/lts2019-chromium
    * ./build_weekly.sh
    * Deb files will be generated in patches/kernel/lts2019-chromium/host_kernel
    * sudo dpkg -i *.deb
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




CIC_01.20.03.36_A09
===================

This is a Pre-Production Release for evaluation and development purposes
and it cannot be used for production purposes.
This release is supported on Comet Lake |NUC-attr| NUC10i7F Celadon in
Container.

Previous release : CIC_00.20.03.31_A09

New features
------------
* Metrics Discovery API (MDAPI) support in graphics driver
* STS fix for android.security.cts.BitmapFactorySecurityTests#test_android_bug_156261521
* STS fix for android.security.cts.ActivityManagerTest#testActivityManager_attachNullApplication
* Fix for MultiCamera gives pop-up "USB hot plug detected" for USB HS and KB
* Fix for cfc.desktop is not created after cic installation
* Fix for Setting in camera application doesn't work after clicking on Surveillance Button
* Fix for Android\* UI Doesn't launch after setup for 1st time with cfc in
  freshly install Ubuntu\*

Existing features
-----------------

* multi window support with bug fixes
* Enable 3.5mm Jack detection on Comet Lake |NUC|
* Enable Android NN HAL to interface with OpenVINO™ in CiC/CiV
* Enable multi-instances support in cic target
* Selinux and dm-verity features are enabled
* Debian\* package release with Adaptive Installation Script support
* Support android reboot in cic-monitor service
* Klocwork\* issue fixes
* Support for multi window display
* Camera back and front switching implementation
* HDMI display support
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth® 4.2
* Wired Ethernet support
* Video Codec support on celadon
* Sdcardfs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* eMMC / SATA / NVMe storage media supported
* Generic storage HAL supported
* Vendor WiFi hal integrated
* Battery Indicator enabled
* From storage, Sdcardfs filesystem support, eMMC 5.1 controller driver support, eMMC Storage support enabled
* Mesa upgraded to 19.3.3
* Following features added on AOSP side :
    * Support host shortcut for android apps
    * Support copy and paste feature between AIC and Host
    * Support multi-user data isolation
    * Add cic monitor service to support shutdown and reboot
* Android Service Access, Clock/time-zone matches with host, keyboard
  matches with host, Screen zoom works, back button event propagation works
  fine
* IPP lib integrated, & DEX2OAT optimization is enabled
* Audio / Video streaming on RTP/RTSP works fine
* USB camera hot plug and camera selection are enabled
* memtrack works fine
* Host input events (touchscreen) works fine
* SOF-HDA support enabled
* Enable File based encryption on secure flash.
* Add HostKeymaster support.
* Provide Settings screen to set ethernet proxy settings.
* Fix for Audio is not routing over HDMI and USB headset.
* Fix for CTS execution completion.
* Fix for Bluetooth crash issue.

Known issues
------------
* No FBE support for multi user
* After changing resolution recorded video fallsback to default resolution
* FIO_Sequential_Read_SSD data has -36.03% regression
* Android Ui not launched after adb reboot when screen lock set
* Test cases are failing in VtsHalWifiSupplicant modules
* WiFi status bar shows ON default
* Unable to control android volume using USB headset volume buttons.
* Getting Error "transfer error: secure_mkdirs failed: Operation not
  permitted" while running cts
* android.security.cts.BitmapFactorySecurityTests#test_android_bug_156261521
  failed
* android.security.cts.ActivityManagerTest#testActivityManager_attachNullApplication failed
* Stability KPI-1 is blocked as device goes offline while KPI run
* Trusty is not supported due to conflict in BIOS.
* On Security enabled cic, adb install / playstore download are the only
  options for 3rd party apk installation.

Important note
--------------
* To modify cpu cores usage : After Container start up run the command
  "sudo docker update --cpuset-cpus="0-11" android0_PID" , where
  android0_PID is the Docker\* PID of android instance.
* Ensure Lvm2 & thin-provisioning-tools packages are installed.
* Please ensure latest version of libjson-c is installed.

Validation results
------------------

This |C| build has been validated on Comet Lake Intel® NUC NUC10i7FN in the
following function domains, for both secure and non-secure.

  ======================== =======
  Test Case                Results
  ======================== =======
  Image Flash               Pass
  System Boot Up            Pass
  Touch Screen              Pass
  Basic Video Playback      Pass
  Basic Audio Playback      Pass
  Navigation bar            Pass
  UI Display                Pass
  Wifi [Host]               Pass
  Network [Wifi/Ethernet]   Pass
  Multi camera              Pass
  Screen lock               Pass
  Docker commands           Pass
  adb[Ethernet]             Pass
  BT [Host]                 Pass
  SE-Policy                 Pass
  ======================== =======

Tools/Configuration
-------------------
* Docker version      : 18.09.2
* Host Ubuntu         : 20.04
* Host Kernel Version : 5.4.58 [SELinux config enabled in host kernel-config]

Helpful hints/links
---------------------

* Build CIC     : https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-container-with-android-9
* Flash steps   : https://01.org/projectceladon/documentation/getting-started/on-container
* Manifest Link : https://github.com/projectceladon/manifest/blob/celadon/p/mr0/master/stable-build/CIC_01.20.03.36_A09.xml
* Binary Link   : https://github.com/projectceladon/celadon-binary/tree/master/CIC_01.20.03.36_A09
* If you plan to use Celadon in product, please replace all the test keys under device/intel/build/testkeys/ with your product key.


CIC_00.20.03.31_A09
======================

* This is a Pre-Production Release for evaluation and development purposes
  and it cannot be used for production purposes. This release is supported
  on Comet Lake |NUC| - NUC10i7FN Celadon in Container.

Previous release : CIC_00.20.02.24_A09

New features
------------

* multi window support with bug fixes
* Enable 3.5mm Jack detection on Comet Lake |NUC|
* Enable Android NN HAL to interface with OpenVINO in CiC/CiV
* Enable multi-instances support in cic target

Existing features
-----------------

* Selinux and dm-verity features are enabled
* Debian package release with Adaptive Installation Script support
* Support android reboot in cic-monitor service
* Klocwork issue fixes
* Support for multi window display
* Camera back and front switching implementation
* HDMI display support
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Video Codec support on celadon
* Sdcardfs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS,
  OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* eMMC / SATA / NVMe storage media supported
* Generic storage HAL supported
* Vendor WiFi\* hal integrated
* Battery Indicator enabled
* From storage, Sdcardfs filesystem support, eMMC 5.1 controller driver
  support, eMMC Storage support enabled
* Mesa upgraded to 19.3.3
* Following features added on AOSP side :
    * Support host shortcut for android apps
    * Support copy and paste feature between AIC and Host
    * Support multi-user data isolation
    * Add cic monitor service to support shutdown and reboot
* Android Service Access, Clock/time-zone matches with host, keyboard
  matches with host, Screen zoom works, back button event propagation works
  fine
* IPP lib integrated, & DEX2OAT optimization is enabled
* Audio / Video streaming on RTP/RTSP works fine
* USB camera hot plug and camera selection are enabled
* memtrack works fine
* Host input events (touchscreen) works fine
* SOF-HDA support enabled
* Enable File based encryption on secure flash.
* Add HostKeymaster support.
* Provide Settings screen to set ethernet proxy settings.
* Fix for Audio is not routing over HDMI and USB headset.
* Fix for CTS execution completion.
* Fix for Bluetooth crash issue.

Known issues
------------
* After changing resolution recorded video fallsback to default resolution
* FIO_Sequential_Read_SSD data has -36.03% regression
* Android Ui not launched after adb reboot when screen lock set
* Test cases are failing in VtsHalWifiSupplicant modules
* WiFi status bar shows ON default
* Unable to control android volume using USB headset volume buttons.
* Getting Error "transfer error: secure_mkdirs failed: Operation not
  permitted" while running cts
* android.security.cts.BitmapFactorySecurityTests#test_android_bug_156261521
  failed
* android.security.cts.ActivityManagerTest#testActivityManager_attachNullApplication failed
* After connecting Wi-Fi in Android Container adb over emulator does not
  work and stability KPI-1 is blocked as WIFI on/off will disconnect adb over WIFI
* Trusty is not supported due to conflict in BIOS.
* On Security enabled cic, adb install / playstore download are the only
  options for 3rd party apk installation.

Important note
--------------
* To modify cpu cores usage : After Container start up run the command
  "sudo docker update --cpuset-cpus="0-11" android0_PID" , where
  android0_PID is the Docker PID of android instance.
* Ensure Lvm2 & thin-provisioning-tools packages are installed.
* Please ensure latest version of libjson-c is installed.

Validation results
------------------

This |C| build has been validated on Comet Lake |NUC| NUC10i7F in the following function domains, for both
secure and non-secure.

  ======================== =======
  Test Case                Results
  ======================== =======
  Image Flash               Pass
  System Boot Up            Pass
  Touch Screen              Pass
  Basic Video Playback      Pass
  Basic Audio Playback      Pass
  Navigation bar            Pass
  UI Display                Pass
  Wifi [Host]               Pass
  Network [Wifi/Ethernet]   Pass
  Multi camera              Pass
  Screen lock               Pass
  Docker commands           Pass
  adb[Ethernet]             Pass
  BT [Host]                 Pass
  SE-Policy                 Pass
  ======================== =======

Tools/Configuration
-------------------
* Docker version      : 18.09.2
* Host Ubuntu         : 20.04
* Host Kernel Version : 5.4.50 [SELinux config enabled in host kernel-config]

Helpful hints/links
---------------------

* Build CIC     : https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-container-with-android-9
* Flash steps   : https://01.org/projectceladon/documentation/getting-started/on-container
* Manifest Link : https://github.com/projectceladon/manifest/blob/celadon/p/mr0/master/stable-build/CIC_00.20.03.31_A09.xml
* Binary Link   : NA
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.


CIV_00.20.03.31_A10
======================

* This is a Pre-Production Manifest Release for evaluation and development
  purposes and it cannot be used for production purposes. This release is supported on Comet Lake |NUC| NUC10i7F Celadon in VM.

New features 
-------------
* Power Management - Suspend,Resume
* ADB on xHCI DbC for Android USB Host only systems

Existing features
-----------------
* Android key Input Manager Framework is implemented for Power & Volume buttons
* Integrated Sensor Hub Enablement for Android Supported Sensors
* Ethernet Wired Network Bridge
* Android Thermal HAL and Thermal Manager Service
* BZIP2 performance improvements
* Audio Solution based on HDA
* OTA Android Update from USB Disk
* Bluetooth Control from Android in VM
* HDMI Audio Output Support
* Virtio-gpu Support
* Battery and Thermal mediation support for Android guest OS
   * Battery percentage of host os will be propagated to Android guest.
   * Thermal temperature information will be sent to Android for graceful shutdown of guest
   * CIV launch script: sudo -E ./scripts/start_android_qcow2.sh --enable-vsock
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
* To passthrough USB host controller in Comet Lake |NUC|, run the CIV launch script like this:
  sudo -E ./start_android_qcow2.sh  --usb-host-passthrough
* Power Management - Shutdown and Reboot
* OTA offline update
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
* Sdcardfs filesystem support enabled
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
* When enabling GVT-d, the Guest OS may not light up the physical screen before the OS driver loads. As a result, the Guest BIOS and the Fastboot UI is not visible on the physical screen. This occurs because the physical display is initialized by the GOP driver or VBIOS before the OS driver loads, and the Guest BIOS doesn’t have them.
* All the USB peripheral devices has to be connected before the VM is launched
* Power Button Long Press is not implemented , only short press and very long button press
* Userspace Fastboot functionality is not implemented in this release
* USB Disk is detected as SD Card in android and OTA update fails when we select U Disk
* Android adoptable storage developer feature virtual sdcard format never completes
* USB Hotplug of camera can lead to
    * Application Crash
    * Capture and Recording issue which makes application hang
    * Camera Preview becomes green
    * Solution : Needs application restart (close and open application ) to work properly.


Validation results
------------------

|C| build has been validated on Comet Lake |NUC| NUC10i7F in the following function domains:

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
* Host Kernel Version 5.4.50
* Guest kernel 5.4.50

Helpful hints/links
---------------------
* Build Celadon in VM with Android 10 https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm
* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.20.03.31_A10.xml
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.
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
        * Uncomment following line and modify grub timeout to -1 for
          indefinite wait or 5 for 5secs wait
          #GRUB_TIMEOUT=-1
        * Save the file
        * sudo update-grub
    * sudo reboot
    * Select compiled kernel from "Advanced options for Ubuntu"


CIC_00.20.02.24_A09
======================

* This is a Pre-Production Release for evaluation and development purposes
  and it cannot be used for production purposes. This release is supported
  on Comet Lake |NUC| NUC10i7F Celadon in Container.

Previous release : CIC_00.20.02.23_A09

New features
-------------

* Enable File based encryption on secure flash.
* Add HostKeymaster support.
* Provide Settings screen to set ethernet proxy settings.
* Fix for Audio is not routing over HDMI and USB headset.
* Fix for CTS execution completion.
* Fix for Bluetooth crash issue.

Existing features
-----------------

* Selinux and dm-verity features are enabled
* Debian package release with Adaptive Installation Script support
* Support android reboot in cic-monitor service
* Klocwork issue fixes
* Support for multi window display
* Camera back and front switching implementation
* HDMI display support
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Video Codec support on celadon
* Sdcardfs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS,
  OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* eMMC / SATA / NVMe storage media supported
* Generic storage HAL supported
* Vendor WiFi hal integrated
* Battery Indicator enabled
* From storage, Sdcardfs filesystem support, eMMC 5.1 controller driver
  support, eMMC Storage support enabled
* Mesa upgraded to 19.3.3
* Following features added on AOSP side :
    * Support host shortcut for android apps
    * Support copy and paste feature between AIC and Host
    * Support multi-user data isolation
    * Add cic monitor service to support shutdown and reboot
* Android Service Access, Clock/time-zone matches with host, keyboard
  matches with host, Screen zoom works, back button event propagation works fine
* IPP lib integrated, & DEX2OAT optimization is enabled
* Audio / Video streaming on RTP/RTSP works fine
* USB camera hot plug and camera selection are enabled
* memtrack works fine
* Host input events (touchscreen) works fine
* SOF-HDA support enabled



Known issues
-------------
* Unable to install graphics apk (less memory)
* Multi-camera application crashes after hotplug
* Unable to control volume using 3.5mm headset volume buttons.
* Stability KPI-2 Fails
* Unable to control android volume using USB headset volume buttons.
* Getting Error "transfer error: secure_mkdirs failed: Operation not
  permitted" while running cts
* Memory allocation doesn't show for graphics('EGL mtrack or Gfx).
* Unable to capture photo and video after hot-plug.
* Camera flip icon is displayed after hotplug.
* After connecting Wi-Fi in Android Container adb over emulator does not
  work and stability KPI-1 is blocked as WIFI on/off will disconnect adb
  over WIFI
* GPU Overdraw options having Blue Screen
* App issue - some app display disorder in multi-window mode
* App issue - some app flick in multi-window mode
* Don’t Suspend / press power button on cml host. Device cant be recovered
  until rebooted.
* Trusty is not supported due to conflict in BIOS.
* On Security enabled cic, adb install / playstore download are the only
  options for 3rd party apk installation.
* ADB goes offline frequently on adb-ethernet.

Important note
--------------
* To modify cpu cores usage : After Container start up run the command "sudo docker update --cpuset-cpus="0-11" android0_PID" , where android0_PID is the Docker PID of android instance.
* Ensure Lvm2 & thin-provisioning-tools packages are installed.
* Please ensure latest version of libjson-c is installed.

Validation results
------------------

This |C| build has been validated on Comet Lake |NUC| NUC10i7F in the
following function domains, for both secure and non-secure.

  ======================== =======
  Test Case                Results
  ======================== =======
  Image Flash               Pass
  System Boot Up            Pass
  Touch Screen              Pass
  Basic Video Playback      Pass
  Basic Audio Playback      Pass
  Navigation bar            Pass
  UI Display                Pass
  Wifi [Host]               Pass
  Network [Wifi/Ethernet]   Pass
  Multi camera              Pass
  Screen lock               Pass
  Docker commands           Pass
  adb[Ethernet]             Pass
  BT [Host]                 Pass
  SE-Policy                 Pass
  ======================== =======

Tools/Configuration
-------------------
* Docker version      : 18.09.2
* Host Ubuntu         : 18.04
* Host Kernel Version : 5.4.42 [SELinux config enabled in host kernel-config]

Helpful hints/links
---------------------

* Build CIC     : https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-container-with-android-9
* Flash steps   : https://01.org/projectceladon/documentation/getting-started/on-container
* Manifest Link : https://github.com/projectceladon/manifest/blob/celadon/p/mr0/master/stable-build/CIC_00.20.02.24_A09.xml
* Binary Link   : https://github.com/projectceladon/celadon-binary/blob/master/CIC_00.20.02.24_A09/cic-aic-CC0000131.tar.gz
* If you plan to use Celadon in your product, please replace all the test keys
  under device/intel/build/testkeys/ with your product key.


CIV_00.20.02.24_A10
======================

* This is a Pre-Production Manifest Release for evaluation and development
  purposes and it cannot be used for production purposes. This release is
  supported on Comet Lake |NUC| NUC10i7F Celadon in VM.

New features (Additional features in comparison to previous CIV Manifest Release - CIV_00.20.02.23_A10)
-------------------------------------------------------------------------------------------------------

* Android key Input Manager Framework is implemented for Power and Volume
  buttons
* Integrated Sensor Hub Enablement for Android Supported Sensors
* Ethernet Wired Network Bridge 

Existing features
-----------------
* Android Thermal HAL and Thermal Manager Service
* BZIP2 performance improvements 
* Audio Solution based on HDA
* OTA Android Update from USB Disk
* Bluetooth Control from Android in VM
* HDMI Audio Output Support
* Virtio-gpu Support
* Battery and Thermal mediation support for Android guest OS
   * Battery percentage of host os will be propagated to Android guest.
   * Thermal temperature information will be sent to Android for graceful
     shutdown of guest
   * CIV launch script: sudo -E ./start_android_qcow2.sh --enable-vsock
* File Sharing between Guest OSes
* SDHCI mediation enabled and supported SD card
   * CIV launch script for SD Card: sudo -E ./start_android_qcow2.sh --sdonly
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
* To passthrough USB host controller in Comet Lake |NUC|, run the CIV
  launch script like this:
  ``sudo -E ./start_android_qcow2.sh  --usb-host-passthrough``
* Power Management - Shutdown and Reboot
* OTA offline update
* Ethernet Wired Network Bridge is enabled
* Only logitech C922 pro stream webcam is supported for all camera
  related testing
* Android Time keeping with Host OS
* Product Information to Guest OS
* ODM partition for vendor customizations
* Video Codec support on celadon

  **Decoder**

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020
      and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  **Encoder**

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)
* Sdcardfs filesystem support enabled
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

Known issues
-------------
* When enabling GVT-d, the Guest OS may not light up the physical screen
  before the OS driver loads. As a result, the Guest BIOS and the Fastboot
  UI is not visible on the physical screen. This occurs because the physical
  display is initialized by the GOP driver or VBIOS before the OS driver
  loads, and the Guest BIOS doesn’t have them.
* All the USB peripheral devices has to be connected before the VM is
  launched 
* Android UI is not displayed if we use EDP display
* Audio is not routing to 3.5mm Headset after USB Headset reconnection.
* Volume Control using the Audio Peripherals like USB headset and 3.5mm
  Headset is not working 
* Power Button Long Press is not implemented , only short press and very
  long button press
* Userspace Fastboot functionality is not implemented in this release 
* USB Hotplug of camera can lead to
    * Application Crash
    * Capture and Recording issue which makes application hang 
    * Camera Preview becomes green
    * Solution : Needs application restart (close and open application ) to
      work properly.
 

Validation results
------------------

|C| build has been validated on Comet Lake |NUC| NUC10i7F in the following
function domains:

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
* Host Ubuntu 18.04
* Host Kernel Version 5.4.42
* Guest kernel 5.4.42

Helpful hints/links
---------------------
* Build Celadon in VM with Android 10 https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm
* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.20.02.24_A10.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/blob/master/CIV_00.20.02.24_A10/caas-releasefiles-userdebug.tar.gz
* If you plan to use Celadon in your product, please replace all the test
  keys under device/intel/build/testkeys/ with your product key.
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
        * Uncomment following line and modify grub timeout to -1 for
          indefinite wait or 5 for 5secs wait
          #GRUB_TIMEOUT=-1
        * Save the file
        * sudo update-grub
    * sudo reboot
    * Select compiled kernel from "Advanced options for Ubuntu"


CIC_00.20.02.23_A09
======================

* This is a Pre-Production Release for evaluation and development purposes
  and it cannot be used for production purposes. This release is supported
  on Comet Lake |NUC| NUC10i7F Celadon in Container.

New features
-------------

* Debian package release with Adaptive Installation Script support
* Support android reboot in cic-monitor service
* Klocwork issue fixes
* Support for multi window display
* Camera back and front switching implementation

Existing features
-----------------

* HDMI display support
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Video Codec support on Celadon
* Sdcardfs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS,
  OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* eMMC / SATA / NVMe storage media supported
* Generic storage HAL supported
* Vendor WiFi hal integrated
* Battery Indicator enabled
* From storage, Sdcardfs filesystem support, eMMC 5.1 controller driver
  support, eMMC Storage support enabled
* Mesa upgraded to 19.3.3
* Following features added on AOSP side :
    * Support host shortcut for android apps
    * Support copy and paste feature between AIC and Host
    * Support multi-user data isolation
    * Add cic monitor service to support shutdown and reboot

Known issues
-------------
* Trusty is not supported due to conflict in BIOS.
* Memory allocation doesn't show for graphics('EGL mtrack or Gfx).
* Unable to capture photo and video after hot-plug.
* Camera flip icon is displayed after hotplug.
* GPU Overdraw options having Blue Screen
* Device is going down while running CTS
* On Security enabled cic, adb install / playstore download are the only
  options for 3rd party apk installation.
* After connecting Wi-Fi in Android Container adb over emulator does not
  work and stability KPI-1 is blocked as WIFI on/off will disconnect adb
  over WIFI

Validation results
------------------

This |C| build has been validated on Comet Lake |NUC| NUC10i7F in the
following function domains, for both secure and non-secure.

  ======================== =======
  Test Case                Results
  ======================== =======
  Image Flash               Pass
  System Boot Up            Pass
  Touch Screen              Pass
  Basic Video Playback      Pass
  Basic Audio Playback      Pass
  Navigation bar            Pass
  UI Display                Pass
  Wifi [Host]               Pass
  Network [Wifi/Ethernet]   Pass
  Multi camera              Pass
  Screen lock               Pass
  Docker commands           Pass
  adb[Ethernet]             Pass
  BT [Host]                 Pass
  SE-Policy                 Pass
  ======================== =======

Tools/Configuration
-------------------
* Docker version      : 18.09.2
* Host Ubuntu         : 18.04
* Host Kernel Version : 5.4.42 [With SELinux enabled]

Helpful hints/links
---------------------

* Build CIC     : https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-container-with-android-9
* Flash steps   : https://01.org/projectceladon/documentation/getting-started/on-container
* Manifest Link : https://github.com/projectceladon/manifest/blob/celadon/p/mr0/master/stable-build/CIC_00.20.02.23_A09.xml
* Binary Link   : <NA>
* If you plan to use Celadon in your product, please replace all the test
  keys under device/intel/build/testkeys/ with your product key.

CIV_00.20.02.23_A10
======================

* This is a Pre-Production Manifest Release for evaluation and development purposes and it cannot be used for production purposes. This release is supported on Comet Lake |NUC| NUC10i7F Celadon in VM.

New features
-------------
* Android Thermal HAL and Thermal Manager Service 
* Audio Solution based on HDA
* OTA Android Update from USB Disk
* Bluetooth Control from Android in VM 
* HDMI Audio Output Support 
* Virtio-gpu Support 
* Battery and Thermal mediation support for Android guest OS
   * Battery percentage of host os will be propagated to Android guest.
   * Thermal temperature information will be sent to Android for graceful shutdown of guest
   * CIV launch script: sudo -E ./start_android_qcow2.sh --enable-vsock
* File Sharing between Guest OSes
* SDHCI mediation enabled and supported SD card
   * CIV launch script for SD Card: sudo -E ./start_android_qcow2.sh --sdonly

Existing features
-----------------
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
* To passthrough USB host controller in Comet Lake |NUC|, run the CIV launch script like this:
  sudo -E ./start_android_qcow2.sh  --usb-host-passthrough
* Power Management - Shutdown and Reboot
* Only logitech C922 pro stream webcam is supported for all camera related testing
* OTA offline update
* Ethernet Wired Network Bridge is enabled
* Android Time keeping with Host OS
* Product Information to Guest OS
* ODM partition for vendor customizations
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
* Sdcardfs filesystem support enabled
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
* When enabling GVT-d, the Guest OS may not light up the physical screen before the OS driver loads. As a result, the Guest BIOS and the Fastboot UI is not visible on the physical screen. This occurs because the physical display is initialized by the GOP driver or VBIOS before the OS driver loads, and the Guest BIOS doesn’t have them.   
* Noise heard in the background of the recorded file when recorded over 3.5mm headset
* Camera Preview is lost while switching between dual and single mode
* Camera Preview is not available when USB camera is connected after Android is Launched through VM 
* Android UI is not displayed if we use EDP display
* Audio is not routing to 3.5mm Headset for ALC256 audio codec
* Front view camera is not having mirror Image preview 
* Hotplug support for USB Camera doesn't work
* Blue Screen observed while switching from between Front and Rear Camera (occurrence  - random)

Validation results
------------------

|C| build has been validated on Comet Lake |NUC| NUC10i7F in the following function domains:

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
* Host Ubuntu 18.04
* Host Kernel Version 5.4.35 
* Guest kernel 5.4.42

Helpful hints/links
---------------------
* Build Celadon in VM with Android 10 https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-vm-with-android-10
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm 
* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.20.02.23_A10.xml
* If you plan to use Celadon in your product, please replace all the test
  keys under device/intel/build/testkeys/ with your product key.
* Steps To build the host kernel for this Manifest
    * Sync the manifest from the above Manifest link
    * Build the source code and caas-releasefiles-userdebug.tar.gz will be
      generated
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
        * Uncomment following line and modify grub timeout to -1 for
          indefinite wait or 5 for 5secs wait
          #GRUB_TIMEOUT=-1 
        * Save the file
        * sudo update-grub
    * sudo reboot
    * Select compiled kernel from "Advanced options for Ubuntu"


CIC_00.20.02.20_A09
======================

* This is a Pre-Production Release for evaluation and development purposes
  and it cannot be used for production purposes. This release is supported on Comet Lake |NUC| NUC10i7F Celadon in Container.

New features
-------------

* Vendor WiFi hal integrated
* Battery Indicator enabled
* From storage, Sdcardfs filesystem support, eMMC 5.1 controller driver
  support, eMMC Storage support enabled
* Mesa upgraded to 19.3.3
* Following features added on AOSP side :
    * Support host shortcut for android apps
    * Support copy and paste feature between AIC and Host
    * Support multi-user data isolation
    * Add cic monitor service to support shutdown and reboot

Existing features
-----------------

* HDMI display support
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Video Codec support on celadon
* Sdcardfs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS,
  OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* eMMC / SATA / NVMe storage media supported
* Generic storage HAL supported

Known issues
-------------
* Trusty is not supported due to conflict in BIOS.
* Landscape mode doesn't work.
* 'GPU Overdraw' developer option has more Blue Screen.
* Memory allocation info doesn't show for graphics ('EGL mtrack or Gfx).
* On Security enabled cic, adb install / playstore download are the only
  options for 3rd party apk installation.

Validation results
------------------

This |C| build has been validated on Comet Lake |NUC| NUC10i7F in the
following function domains, for both secure and non-secure.

  ======================== =======
  Test Case                Results
  ======================== =======
  Image Flash               Pass
  System Boot Up            Pass
  Touch Screen              Pass
  Basic Video Playback      Pass
  Basic Audio Playback      Pass
  Navigation bar            Pass
  UI Display                Pass
  Wifi [Host]               Pass
  Network [Wifi/Ethernet]   Pass
  Multi camera              Pass
  Screen lock               Pass
  Docker commands           Pass
  adb                       Pass
  BT [Host]                 Pass
  SE-Policy                 Pass
  ======================== =======

Tools/Configuration
-------------------
* Docker version      : 18.09.2
* Host Ubuntu         : 18.04
* Host Kernel Version : 5.4.35 [With SELinux enabled]

Helpful hints/links
---------------------

* Build CIC     : https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-container-with-android-9
* Flash steps   : https://01.org/projectceladon/documentation/getting-started/on-container
* Manifest Link : https://github.com/projectceladon/manifest/blob/celadon/p/mr0/master/stable-build/CIC_00.20.02.20_A09.xml
* Binary Link   : <NA
* If you plan to use Celadon in your product, please replace all the test
  keys under device/intel/build/testkeys/ with your product key.


CIV_00.20.02.19_A10
======================

* This is a Pre-Production Manifest Release for evaluation and development
  purposes and it cannot be used for production purposes. This release is
  supported on Comet Lake |NUC| NUC10i7F Celadon in VM.

New features
-------------

* Wifi Control from Android in VM using usb passthrough 
* To passthrough USB host controller in Comet Lake |NUC|, run the CIV launch script
  like this:
  ``sudo -E ./start_android_qcow2.sh  --usb-host-passthrough``
* Power Management - Shutdown and Reboot 
* OTA offline update
* Ethernet Wired Network Bridge is enabled 
* Android Time keeping with Host OS
* Product Information to Guest OS
* ODM partition for vendor customizations 

Existing features
-----------------
* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.3 support for Display
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Setting Proxy for Wireless Network
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Video Codec support on celadon

  **Decoder**

    * AVC High profile @ Level 5.1 (4k@30fps)
    * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10 with BT2020
      and ST2084 information is not supported)
    * VP9 profile 0 @ Level 5 (4k@30fps)
    * Vp8 8 bits 1080p@60fps

  **Encoder**

    * AVC High profile @ level 4.1 (1080P@30fps)
    * HEVC Main profile @ Level 4 (1080P@30fps)

* Art-extension is enabled
* Sdcardfs filesystem support enabled
* Only logitech C922 pro stream webcam is supported for all camera related
  testing
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


Known issues
-------------
* dEQP-VK(Vulkan 1.1) is failing 

Validation results
------------------

|C| build has been validated on Comet Lake |NUC| NUC10i7F in the
following function domains:

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
USB                            OK       Keybord , Mouse , Pen drive

=============================  =======  ========


Tools/Configuration
-------------------
* QEMU Version 4.2.0
* Host Ubuntu 18.04
* Host Kernel Version 5.4.35
  Steps to build the host kernel for CIV [Comet Lake |NUC|]--> https://github.com/projectceladon/vendor-intel-utils/blob/master/host/kernel/lts2019-chromium/README
* Guest kernel 5.4.37

Helpful hints/links
---------------------
* Build Celadon in VM with Android 10 https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-vm-with-android-10
* Flash Steps :https://01.org/projectceladon/documentation/getting-started/on-vm
* Manifest Link :https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.20.02.19_A10.xml
* For CIV QMR0 we are now switching to the platform : Comet Lake |NUC|
  NUC10i7F
* If you plan to use Celadon in your product, please replace all the test
  keys under device/intel/build/testkeys/ with your product key.



CIC_01.20.01.12_A09
======================

* This is a Pre-Production Release for evaluation and development purposes
  and it cannot be used for production purposes. This release is supported
  on Intel Platform and Kaby Lake NUC (NUC7i5DNHE) is the leading platform
  for Celadon in container [CIC]


New features
-------------

* New dynamic lunch target added 'cic'
* Setup script handles both secure and non-secure install from same image
* Ex: 
* ./setup-aic    --> non-secure 
* ./setup-aic -s --> secure 
* SEpolicy enabled [Very important : Ensure Sepolicy & LSM configs are
  enabled as part of host kernel]
* Trusty enabled
* Audio can work on both mediation & pass through
* BT and Wifi can work through mediation
* USB Mass storage works fine
* MTP/PTP Initiator Role enabled

Existing features
-----------------

* HDMI display support
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
* Video Codec support on celadon
* Sdcardfs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS,
  OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* eMMC / SATA / NVMe storage media supported
* Generic storage HAL supported

Known issues
-------------

* Ensure Sepolicy & LSM configs are enabled as part of host kernel, else
  CIC cant boot.
* While installing, Donot use same folder to keep secure and non-secure
  images. Create separate folders.
* Secure image flashing wont allow docker update. [Reason : System partition
  should not be modified]
* BT and Wifi Pass through are work in progress. Currently only mediaton
  enabled.
* Debian package wont work well. Fix is Work in progress.
* Lock screen cannot work in non-secure install

Validation results
------------------

This |C| build has been validated on |NUC| Kit NUC7i5DNHE in the following
function domains, for both secure and non-secure.

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
    SE-Policy                 Pass
    ======================== =======


Tools/Configuration
-------------------
* Docker version      : 18.09.2
* Host Ubuntu         : 18.04
* Host Kernel Version : 4.19.102 [With LSM & SELinux enabled]

Helpful hints/links
---------------------

* Few links are under construction, please stay tuned for latest updates
  soon.
* Build CIC     : https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-container-with-android-9
* Flash steps   : https://01.org/projectceladon/documentation/getting-started/on-container
* Manifest Link : https://github.com/projectceladon/manifest/blob/celadon/p/mr0/master/stable-build/CIC_01.20.01.12_A09.xml
* Binary Link   : https://github.com/projectceladon/celadon-binary/blob/master/CIC_01.20.01.12_A09/cic-aic-CC0000105.tar.gz
* If you plan to use Celadon in your product, please replace all the test
  keys under device/intel/build/testkeys/ with your product key.


CIV_01.20.01.12_A10
======================

* This is a Pre-Production Release for evaluation and development purposes
  and it cannot be used for production purposes. This release is supported
  on Intel Platform and KBL NUC (NUC7i5DNHE) is the leading platform for
  |C| in VM (lunch target: caas-userdebug).


New features 
-------------

* Setting Proxy for Wireless Network 
* Wifi Control from Android in VM 
* Multi-Camera upto 2 camera’s are supported
* MTP/PTP Initiator Role 
* Barcode Scanner  
* 9pfs based file transfer 
* Use Command : sudo -E ./start_android_qcow2.sh --wifi-passthrough (To get
  WIFI control in Android UI) and sudo -E ./start_android_qcow2.sh (To get
  WIFI control in HOST side)

Existing features
-----------------
* Graphics Memory Allocator (Gralloc) 1.0
* HDMI display support
* HWC 2.3 support for Display
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset and HDMI are supported
* Wi-Fi 802.11 a/b/g/n/ac and Bluetooth 4.2
* Wired Ethernet support
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
* Sdcardfs filesystem support enabled
* Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, MIDI, FLAC, PCM/WAV
* SDHCI host controller is enabled
* eMMC and SATA storage media supported
* Only logitech C922 pro stream webcam is supported for all camera related testing
* Generic storage HAL supported
* Security SELinux enforcing, Trusty TEE, File Based Encryption, Trusty, Keymaster 3.0

     * User guide:

        * SELinux Configuration and Rules
        * How to Enable or Disable Trusty for Debugging

Known issues
-------------
* Unable to connect WPA/WPA2 Enterprise Wi-Fi network in Android VM
* Hotplug doesn't work in secondary display

 
Validation results
------------------

|C| build has been validated on |NUC| Kit `NUC7i5DNH  <https://ark.intel.com/products/122488/Intel-NUC-Kit-NUC7i5DNHE>`_ in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU
BT                             OK        Bluetooth is working 
Audio over USB                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Display /Touch and Gesture     OK
Storage/SD Card                OK       Add “-device usb-host,vendorid=,productid=” into startandroidqcow2.sh.
Security                       OK
Boot/Kernel                    OK       Boots on QEMU 4.2.0
Ethernet                       OK
Image Flash                    OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG2/VP8/VP9 Video Playback
USB                            OK       MTP/PTP Initiator Role

=============================  =======  ========

 
Tools/Configuration
-------------------
* QEMU Version 4.2.0
* Host Ubuntu 18.04 
* Host Kernel Version 5.3.0.xx 
* Guest kernel 4.19.107


Helpful hints/links
---------------------
* Build Celadon in VM with Android 10 https://01.org/projectceladon/documentation/getting-started/build-source#build-c-in-vm-with-android-10
* We can use the same CIV Q-MR0 image to flash on the Kaby Lake |NUC| and
  Appollo Lake |NUC| as a Bare Metal <Lunch target caas-userdebug > 
* We haven’t ever validated ‘adb over USB’ on Android 10 + NUC7 (KBL)
  CIV_01.20.01.12_A10 as a Bare Metal and we don’t support it
* Please use below alternative:

    * ADB over Ethernet works
    * Please fall back to Android ‘P’  where adb over USB” works 
      https://github.com/projectceladon/celadon-documentation/blob/master/source/release-notes.rst#celadon-01-20-01-12-a09

* Manifest Link :https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_01.20.01.12_A10.xml
* Binary Link :https://github.com/projectceladon/celadon-binary/blob/master/CIV_01.20.01.12_A10/caas-flashfiles-eng.build.zip
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

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

   * To test the multichannel 5.1 channel playback, use setprop vendor.audio.hdmi_multichannel 1 from adb shell and make sure to unplug and re-plug HDMI device before testing . On commercial NUC currently HDMI device port 3 is enabled.

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

CIC_00.20.01.08_A09
===================

.. note::

    * The :abbr:`CiC (Celadon in Container)` manifest release is curently supported on Intel Platform : KBL NUC (NUC7i5DNHE).
    * This is a Pre-Production CiC Releases for evaluation and development purposes, they cannot be used for production.
    * Manifest : https://github.com/projectceladon/manifest/blob/celadon/p/mr0/master/stable-build/CIC_00.20.01.08_A09.xml 

Important notes and Remarks
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

Known issues
------------

* Multiple instances under implementation.
* Boot time optimization in progress.
* need to reboot device after 'adb reboot' for files to be reflected.
* CiC performance is under tuning.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.


CIV_00.20.01.09_A10
======================

* This is a Pre-Production February Manifest Release for evaluation and development purposes and it cannot be used for production purposes.
* This release is supported on Intel Platform and KBL NUC (NUC7i5DNHE) is the leading platform for Celadon in VM (lunch target: caas-userdebug).
* Manifest : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.20.01.09_A10.xml

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

Important notes and Remarks
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
      - BT is working 

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

Known issues
------------
* Video play is not smooth on 4K monitor.
* Touch Screen operation is not smooth on 4K monitor.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

CIC_00.19.04.20.03_A09
======================

.. note::
    * The :abbr:`CiC (Celadon in Container)` release is curently supported on Intel Platform : KBL NUC (NUC7i5DNHE).
    * This is a Pre-Production CiC Releases for evaluation and development purposes, they cannot be used for production.
    * Manifest : https://github.com/projectceladon/manifest/blob/celadon/p/mr0/master/stable-build/CIC_00.19.04.20.03_A09.xml


Important notes and Remarks
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

Known issues
------------

* Multiple instances under implementation.
* Boot time optimization in progress.
* need to reboot device after 'adb reboot' for files to be reflected.
* CiC performance is under tuning.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

CIV_00.19.04.20.02_A10
======================

This is a Pre-Production Release for evaluation and development purposes and it cannot be used for production purposes.
This release is supported on Intel Platform and KBL NUC (NUC7i5DNHE) is the leading platform for Celadon in VM (lunch target: caas-userdebug).
Manifest : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.19.04.20.02_A10.xml

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

Important notes and Remarks
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
      - BT is working 

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


Known issues
------------
* Audio recording is not supported currently.
* Video play is not smooth on 4K monitor.
* Touch Screen operation is not smooth on 4K monitor.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.

CIV_00.19.04.51_A10
===================

* This is a Pre-Production Release for evaluation and development purposes and it cannot be used for production purposes.
* This release is supported on Intel Platform and KBL NUC (NUC7i5DNHE) is the leading platform for Celadon in VM (lunch target: caas-userdebug).
* Manifest : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.19.04.51_A10.xml

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

    * AVC High pro @ Level 5.1 (4k@30fps)
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

Important notes and Remarks
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
      - BT is working 

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

 
Known issues
------------
* Video can be displayed with green flickering during playback.
* Audio recording is not supported currently.
* Audio is not routing through USB speakers.
* Android UI doesn’t boot up with Full Screen.
* Video play is not smooth on 4K monitor.
* Touch Screen operation is not smooth on 4K monitor.
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key.


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
    * The :abbr:`CaaS (Celadon as a Service)` and :abbr:`CIC (Celadon in Container)` releases are supported on Intel Platforms running Android on various Bare Metal x86 systems, Virtual Machines (KVM/Qemu), and also Containers.
    * The ingredients of the CaaS release can be used to build a service architecture, so that with customers we can deliver a **Celadon as a Service** solution.
    * These are Pre-Production CaaS and CIC Releases for evaluation and development purposes, they cannot be used for production.

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

* Only cover boot up function in early android 10 CIC image release.
* Bluetooth function is not ready on CAAS VM release.
* Audio 3.5 mm headphone function is not ready on CAAS VM release.
* CAAS and CIC performance is under tuning.
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

   * To test the multichannel 5.1 channel playback, use setprop vendor.audio.hdmi_multichannel 1 from adb shell and make sure to unplug and re-plug HDMI device before testing . On commercial NUC currently HDMI device port 3 is enabled.

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

   * To test the multichannel 5.1 channel playback, use setprop vendor.audio.hdmi_multichannel 1 from adb shell and make sure to unplug and re-plug HDMI device before testing . On commercial NUC currently HDMI device port 3 is enabled. 

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
* Basic Functionality of VGA port works like multidisplay support but there are issues with hotplug and some new Video Post Processing features (adjust Hue/Contrast/Saturation of video)
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
* Basic Functionality of VGA port works like multidisplay support but there are issues with hotplug and some new Video Post Processing features (adjust Hue/Contrast/Saturation of video)
* If you plan to use Celadon in your product, please replace all the test keys under device/intel/build/testkeys/ with your product key
