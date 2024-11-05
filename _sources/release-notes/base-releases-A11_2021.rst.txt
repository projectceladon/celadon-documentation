.. _base-releases-A11_2021:

Android 11 [2021] Base Releases
#############################

.. contents::
   :local:
   :depth: 1


CIV_01.21.03.39_A11
===================
* This is a Production Binary Release for evaluation and development
  purposes . This release is
  supported on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_ Celadon in VM.

Intended audience
-----------------

* Open Source Community who has subscribed to celadon@lists.linuxfoundation.org

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------

New in this release
-------------------

 * New features
    * Power Management - Suspend/Resume - Stability
    * Intel Sensor Hub
    * Config WLAN
    * Audio HDA Mediation
    * Compliance production targets achieved

 * Existing features
    * This release uses start_civ.sh to launch Link -https://docs.01.org/celadon/getting-started/on-vm.html?highlight=start_civ#use-start-civ-sh
    * AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats
    * Power Management - Suspend/Resume
    * Local Video Playback with Widevine DRM - Level 3
    * External USB Camera
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
    * Trusty Hardware Seed binding
    * Power Management - Suspend,Resume
    * Android\* key Input Manager Framework is implemented for Power &
      Volume buttons
    * Integrated Sensor Hub Enablement for Android Supported Sensors
    * Android Thermal HAL and Thermal Manager Service
    * BZIP2 performance improvements
    * Bluetooth Control from Android in VM
    * HDMI Audio Output Support
    * Virtio-gpu Support
    * SDHCI mediation enabled and supported SD card

      * CIV launch script for SD Card: sudo -E ./scripts/start_civ.sh -d GVT-d -b /dev/mmcblk0p1 --passthrough-pci-usb

    * Graphics GVT-d support
    * HDMI and DP display support
    * Mass Storage USB 2.0 and 3.x devices is supported
    * Adb over WIFI and Ethernet is supported
    * Audio playback over USB Headset, 3.5mm and HDMI are supported
    * Setting Proxy for Wireless Network
    * Wi-Fi 802.11 a/b/g/n/ac/ax and Bluetooth 4.2
    * Ethernet works fine with Ethernet to USB converter
    * Wifi Control from Android in VM using usb passthrough
    * To passthrough USB host controller in NUC11PAQI7, run the CIV launch
      script like this: sudo E ./scripts/start_civ.sh -g GVT-d --passthrough-pci-usb
    * Power Management - Shutdown and Reboot
    * Android Time keeping with Host OS
    * Product Information to Guest OS
    * ODM partition for vendor customizations
    * Only logitech C922 pro stream webcam is supported for all camera
      related testing
    * HW Video Codecs support on celadon

        **Decoder**

            * AVC High profile @ Level 5.1 (4k@30fps)
            * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10
              with BT2020 and ST2084 information is not supported)
            * VP9 profile 0 @ Level 5 (4k@30fps)
            * Vp8 8 bits 1080p@60fps

        **Encoder**

            * AVC High profile @ level 4.1 (1080P@30fps)
            * HEVC Main profile @ Level 4 (1080P@30fps)

    * Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2,
      VORBIS, OPUS, MIDI, FLAC, PCM/WAV
    * Generic storage HAL supported
    * SATA emulation is supported
    * 9pfs based file transfer
    * Security SELinux enforcing, Trusty TEE, File Based Encryption, Trusty,
      Keymaster 3.0

         * User guide:

            * SELinux Configuration and Rules
            * How to Enable or Disable Trusty for Debugging

 * Changes to existing features
    * Dynamic routing to HDMI audio devices

 * Unsupported or discontinued features


Known issues
------------

* Android UI Flicker when booted with eDP Display
* Blank screen is displayed while video playback
  [Configuration : GLrenderer-Virtio] & [GLrenderer-Softpipe]
* Camera Preview Flickers while using MultiCamera application
* IPV6 network does not work for usb2ethernet converter in recovery mode
* Modification of  time zone when "Use network-provided time" should be disabled


Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_01.21.03.39_A11.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.21.03.39_A11

System Requirements
-------------------
* Recommended system requirements for Host:
    * CPU:  4 cores or more
    * RAM:  8 GB or more
    * Hard-Disk: 250 GB [Desired]

How to install this release
---------------------------

* Steps to sync to this release

   * repo init -u https://github.com/projectceladon/manifest -b master -m stable-build/CIV_XX.XX.XX.XX_AXX.xml
   * NOTE : Manifest tag will change according to the latest release
   * repo sync -c -q -j${nproc}

* Android build commands

   * For Compilation please use Ubuntu 18.04
   * source build/envsetup.sh
   * lunch caas-userdebug
   * make flashfiles -jN

* Steps To build the host kernel for this manifest

    * Download  caas-releasefiles-userdebug.tar.gz and put it under ~/civ
    * cd ~/civ && tar zxvf caas-releasefiles-userdebug.tar.gz
    * cd patches/kernel/lts2019-chromium
    * ./build_weekly.sh
    * Deb files will be generated in
      patches/kernel/lts2019-chromium/host_kernel
    * sudo dpkg -i \*.deb
    * Update grub to wait indefinitely for kernel selection on boot

        * sudo vim /etc/default/grub
        * Comment out GRUB_TIMEOUT_STYLE=hidden
          #GRUB_TIMEOUT_STYLE=hidden
        * Uncomment the following line and modify grub timeout to -1 for
          indefinite wait or 5 for 5secs wait
          #GRUB_TIMEOUT=-1
        * Save the file
        * sudo update-grub

    * sudo reboot
    * Select compiled kernel from "Advanced options for Ubuntu"

* Flash and run steps

   * Download flash-files [https://github.com/projectceladon/celadon-binary]
   * Untar <flash-files>
   * sudo -E ./scripts/setup_host -u headless
   * sudo -E ./scripts/start_flash_usb.sh caas-flashfiles-eng.<user>.zip --display-off
   * sudo -E ./scripts/start_civ.sh -g GVT-d

Validation results
------------------

|C| build has been validated on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_  in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
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


Reference configuration
-----------------------

 * Supported hardware

     * Product - NUC11PAQI7


 * Supported software

     * AOSP Version - android-11.0.0_r39
     * NUC11PAQI7 Host Kernel - -5.4.142-cvhb
     * NUC11PAQI7 Guest kernel - -5.4.142-cvhb


Acronyms and terms
------------------

* CIV - Celadon in Virtual Machine


Helpful hints / related documents
---------------------------------

* If you plan to use Celadon in product, please replace all the test keys
  under device/intel/build/testkeys/ with your product key.  
* The release of this project will be signed by test keys, it's only a
  reference for our customer and we are not responsible for this. Customers
  should use their own keys to sign their release images
* Build Celadon in VM  https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm


CIV_00.21.02.27_A11
===================

* This is a Pre-Production Binary Release for evaluation and development
  purposes and it cannot be used for production purposes. This release is
  supported on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_ Celadon in VM.

Intended audience
-----------------

* Open Source Community who has subscribed to celadon@lists.linuxfoundation.org

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------

New in this release
-------------------

 * New features

    * AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats
    * Power Management - Suspend/Resume
    * Local Video Playback with Widevine DRM - Level 3
    * External USB Camera

 * Existing features
    * This release uses start_civ.sh to launch Link -https://docs.01.org/celadon/getting-started/on-vm.html?highlight=start_civ#use-start-civ-sh
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
    * Trusty Hardware Seed binding
    * Power Management - Suspend,Resume
    * Android\* key Input Manager Framework is implemented for Power &
      Volume buttons
    * Integrated Sensor Hub Enablement for Android Supported Sensors
    * Android Thermal HAL and Thermal Manager Service
    * BZIP2 performance improvements
    * Bluetooth Control from Android in VM
    * HDMI Audio Output Support
    * Virtio-gpu Support
    * SDHCI mediation enabled and supported SD card

      * CIV launch script for SD Card: sudo -E ./scripts/start_android_qcow2.sh --sdonly

    * Graphics GVT-d support
    * HDMI and DP display support
    * Mass Storage USB 2.0 and 3.x devices is supported
    * Adb over WIFI and Ethernet is supported
    * Audio playback over USB Headset, 3.5mm and HDMI are supported
    * Setting Proxy for Wireless Network
    * Wi-Fi 802.11 a/b/g/n/ac/ax and Bluetooth 4.2
    * Ethernet works fine with Ethernet to USB converter
    * Wifi Control from Android in VM using usb passthrough
    * To passthrough USB host controller in NUC11PAQI7, run the CIV launch
      script like this: sudo E ./scripts/start_civ.sh -g GVT-d --passthrough-pci-usb
    * Power Management - Shutdown and Reboot
    * Android Time keeping with Host OS
    * Product Information to Guest OS
    * ODM partition for vendor customizations
    * Only logitech C922 pro stream webcam is supported for all camera
      related testing
    * HW Video Codecs support on celadon

        **Decoder**

            * AVC High profile @ Level 5.1 (4k@30fps)
            * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)(Main 10
              with BT2020 and ST2084 information is not supported)
            * VP9 profile 0 @ Level 5 (4k@30fps)
            * Vp8 8 bits 1080p@60fps

        **Encoder**

            * AVC High profile @ level 4.1 (1080P@30fps)
            * HEVC Main profile @ Level 4 (1080P@30fps)

    * Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2,
      VORBIS, OPUS, MIDI, FLAC, PCM/WAV
    * Generic storage HAL supported
    * SATA emulation is supported
    * 9pfs based file transfer
    * Security SELinux enforcing, Trusty TEE, File Based Encryption, Trusty,
      Keymaster 3.0

         * User guide:

            * SELinux Configuration and Rules
            * How to Enable or Disable Trusty for Debugging

 * Changes to existing features

 * Unsupported or discontinued features


Known issues
------------

* Android UI Flicker when booted with eDP Display
* Blank screen is displayed while video playback
  [Configuration : GLrenderer-Virtio] & [GLrenderer-Softpipe]
* Camera Preview Flickers while using MultiCamera application

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.21.02.27_A11.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.21.02.27_A11


How to install this release
---------------------------

* Steps to sync to this release

   * repo init -u https://github.com/projectceladon/manifest -b master -m stable-build/CIV_XX.XX.XX.XX_AXX.xml
   * NOTE : Manifest tag will change according to the latest release
   * repo sync -c -q -j${nproc}

* Android build commands

   * For Compilation please use Ubuntu 18.04
   * source build/envsetup.sh
   * lunch caas-userdebug
   * make flashfiles -jN

* Steps To build the host kernel for this manifest

    * Download  caas-releasefiles-userdebug.tar.gz and put it under ~/civ
    * cd ~/civ && tar zxvf caas-releasefiles-userdebug.tar.gz
    * cd patches/kernel/lts2019-chromium
    * ./build_weekly.sh
    * Deb files will be generated in
      patches/kernel/lts2019-chromium/host_kernel
    * sudo dpkg -i \*.deb
    * Update grub to wait indefinitely for kernel selection on boot

        * sudo vim /etc/default/grub
        * Comment out GRUB_TIMEOUT_STYLE=hidden
          #GRUB_TIMEOUT_STYLE=hidden
        * Uncomment the following line and modify grub timeout to -1 for
          indefinite wait or 5 for 5secs wait
          #GRUB_TIMEOUT=-1
        * Save the file
        * sudo update-grub

    * sudo reboot
    * Select compiled kernel from "Advanced options for Ubuntu"

* Flash and run steps

   * Download flash-files [https://github.com/projectceladon/celadon-binary]
   * Untar <flash-files>
   * sudo -E ./scripts/setup_host -u headless
   * sudo -E ./scripts/start_flash_usb.sh caas-flashfiles-eng.<user>.zip --display-off
   * sudo -E ./scripts/start_civ.sh -g GVT-d

Validation results
------------------

|C| build has been validated on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_  in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
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


Reference configuration
-----------------------

 * Supported hardware

     * Product - NUC11PAQI7


 * Supported software

     * AOSP Version - android-11.0.0_r38
     * NUC11PAQI7 Host Kernel - -5.4.121-cvhb
     * NUC11PAQI7 Guest kernel - -5.4.121-cvhb


Acronyms and terms
------------------

* CIV - Celadon in Virtual Machine


Helpful hints / related documents
---------------------------------

* If you plan to use Celadon in product, please replace all the test keys
  under device/intel/build/testkeys/ with your product key.  
* The release of this project will be signed by test keys, it's only a
  reference for our customer and we are not responsible for this. Customers
  should use their own keys to sign their release images
* Build Celadon in VM  https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm


CIV_00.21.02.25_A11
===================

* This is a Pre-Production Manifest Release for evaluation and development
  purposes and it cannot be used for production purposes. This release is
  supported on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_ Celadon in VM.

Intended audience
-----------------

* Open Source Community who has subscribed to cceladon@lists.linuxfoundation.org

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------

New in this release
-------------------

 * New features

    * AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats
    * Power Management - Suspend/Resume
    * Local Video Playback with Widevine DRM - Level 3
    * External USB Camera

 * Existing features
    * This release uses start_civ.sh to launch Link -https://docs.01.org/celadon/getting-started/on-vm.html?highlight=start_civ#use-start-civ-sh
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
    * Trusty Hardware Seed binding
    * Power Management - Suspend,Resume
    * Android key Input Manager Framework is implemented for Power and
      Volume buttons
    * Integrated Sensor Hub Enablement for Android Supported Sensors
    * Android Thermal HAL and Thermal Manager Service
    * BZIP2 performance improvements
    * Bluetooth Control from Android in VM
    * HDMI Audio Output Support
    * Virtio-gpu Support
    * SDHCI mediation enabled and supported SD card

      * CIV launch script for SD Card: sudo -E ./scripts/start_android_qcow2.sh --sdonly

    * Graphics GVT-d support
    * HDMI and DP display support
    * Mass Storage USB 2.0 and 3.x devices is supported
    * Adb over WIFI and Ethernet is supported
    * Audio playback over USB Headset, 3.5mm and HDMI are supported
    * Setting Proxy for Wireless Network
    * Wi-Fi 802.11 a/b/g/n/ac/ax and Bluetooth 4.2
    * Ethernet works fine with Ethernet to USB converter
    * Wifi Control from Android in VM using usb passthrough
    * To passthrough USB host controller in NUC11PAQI7, run the CIV launch script like this: sudo E ./scripts/start_civ.sh -g GVT-d --passthrough-pci-usb
    * Power Management - Shutdown and Reboot
    * Android Time keeping with Host OS
    * Product Information to Guest OS
    * ODM partition for vendor customizations
    * Only logitech C922 pro stream webcam is supported for all camera related testing
    * HW Video Codecs support on celadon

        **Decoder**

            * AVC High profile @ Level 5.1 (4k@30fps)
            * HEVC Main and Main 10 profile @ Level 5 (4k@30fps)
              (Main 10 with BT2020 and ST2084 information is not supported)
            * VP9 profile 0 @ Level 5 (4k@30fps)
            * Vp8 8 bits 1080p@60fps

        **Encoder**

            * AVC High profile @ level 4.1 (1080P@30fps)
            * HEVC Main profile @ Level 4 (1080P@30fps)

    * Audio decoders supported: MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2,
      VORBIS, OPUS, MIDI, FLAC, PCM/WAV
    * Generic storage HAL supported
    * SATA emulation is supported
    * 9pfs based file transfer
    * Security SELinux enforcing, Trusty TEE, File Based Encryption, Trusty,
      Keymaster 3.0

         * User guide:

            * SELinux Configuration and Rules
            * How to Enable or Disable Trusty for Debugging

 * Changes to existing features

 * Unsupported or discontinued features


Known issues
------------

* Android UI Flicker when booted with eDP Display
* Blank screen is displayed while video playback
  [Configuration : GLrenderer-Virtio] & [GLrenderer-Softpipe]
* Camera Preview Flickers while using MultiCamera application

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.21.02.25_A11.xml


How to install this release
---------------------------

* Steps to sync to this release

   * repo init -u https://github.com/projectceladon/manifest -b master -m stable-build/CIV_XX.XX.XX.XX_AXX.xml
   * NOTE : Manifest tag will change according to the latest release
   * repo sync -c -q -j${nproc}

* Android build commands

   * For Compilation please use Ubuntu 18.04
   * source build/envsetup.sh
   * lunch caas-userdebug
   * make flashfiles -jN

* Steps To build the host kernel for this manifest

    * Download  caas-releasefiles-userdebug.tar.gz and put it under ~/civ
    * cd ~/civ && tar zxvf caas-releasefiles-userdebug.tar.gz
    * cd patches/kernel/lts2019-chromium
    * ./build_weekly.sh
    * Deb files will be generated in
      patches/kernel/lts2019-chromium/host_kernel
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

* Flash and run steps

   * Download flash-files [https://github.com/projectceladon/celadon-binary]
   * Untar <flash-files>
   * sudo -E ./scripts/setup_host -u headless
   * sudo -E ./scripts/start_flash_usb.sh caas-flashfiles-eng.<user>.zip --display-off
   * sudo -E ./scripts/start_civ.sh -g GVT-d


Validation results
------------------

|C| build has been validated on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_  in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
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


Reference configuration
-----------------------

 * Supported hardware

     * Product - NUC11PAQI7


 * Supported software

     * AOSP Version - android-11.0.0_r37
     * NUC11PAQI7 Host Kernel - -5.4.121-cvhb
     * NUC11PAQI7 Guest kernel - -5.4.121-cvhb


Acronyms and terms
------------------

* CIV - Celadon in Virtual Machine


Helpful hints / Related documents
---------------------------------

* If you plan to use Celadon in product, please replace all the test keys
  under device/intel/build/testkeys/ with your product key.  
* The release of this project will be signed by test keys, it's only a
  reference for our customer and we are not responsible for this. Customers
  should use their own keys to sign their release images
* Build Celadon in VM  https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm


CIV_00.21.01.12_A11
===================

* This is a Pre-Production Release for evaluation and development purposes and it cannot be used for production purposes. This release is supported on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_ Celadon in VM.

New features
-----------------

* Supports Intel Core 11th Gen
* ADB over DbC support
* Widevine Ready for NUC11PAQI7
* WFA Security- Enhanced Open (OWE) support


Existing Features
-----------------
* This release uses start_civ.sh to launch Link -https://docs.01.org/celadon/getting-started/on-vm.html?highlight=start_civ#use-start-civ-sh
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
* Trusty Hardware Seed binding
* Power Management - Suspend,Resume
* Android key Input Manager Framework is implemented for Power and
  Volume buttons
* Integrated Sensor Hub Enablement for Android Supported Sensors
* Android Thermal HAL and Thermal Manager Service
* BZIP2 performance improvements
* Bluetooth Control from Android in VM
* HDMI Audio Output Support
* Virtio-gpu Support
* SDHCI mediation enabled and supported SD card

   * CIV launch script for SD Card: sudo -E ./scripts/start_android_qcow2.sh --sdonly

* Graphics GVT-d support
* HDMI and DP display support
* Mass Storage USB 2.0 and 3.x devices is supported
* Adb over WIFI and Ethernet is supported
* Audio playback over USB Headset, 3.5mm and HDMI are supported
* Setting Proxy for Wireless Network
* Wi-Fi 802.11 a/b/g/n/ac/ax and Bluetooth 4.2
* Ethernet works fine with Ethernet to USB converter
* Wifi Control from Android in VM using usb passthrough
* To passthrough USB host controller in NUC11PAQI7, run the CIV launch
  script like this: sudo E ./scripts/start_civ.sh -g GVT-d --passthrough-pci-usb
* Power Management - Shutdown and Reboot
* Android Time keeping with Host OS
* Product Information to Guest OS
* ODM partition for vendor customizations
* Only logitech C922 pro stream webcam is supported for all camera related
  testing
* HW Video Codecs support on celadon

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


Known issues
-------------

* After recording the video in MultiCamera, it can be successfully played in
  MUltiCamera, but the playback in photos app fails
* Android is not Booting UI after "adb reboot" when connected with eDP
  Display
* Possible Buffer overflow with strncat in hcitools
* Camera Preview Flickers
* CFI failure seen during suspend/resume , This is merged on Latest HEAD
* Android UI is flickering sometimes
* Android UI doesn't launch in Mosaic mode
* Captured Photo shows Black in ImageView.[AOSP Camera]
* ADB goes offline after performing adb root/remount operation , this issue
  is fixed on the latest HEAD
* Direct LAN to NUC11PAQI7 ethernet port is not working in this release

   * The fix patch for Direct LAN to NUC11PAQI7 ethernet port issue is as below - it is merged on the latest HEAD

      * https://github.com/projectceladon/device-androidia-mixins/pull/1086 # 2021-03-30 # Add support for Ethernet Controller I225-V
      * https://github.com/projectceladon/vendor-intel-utils/pull/1071 # 2021-03-30 # Enable config for Ethernet Controller I225-LM/I225-V support

* Android UI Flicker when booted with eDP Display

Validation results
------------------

|C| build has been validated on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_  in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
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
* Host Kernel Version 5.4.76 [Build kernel from the tar ball of this release
  -Steps Below under hints section]
* Guest kernel 5.4.76


Helpful Hints / Links
---------------------

* Build Celadon in VM  https://01.org/projectceladon/documentation/getting-started/build-source#build-os-image
* Flash Steps : https://01.org/projectceladon/documentation/getting-started/on-vm#build-c-images-running-in-vm
* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.21.01.12_A11.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.21.01.12_A11
* If you plan to use Celadon in product, please replace all the test keys
  under device/intel/build/testkeys/ with your product key.

  * The release of this project will be signed by test keys, it's only a
    reference for our customer and we are not responsible for this. Customers
    should  use their own keys to sign their release images

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

