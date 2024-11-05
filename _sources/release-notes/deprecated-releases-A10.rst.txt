.. _deprecated-releases-A10:

Android 10 Deprecated Releases
##############################

.. contents::
   :local:
   :depth: 1


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

