.. _base-releases-A15:

Android 15 Base Releases
########################

.. contents::
   :local:
   :depth: 1

CIV_00.24.03.36_A15
=================
* This is a Manifest Release for evaluation and development purpose. This release supports 14th GEN Core [BareMetal].

Intended audience
-----------------

* Open Source Community who has subscribed to celadon@lists.linuxfoundation.org
* Any user who wants to explore Celadon in BareMetal

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------

New in this release
-------------------

 * Android 15 brings in the below major features:
    * Enhanced large screen support 
    * Multi-device experience 
    * 100 % AIDL HAL compatability 
    * API Level 35 & Target Level 202404
    * Head tracking over LE Audio
    * Android Automotive Power Policy
    * Android camera feature update  
    * Camera Low Light boost 
    * APFV6 
    * Support for 802.11 AZ in wifi RTT
    * Enhancements to Android Virtualization Framework (AVF)
    * Multi-user & Multi-display 
    * Input method Framework enhancements 
    * Scudo Performance improvements 
    * AutoFDO feature 
    * Audio HAL to AIDL
    * Bit-perfect audio 
    * Sterio spatialization
    * AV1 updates
    * Android codec database [ACD]
    * Vulkan as GPU HAL 
    * Virtual A/B Version 3
    * Deprecation of VNDK 
    * Deprecation of vendor overlay 
    * set adjust compiler filter callback
    * Full release notes from Google can be found at: https://source.android.com/docs/whatsnew/android-15-release

 * Celadon features:
    * AIDL framework updates for HALs
    * API level upgraded to 35
    * FCM Target level upgraded to 202404
    * All Celadon HALs upgraded to AIDL versions
    * Audio HAL AIDL 2.0
    * Camera provider HAL moved to AIDL V1.0
    * Graphics composer HAL moved to composer3 AIDL V2.0
    * Thermal HAL moved to AIDL V2.0
    * Graphics allocator HAL moved to AIDL V2.0
    * Boot HAL moved to AIDL V1.0
    * WiFi HAL moved to AIDL V2.0
    * Identity HAL moved to AIDL V5.0
    * security keymint HAL moved to AIDL V3.0
    * Sensor HAL moved to AIDL V2.0
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it


Known issues
------------
   * WIFI : When we try to connect to a network, the connection is going to save state .
     This issue can be resolved if we connect to a network after entering password , navigate to Advance menu option , select “Static” instead of “dynamic” and re-      enter the pre populated information
   * Video playback have glitches in them. The video skips few seconds or goes very fast for few sec and the same keeps repeating.

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.24.03.36_A15.xml


How to install this release
---------------------------

* Steps to sync to this release

   * repo init -u https://github.com/projectceladon/manifest -b master -m stable-build/CIV_XX.XX.XX.XX_AXX.xml
   * NOTE : Manifest tag will change according to the latest release
   * repo sync -c -q -j${nproc}

* Android build commands

   * For Compilation please use Ubuntu 22.04
   * source build/envsetup.sh
   * lunch caas-ap3a-userdebug
   * make flashfiles -jN

* Steps To build the host kernel for this manifest

    * Download  caas-releasefiles-userdebug.tar.gz and put it under ~/civ
    * cd ~/civ && tar zxvf caas-releasefiles-userdebug.tar.gz
    * To build Chromium kernel
       * cd patches/kernel/lts2023-chromium
       * ./build_weekly.sh
       * Deb files will be generated in patches/kernel/lts2023-chromium/host_kernel
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

This build has been validated on MTL NUC in the following function domains:

=============================  =======
Component                      Results
=============================  =======
Wi-Fi                          OK     
BT                             OK     
Audio Playback                 OK  
ADB                            OK
Boot                           OK     
Image Flash                    OK
Web browsing                   OK
Video playback                 OK     
USB                            OK  
Display                        OK
=============================  =======  ========


Reference configuration
-----------------------

 * Supported hardware

     * Product -  MTL NUC 

 * Supported software

     * AOSP Version - android-15.0.0_r1
     * Kernel Version - 6.6.41

Acronyms and terms
------------------

* BM  - Bare Metal
* CIV - Celadon In Virtual Machine 


Helpful hints / related documents
---------------------------------

* If you plan to use Celadon in product, please replace all the test keys
  under device/intel/build/testkeys/ with your product key.  
* The release of this project will be signed by test keys, it's only a
  reference for our customer and we are not responsible for this. Customers
  should use their own keys to sign their release images
* Build Celadon in VM  https://projectceladon.github.io/celadon-documentation/getting-started/on-vm.html#build-c-images-running-in-vm
* Flash Steps : https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager
* Linked to Android 15 Google Public document --> https://source.android.com/docs/whatsnew/android-15-release
