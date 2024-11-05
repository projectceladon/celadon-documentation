.. _base-releases-A13:

Android 13 Base Releases
########################

.. contents::
   :local:
   :depth: 1


CIV_01.23.02.15_A13
===================
* This is a Release for evaluation and development purpose. This release supports 12th GEN Core [Celadon in VM].

Intended audience
-----------------

* Open Source Community who has subscribed to celadon@lists.linuxfoundation.org
* Any user who wants to explore Celadon in VM

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------

New in this release
-------------------

 * Highlights/New Features
    * Android 13 with latest AOSP manifest (android-13.0.0_r30)
    * Power S3 Suspend/Resume of the CiV Guest OS on Screen Timeout
    * CPU Inferencing through NN HAL enabled
    * Support IOMMU
    * Configurable Application Windows
    * Set up static ip and proxy
    * Support EROFS
    * Support F2FS
    * Multi-pane feature for large screen devices
    * Kernel support chromium (5.15.78)
    * Kernel support SRIOV (5.15.71)
       * SRIOV (Single Root I/O Virtualization) Support
       * Virtualized Display – KMSRO/ Zero copy
       * 8k resolution support


 * Celadon features:
    * AIDL framework for HALs
    * Battery percentage for Android in Virtual Machine / Container
    * Support vulkan and open gles
    * Support BPF
    * Support FUSE BPF
    * Virtual VABc
    * KeyMint HAL 2.0
    * API level upgraded to 33
    * FCM Target level upgraded to 7
    * Audio HAL upgraded to 7.1
    * Trusty KeyMint support AIDL Version 2.0
    * Health HAL upgraded to AIDL 1.0
    * WIFI Supplicant and Hostapd upgraded to AIDL 1.0
    * SE Policy updated for API level 33
    * Virgl Support
    * Switch between h/w accelerated graphics and s/w graphics
    * Virtio-gpu Support
    * Tearing prevention
    * HDMI Audio
    * SoF HDA mediation solution
    * Virtual TPM2.0
    * Trusty KeyMint support
    * File based Encryption
    * VP9 h/w accelerated
    * Prime buffer sharing
    * Media Codec 2.0 h/w path
    * Super image > 4G
    * bootconfig support
    * WPA3 support
    * WiFi 802.11.ax Support
    * Bluetooth Control from Android in Virtual Machine
    * Support Control Plant – VM Manager
    * Switch USB touch screen between guest OSes
    * Integrated VM Manager to configure CIV replacing start_civ.sh
        * This changes launch steps for CIV - please refer to
          https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager
    * Boot control HAL V1.2
    * Browse Internet (IPv6)
    * WiFi Direct
    * WiFi Control from Android in Virtual Machine
    * Bug fixes, customizations and optimizations for x86
    * Graphics introduced scheduling plans
    * Graphics: Surface flinger caching, GPU memory accounting, profiling and
      GPU scheduling
    * Accessibility, System UI and backup & restore features updated with minor
      modifications
    * FUSE passthrough to improve IO performance
    * IncFS updated with Better Monitoring Support, virtio-9p support, fs-verity
      support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Approximate location access and privacy related updates
    * Memory accounting updates
    * Media transcoding, media extractor related changes and improved quality in encoded video
    * AVIF image support, Easier blurs, color filters, and other effects
    * CameraX vendor extension support
    * Wi-Fi privacy improvements with - Non-Persistent MAC Address Randomization
    * Bluetooth side, BT classic and BLE introduced
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.
    * Provide apps direct access to tombstone traces


Known issues
------------

* HDMI audio is not functional after adb reboot as the HDMI PCM cards are not listed by the driver.
* Unable to play AAC_ELD 16KHz recorded audio file ,same behavior as pixel.
* Delay observed in audio routing ( 3~4secs) from HDMI to USB Headset.
* Audio doesn't route to USB Headset when usb camera is connected.
  [WA] Need to reconnect usb headset to recover - Same behavior as pixel.
* Audio doesn't record from 3.5mm Headset when USB camera is connected while video recording as it picks the USB mic.
* Front Camera Preview is not mirror.
* Device doesn't go to suspend with [vcpu] num=16.
* Display doesn't turn off on 1st attempt with input keyevent 26
* Display of the DUT is turning off even if the "stay awake" option is enabled
* "Android boot-up logo" appears during display On/Off.
* Orientation of Android Settings changes to Portrait when select from recent tab


Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_01.23.02.15_A13.xml
* Binary link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_01.23.02.15_A13

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
   * Note : If developer wants to build locally with the 8k and SRIOV supported kernel, BASE_LINUX_INTEL_LTS2021_KERNEL=true needs to be used in make command.
      * $ make flashfiles BASE_LINUX_INTEL_LTS2021_KERNEL=true  -j $(nproc)


* Steps To build the host kernel for this manifest

    * Download  caas-releasefiles-userdebug.tar.gz and put it under ~/civ
    * cd ~/civ && tar zxvf caas-releasefiles-userdebug.tar.gz
    * To build Chromium kernel
       * cd patches/kernel/lts2021-chromium
       * ./build_weekly.sh
       * Deb files will be generated in patches/kernel/lts2021-chromium/host_kernel
    * To build SRIOV supported kernel
       * cd patches/kernel/linux-intel-lts2021
       * ./build_weekly.sh
       * Deb files will be generated in patches/kernel/linux-intel-lts2021/host_kernel
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
     * https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager

Validation results
------------------

This build has been validated on Alder Lake NUC in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Security                       OK
Boot                           OK       Boots on QEMU 7.0.0
Ethernet                       OK
Image Flash                    OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG2/VP8/VP9 Video Playback
USB                            OK       Keyboard , Mouse , Pen drive
Display                        OK
Touch and Gesture              OK
=============================  =======  ========


Reference configuration
-----------------------

 * Supported hardware

     * Product -  Alder Lake [NUC12WSHi7]

 * Supported software

     * AOSP Version - android-13.0.0_r30
     * Host Kernel for GVT-d - 5.15.78-cvhb
     * Guest kernel for GVT-d - 5.15.78-cvhb
     * Host Kernel for SRIOV - 5.15.71-vhb
     * Guest kernel for SRIOV - 5.15.71-vhb


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
* Build Celadon in VM  https://projectceladon.github.io/celadon-documentation/getting-started/on-vm.html#build-c-images-running-in-vm
* Flash Steps : https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager
* Linked to Android 13 Google Public document --> https://source.android.com/docs/setup/start/android-13-release

CIV_00.22.04.48_A13
===================
* This is a Production Release for evaluation and development purpose. This release supports 12th GEN Core [Celadon in VM].

Intended audience
-----------------

* Open Source Community who has subscribed to celadon@lists.linuxfoundation.org
* Any user who wants to explore Celadon in VM

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------

New in this release
-------------------

 * Highlights/New Features
    * Android 13 with latest AOSP manifest (android-13.0.0_r12)
    * AIDL for HAL
    * Support vulkan and open gles
    * Support BPF
    * Kernel support (5.15.74)
    * Support FUSE BPF
    * Virtual VABc
    * KeyMint HAL 2.0

 * Celadon features:
    * API level upgraded to 33
    * FCM Target level upgraded to 7
    * Audio HAL upgraded to 7.1
    * Trusty KeyMint support AIDL Version 2.0
    * Health HAL upgraded to AIDL 1.0
    * WIFI Supplicant and Hostapd upgraded to AIDL 1.0
    * SE Policy updated for API level 33
    * Virgl Support
    * SRIOV (Single Root I/O Virtualization) Support
    * Switch between h/w accelerated graphics and s/w graphics
    * Virtio-gpu Support
    * Tearing prevention
    * Virtualized Display – KMSRO/ Zero copy
    * Switch displays between guests
    * 8k resolution support
    * HDMI Audio
    * SoF HDA mediation solution
    * Virtual TPM2.0
    * Trusty KeyMint support
    * File based Encryption
    * VP9 h/w accelerated
    * Prime buffer sharing
    * Media Codec 2.0 h/w path
    * Super image > 4G
    * bootconfig support
    * WPA3 support
    * WiFi 802.11.ax Support
    * Bluetooth Control from Android in Virtual Machine
    * Support Control Plant – VM Manager
    * Switch USB touch screen between guest OSes
    * Integrated VM Manager to configure CIV replacing start_civ.sh
        * This changes launch steps for CIV - please refer to
          https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager
    * Boot control HAL V1.2
    * Browse Internet (IPv6)
    * WiFi Direct
    * WiFi Control from Android in Virtual Machine
    * Bug fixes, customizations and optimizations for x86
    * Graphics introduced scheduling plans
    * Graphics: Surface flinger caching, GPU memory accounting, profiling and
      GPU scheduling
    * Accessibility, System UI and backup & restore features updated with minor
      modifications
    * FUSE passthrough introduced to improve IO performance in Android S
    * IncFS updated with Better Monitoring Support, virtio-9p support, fs-verity
      support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Approximate location access and privacy related updates
    * Memory accounting updates
    * Media side, Audio supports BLE audio, Haptics generator, Multi-channel audio optimised in Android S
    * Media transcoding, media extractor related changes and improved quality in encoded video
    * AVIF image support, Easier blurs, color filters, and other effects
    * CameraX vendor extension support
    * Enabled NNAPI updatability in Machine Learning
    * Wi-Fi privacy improvements with - Non-Persistent MAC Address Randomization
    * Bluetooth side, BT classic and BLE introduced
    * Activity Detection, CHRE, Bluesky, FLP & RTT related changes
    * Major changes in window management and introduced Display grouping and emphasis for multi-display context
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.
    * Picture in Picture (PiP) improvements, Immersive mode improvements for gesture navigation, Rich content insertion and Recents URL sharing
    * Provide apps direct access to tombstone traces


Known issues
------------

* HDMI audio is lost after adb reboot.
* Video thumbnails are not loaded properly in Gallery app.


Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.22.04.48_A13.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.22.04.48_A13


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
    * cd patches/kernel/lts2021-chromium
    * ./build_weekly.sh
    * Deb files will be generated in
      patches/kernel/lts2021-chromium/host_kernel
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
     * https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager

Validation results
------------------

This build has been validated on Alder Lake NUC in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Security                       OK
Boot                           OK       Boots on QEMU 7.0.0
Ethernet                       OK
Image Flash                    OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG2/VP8/VP9 Video Playback
USB                            OK       Keyboard , Mouse , Pen drive
Display                        OK
Touch and Gesture              OK
=============================  =======  ========


Reference configuration
-----------------------

 * Supported hardware

     * Product -  Alder Lake [NUC12WSHi7]

 * Supported software

     * AOSP Version - android-13.0.0_r12
     * NUC11PAQI7 Host Kernel - 5.15.74-cvhb
     * NUC11PAQI7 Guest kernel - 5.15.74-cvhb


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
* Flash Steps : https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager
* Linked to Android 13 Google Public document --> https://source.android.com/docs/setup/start/android-13-release

CIV_00.22.03.34_A13
===================
* We are glad to announce that the Celadon Project now supports Android 13 within a day of Google PV. We wish the Celadon community to start working with Android 13     and provide us feedback on what more would you like to see in the Celadon project.
* This is a Pre Production Manifest Release for evaluation and development purposes. The release cannot be used for production purposes. This release supports 11th    and 12th GEN Core [Celadon in VM].

Intended audience
-----------------

* Open Source Community who has subscribed to celadon@lists.linuxfoundation.org
* Any user who wants to explore Celadon in VM

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------

New in this release
-------------------

 * Highlights
    * This is the First Celadon in VM Release based on Android 13
    * API level upgraded to 33
    * FCM Target level upgraded to 7
    * All the features of Android 13 provided with Intel BSP including HAL changes
    * Android 13 with latest AOSP manifest (android-13.0.0_r1)

 * Major HAL Upgrades
    * Audio HAL upgraded to 7.1
    * Trusty KeyMint support AIDL Version 2.0
    * Health HAL upgraded to AIDL 1.0
    * WIFI Supplicant and Hostapd upgraded to AIDL 1.0
    * SE Policy updated for API level 33

 * Celadon features:
    * Virgl Support
    * SRIOV (Single Root I/O Virtualization) Support
    * Switch between h/w accelerated graphics and s/w graphics
    * Virtio-gpu Support
    * Tearing prevention
    * Virtualized Display – KMSRO/ Zero copy
    * Switch displays between guests
    * 8k resolution support
    * HDMI Audio
    * SoF HDA mediation solution
    * Virtual TPM2.0
    * Trusty KeyMint support
    * File based Encryption
    * VP9 h/w accelerated
    * Prime buffer sharing
    * Media Codec 2.0 h/w path
    * Super image > 4G
    * bootconfig support
    * WPA3 support
    * WiFi 802.11.ax Support
    * Bluetooth Control from Android in Virtual Machine
    * ISH Enabled
    * Support Control Plant – VM Manager
    * Switch USB touch screen between guest OSes
    * Incremental FS, F2FS support
    * Integrated VM Manager to configure CIV replacing start_civ.sh
        * This changes launch steps for CIV - please refer to
          https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager
    * Boot control HAL V1.2
    * Browse Internet (IPv6)
    * WiFi Direct
    * WiFi Control from Android in Virtual Machine
    * Bug fixes, customizations and optimizations for x86
    * Graphics introduced scheduling plans
    * Graphics: Surface flinger caching, GPU memory accounting, profiling and
      GPU scheduling
    * Accessibility, System UI and backup & restore features updated with minor
      modifications
    * FUSE passthrough introduced to improve IO performance in Android S
    * IncFS updated with Better Monitoring Support, virtio-9p support, fs-verity
      support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Approximate location access and privacy related updates
    * Memory accounting updates
    * Media side, Audio supports BLE audio, Haptics generator, Multi-channel audio optimised in Android S
    * Media transcoding, media extractor related changes and improved quality in encoded video
    * AVIF image support, Easier blurs, color filters, and other effects
    * CameraX vendor extension support
    * Enabled NNAPI updatability in Machine Learning
    * Wi-Fi privacy improvements with - Non-Persistent MAC Address Randomization
    * Bluetooth side, BT classic and BLE introduced
    * Activity Detection, CHRE, Bluesky, FLP & RTT related changes
    * Major changes in window management and introduced Display grouping and emphasis for multi-display context
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.
    * Picture in Picture (PiP) improvements, Immersive mode improvements for gesture navigation, Rich content insertion and Recents URL sharing
    * Provide apps direct access to tombstone traces


Known issues
------------
* SRIOV is not working properly -Analysis WIP

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.22.03.34_A13.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.22.03.34_A13


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
    * cd patches/kernel/lts2020-chromium
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
     * https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager

Validation results
------------------

This build has been validated on Alder Lake RVP in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3, AAC-LC, AAC-ELD, HEAAC, HEAAC-V2, VORBIS, OPUS, FLAC, PCM/WAV formats supported
Adb connect over WIFI          OK
Adb connect over Ethernet      OK
Security                       OK
Boot                           OK       Boots on QEMU 6.0.0
Ethernet                       OK
Image Flash                    OK
Web browsing                   OK
Video playback                 OK       H264/H265/MPEG2/VP8/VP9 Video Playback
USB                            OK       Keyboard , Mouse , Pen drive
Display                        OK
Touch and Gesture              OK
=============================  =======  ========


Reference configuration
-----------------------

 * Supported hardware

     * Product -  Alder Lake RVP

 * Supported software

     * AOSP Version - android-13.0.0_r1
     * NUC11PAQI7 Host Kernel - -5.10.118-cvhb
     * NUC11PAQI7 Guest kernel - -5.10.118-cvhb


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
* Flash Steps : https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager
* Linked to Android 13 Google Public document --> https://source.android.com/docs/setup/start/android-13-release
