.. _base-releases-A14:

Android 14 Base Releases
########################

.. contents::
   :local:
   :depth: 1

CIV_00.23.04.51_A14
===================
* This is a Pre-Production Binary Release for evaluation and development purpose. This release supports 13th GEN Core [Celadon in VM].

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

 * Android 14 brings in the below major features:
    * Android Virtualization Framework (AVF) updates
    * Android System APIs for AVF
    * Large Screen Enhancements
    * Adopting Scribe in App/Toolkit
    * Concurrent Displays
    * Window manager extensions
    * Windowmanager Jetpack API to allow all applications access to functionality.
    * Full-screen intent limits
    * App Compatibility for large screens
    * Low Latency Graphics
    * Fuse-Bpf updates
    * Vendor APEX
    * Storage & updatability – EROFS and OTA performance addressed.
    * Binder and Android IDL (AIDL)
    * HAL interfaces are converted to AIDL (~99%) or deprecated (one exception)
    * Multigenerational LRU (MGLRU) is a rework related change
    * Audio: Dynamic soundbar mode
    * Multiple USB audio device routing updates
    * Sound dose
    * Preferred audio mixer attributes on USB devices
    * Camera extensions feature
    * Reference USB camera HAL
    * Ultra HDR
    * Wide gamut capture
    * Connectivity: ASHA advertisements for hearing aid devices
    * Qualified network service
    * Time and time zone detection updates
    * Ultra-wideband HSL interface
    * Wi-Fi vendor HAL
    * Virtualization Wi-Fi feature updates
    * Enterprise device policy resolution framework
    * Android Baseline Profile (ABP) and Vulkan implementation
    * Reduced graphics buffer memory consumption
    * Performance boost for games
    * Capture Content for Notes
    * COMPANION_DEVICE_GLASSES role
    * COMPANION_DEVICE_NEARBY_DEVICE_STREAMING role
    * Power Manager ACQUIRE_CAUSES_WAKEUP permissions.
    * Runtime: JDWP thread creation
    * Runtime: OpenJDK 17 updates
    * Filename encryption
    * Multiple IMEIs
    * Dynamic Code Loading (DCL),
    * Picker choice in media permission
    * Full release notes from Google can be found at: https://source.android.com/docs/setup/about/android-14-release

 * Celadon features:
    * AIDL framework updates for HALs.
    * API level upgraded to 34
    * FCM Target level upgraded to 8
    * Camera provider HAL moved to AIDL V2.0
    * Graphics composer HAL moved to composer3 AIDL V2.0
    * Thermal HAL moved to AIDL V1.0
    * Graphics allocator HAL moved to AIDL V2.0
    * Boot HAL moved to AIDL V1.0
    * WiFi HAL moved to AIDL V1.0
    * Identity HAL moved to AIDL V5.0
    * security keymint HAL moved to AIDL V3.0
    * gatekeeper hal moved to AIDL V1.0
    * Sensor HAL moved to AIDL V1.0
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.


Known issues
------------
   * The Blink issue seen in previous release is now fixed with latest kernel 6.1.61

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.23.04.51_A14.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.23.04.51_A14

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
    * To build Chromium kernel
       * cd patches/kernel/lts2022-chromium
       * ./build_weekly.sh
       * Deb files will be generated in patches/kernel/lts2022-chromium/host_kernel
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

This build has been validated on Raptor Lake NUC in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3 and MP4 formats tested
Adb connect over WIFI          OK
Security                       OK
Boot                           OK        Boots on QEMU 7.2.3
Image Flash                    OK
Web browsing                   OK
Video playback                 OK        MP4 tested
USB                            OK        Keyboard , Mouse , Pen drive
Display                        OK
=============================  =======  ========


Reference configuration
-----------------------

 * Supported hardware

     * Product -  Raptor Lake [RPL] NUC 

 * Supported software

     * AOSP Version - android-14.0.0_r2
     * Host Kernel for GVT-d - 6.1.61
     * Guest kernel for GVT-d - 6.1.61


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
* Linked to Android 14 Google Public document --> https://source.android.com/docs/setup/about/android-14-release

CIV_00.23.04.45_A14
===================
* This is a Pre-Production Binary Release for evaluation and development purpose. This release supports 13th GEN Core [Celadon in VM].

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

 * Android 14 brings in the below major features:
    * Android Virtualization Framework (AVF) updates
    * Android System APIs for AVF
    * Large Screen Enhancements
    * Adopting Scribe in App/Toolkit
    * Concurrent Displays
    * Window manager extensions
    * Windowmanager Jetpack API to allow all applications access to functionality.
    * Full-screen intent limits
    * App Compatibility for large screens
    * Low Latency Graphics
    * Fuse-Bpf updates
    * Vendor APEX
    * Storage & updatability – EROFS and OTA performance addressed.
    * Binder and Android IDL (AIDL)
    * HAL interfaces are converted to AIDL (~99%) or deprecated (one exception)
    * Multigenerational LRU (MGLRU) is a rework related change
    * Audio: Dynamic soundbar mode
    * Multiple USB audio device routing updates
    * Sound dose
    * Preferred audio mixer attributes on USB devices
    * Camera extensions feature
    * Reference USB camera HAL
    * Ultra HDR
    * Wide gamut capture
    * Connectivity: ASHA advertisements for hearing aid devices
    * Qualified network service
    * Time and time zone detection updates
    * Ultra-wideband HSL interface
    * Wi-Fi vendor HAL
    * Virtualization Wi-Fi feature updates
    * Enterprise device policy resolution framework
    * Android Baseline Profile (ABP) and Vulkan implementation
    * Reduced graphics buffer memory consumption
    * Performance boost for games
    * Capture Content for Notes
    * COMPANION_DEVICE_GLASSES role
    * COMPANION_DEVICE_NEARBY_DEVICE_STREAMING role
    * Power Manager ACQUIRE_CAUSES_WAKEUP permissions.
    * Runtime: JDWP thread creation
    * Runtime: OpenJDK 17 updates
    * Filename encryption
    * Multiple IMEIs
    * Dynamic Code Loading (DCL),
    * Picker choice in media permission
    * Full release notes from Google can be found at: https://source.android.com/docs/setup/about/android-14-release

 * Celadon features:
    * AIDL framework updates for HALs.
    * API level upgraded to 34
    * FCM Target level upgraded to 8
    * Camera provider HAL moved to AIDL V2.0
    * Graphics composer HAL moved to composer3 AIDL V2.0
    * Thermal HAL moved to AIDL V1.0
    * Graphics allocator HAL moved to AIDL V2.0
    * Boot HAL moved to AIDL V1.0
    * WiFi HAL moved to AIDL V1.0
    * Identity HAL moved to AIDL V5.0
    * security keymint HAL moved to AIDL V3.0
    * gatekeeper hal moved to AIDL V1.0
    * Sensor HAL moved to AIDL V1.0
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.


Known issues
------------
* Intermittent screen flicker issue on few monitors. Issue seen only in GVT-d mode. Bare Metal mode or when screen accessed via vysor or scrcpy issue is not seen. Also issue not seen after reboot. 


Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.23.04.45_A14.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.23.04.45_A14

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
    * To build Chromium kernel
       * cd patches/kernel/lts2022-chromium
       * ./build_weekly.sh
       * Deb files will be generated in patches/kernel/lts2022-chromium/host_kernel
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

This build has been validated on Raptor Lake NUC in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3 and MP4 formats tested
Adb connect over WIFI          OK
Security                       OK
Boot                           OK        Boots on QEMU 7.2.3
Image Flash                    OK
Web browsing                   OK
Video playback                 OK        MP4 tested
USB                            OK        Keyboard , Mouse , Pen drive
Display                        OK
=============================  =======  ========


Reference configuration
-----------------------

 * Supported hardware

     * Product -  Raptor Lake [RPL] NUC 

 * Supported software

     * AOSP Version - android-14.0.0_r2
     * Host Kernel for GVT-d - 6.1.34
     * Guest kernel for GVT-d - 6.1.34


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
* Linked to Android 14 Google Public document --> https://source.android.com/docs/setup/about/android-14-release


CIV_00.23.04.40_A14
===================
* This is a Pre-Production Manifest Release for evaluation and development purpose. This release supports 13th GEN Core [Celadon in VM].

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

 * Android 14 brings in the below major features:
    * Android Virtualization Framework (AVF) updates
    * Android System APIs for AVF
    * Large Screen Enhancements
    * Adopting Scribe in App/Toolkit
    * Concurrent Displays
    * Window manager extensions
    * Windowmanager Jetpack API to allow all applications access to functionality.
    * Full-screen intent limits
    * App Compatibility for large screens
    * Low Latency Graphics
    * Fuse-Bpf updates
    * Vendor APEX
    * Storage & updatability – EROFS and OTA performance addressed.
    * Binder and Android IDL (AIDL)
    * HAL interfaces are converted to AIDL (~99%) or deprecated (one exception)
    * Multigenerational LRU (MGLRU) is a rework related change
    * Audio: Dynamic soundbar mode
    * Multiple USB audio device routing updates
    * Sound dose
    * Preferred audio mixer attributes on USB devices
    * Camera extensions feature
    * Reference USB camera HAL
    * Ultra HDR
    * Wide gamut capture
    * Connectivity: ASHA advertisements for hearing aid devices
    * Qualified network service
    * Time and time zone detection updates
    * Ultra-wideband HSL interface
    * Wi-Fi vendor HAL
    * Virtualization Wi-Fi feature updates
    * Enterprise device policy resolution framework
    * Android Baseline Profile (ABP) and Vulkan implementation
    * Reduced graphics buffer memory consumption
    * Performance boost for games
    * Capture Content for Notes
    * COMPANION_DEVICE_GLASSES role
    * COMPANION_DEVICE_NEARBY_DEVICE_STREAMING role
    * Power Manager ACQUIRE_CAUSES_WAKEUP permissions.
    * Runtime: JDWP thread creation
    * Runtime: OpenJDK 17 updates
    * Filename encryption
    * Multiple IMEIs
    * Dynamic Code Loading (DCL),
    * Picker choice in media permission
    * Full release notes from Google can be found at: https://source.android.com/docs/setup/about/android-14-release

 * Celadon features:
    * AIDL framework updates for HALs.
    * API level upgraded to 34
    * FCM Target level upgraded to 8
    * Camera provider HAL moved to AIDL V2.0
    * Graphics composer HAL moved to composer3 AIDL V2.0
    * Thermal HAL moved to AIDL V1.0
    * Graphics allocator HAL moved to AIDL V2.0
    * Boot HAL moved to AIDL V1.0
    * WiFi HAL moved to AIDL V1.0
    * Identity HAL moved to AIDL V5.0
    * security keymint HAL moved to AIDL V3.0
    * gatekeeper hal moved to AIDL V1.0
    * Sensor HAL moved to AIDL V1.0
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.


Known issues
------------
* Intermittent screen flicker issue
* Sometimes Multi-camera not showing 2nd camera  


Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.23.04.40_A14.xml

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

    * git clone https://github.com/projectceladon/vendor-intel-utils/tree/master/host/kernel/lts2022-chromium 
    * Go to build.sh of lts2022-chromium
    * Replace below lines in build.sh script i.e Line no 6 to line no 10
       * git clone https://github.com/projectceladon/vendor-intel-utils.git
       * cd vendor-intel-utils
       * git checkout 0babae8b1d9ad42dde9580f3ef91b640ccd86b1c
       * cd ../
       * branch_name="main"
       * git clone -b $branch_name https://github.com/projectceladon/linux-intel-lts2022-chromium.git
       * cd linux-intel-lts2022-chromium
       * git checkout ae3fc1db4d1ebf32cbe8ebda9e47653a9a149b71
    * ./build.sh
    * deb files will be generated inside host_kernel folder 
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

This build has been validated on Raptor Lake NUC in the following function domains:

=============================  =======  ========
Component                      Results  Comments
=============================  =======  ========
Wi-Fi                          OK        Host wifi is switched to Android UI in QEMU using usb pass through
BT                             OK        Bluetooth is working
Audio Playback                 OK        MP3 and MP4 formats tested
Adb connect over WIFI          OK
Security                       OK
Boot                           OK        Boots on QEMU 7.2.3
Image Flash                    OK
Web browsing                   OK
Video playback                 OK        MP4 tested
USB                            OK        Keyboard , Mouse , Pen drive
Display                        OK
=============================  =======  ========


Reference configuration
-----------------------

 * Supported hardware

     * Product -  Raptor Lake [RPL] NUC 

 * Supported software

     * AOSP Version - android-14.0.0_r2
     * Host Kernel for GVT-d - 6.1.34
     * Guest kernel for GVT-d - 6.1.34


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
* Linked to Android 14 Google Public document --> https://source.android.com/docs/setup/about/android-14-release

