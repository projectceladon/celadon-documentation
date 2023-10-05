.. _release-notes:

Release Notes
#############

.. note::

    Refer to :ref:`release-naming-convention` to decode the release tags of
    the following |C| releases.

.. contents::
   :local:
   :depth: 1

Stable Releases
***************

This is a Production Release for evaluation and development purposes
addressing Retail, Education, Workload consolidation and Marine segments.

.. contents::
   :local:
   :depth: 1

CIV_02.22.04.50_A12
===================

Intended audience
-----------------

* Celadon Open Source Community who has subscribed to celadon@lists.linuxfoundation.org

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using :
  https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------

Feature Details
~~~~~~~~~~~~~~~

Celadon upstreamed fixes in this release:

* First stable release from Celadon_IoT for Android 12
* This release supports Alder Lake-S (ADL-S)
* IoT configuration supports SRIOV mode with 99.97% conformance on
  Alder Lake (ADL)
  platform with production ready
* Vm-Manager support to launch Android


Release Constraint list
-----------------------

* VP9 hardware codec is not enabled in the current release due to hardware constraint
* Sensor support is not enabled in current release due to hardware constraint.
* The current QEMU release doesn’t support RGBA8888 color format which impact RGBA8888 usage on Android guest os application
* USB accessory mode is not supported in the current release.
* MAC randomization feature is not supported in the current release.
* Partner modules aren’t integrated within the current GMS package.
* NN API is not supported in the current release.
* Hardware doesn’t have inbuilt cameras, only usb external camera is supported.

Known issues
------------
* Ethernet tethering option in Settings menu is active even when no USB Ethernet Adaptor connected
* System touch can’t accurately point the location
* With UserData CheckPoint feature enabled, device reboots after 1st time boot while flashing is done
* Windows freeform feature has been partially backported from Android T

Open Issue List
---------------
* :sup:`#`\16019209010	VtsHalMediaC2V1_0TargetVideoDecTest module
* 16017487117	x86_64 CtsMediaTestCases failures
* 16017342135	STS CtsSecurityTestCases failing
* 16018517871	CtsMediaV2TestCases failures related to HEVC profilelevel
* 16017974748	Failures are observed with x86_64 CtsDeqpTestCases module

Where to find the release
-------------------------

* Manifest Link: https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_02.22.04.50_A12.xml
* :sup:`#`\PRs fixing this issue in repo : https://github.com/projectceladon/vendor-intel-utils-vertical-iot/pulls?q=is%3Apr+is%3Amerged
  [PR#9, PR#10, PR#11, PR#16, PR#17, PR#19]
* Below validation results are with release manifest + cherrypicked PR's

Host Kernel Release configuration
---------------------------------

* linux-intel-lts kernel
        * Branch: https://github.com/intel/linux-intel-lts
        * SHA ID: https://github.com/intel/linux-intel-lts/releases/tag/lts-v5.15.71-adl-linux-221121T044440Z
* kernel-config
        * Config-File: https://github.com/projectceladon/vendor-intel-utils-vertical-iot/blob/main/x86_64_defconfig

Reference configuration
-----------------------

* Supported hardware
    =======================   =======
    Platform                  Product
    -----------------------   -------
    Alder Lake(ADL)           | ADL RVP DDR5 C1 CPU 12th Gen Intel(R) Core(TM) i9-12900E
    Network Interface Card    | Intel® Wireless-AC 9260 5th Generation Intel802.11ac, Dual Band, 2x2Wi-Fi + Bluetooth®5.1
    =======================   =======

* Supported software
        * Android CIV Guest:
                =======================   =======
                Platform                  Product
                -----------------------   -------
                Android                   | Android 12
                Kernel                    | 5.10.145 (lts-v5.10.145-civ-android-221027T031053Z)
                AOSP                      | android-12.0.0_r28
                =======================   =======

        * Ubuntu Host:
                =======================   =======
                Platform                  Product
                -----------------------   -------
                Qemu                      | version 7.1.0
                Ubuntu                    | 22.04 LTS (Jammy Jellyfish)
                Kernel_IoTG               | 5.15.71 (lts-v5.15.71-adl-linux-221121T044440Z)
		=======================   =======

Validation results
------------------

Stable Releases (IoT) are validated with SR-IOV mode on an Alder Lake (ADL)
platform in the following function domains. Validation cycles are performed on
a GMS user-signed, widevine-enabled image, as required by google certification
requirements.

Below validation results are with Alder Lake-S (ADL-S) RVP platform.

.. figure:: stable-release_iot/images/Q422-2-A12_Validation_Result.png
    :width: 500px

.. note::

   \*CTS on GSI failures are a subset of CTS failures, so the overall failures
   count is 39.


CIV_03.22.03.37_A11
===================

Intended audience
-----------------

* Celadon Open Source Community who has subscribed to celadon@lists.linuxfoundation.org

Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------
Feature Details
---------------
* Celadon Upstreamed fixes in this release

                * AOSP Version upgraded to r_46
		* Chromium Guest Kernel upgraded to 5.4.150
		* Security Patch & ASB updated to “September'22”

Known issues
------------
-Nil- [ All known issues from previoues Release are fixed in this release ]

Where to find the release
-------------------------

* Manifest Link: https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_03.22.03.37_A11.xml

Host Kernel Release configuration
---------------------------------

* linux-intel-lts kernel
        * Branch: https://github.com/intel/linux-intel-lts/tree/5.4/yocto
        * SHA ID: https://github.com/intel/linux-intel-lts/releases/tag/lts-v5.4.209-yocto-220817T175100Z
* kernel-config
        * Config-File: https://github.com/projectceladon/vendor-intel-utils-vertical-iot/blob/android/r/x86_64_defconfig


Reference configuration
-----------------------

* Supported hardware
    =======================   =======
    Platform                  Product
    -----------------------   -------
    Comet Lake(CML)           | NUC10FNH Intel(R) Core(TM) i7-10710U CPU
    Elkhart Lake(EHL)         | EHL A0/EHL Bx CRB
    Tiger Lake(TGL)           | TGL Bx RVP
    =======================   =======

* Supported software
        * Android CIV Guest:
                =======================   =======
                Platform                  Product
                -----------------------   -------
                Android                   | Android 11
                Kernel                    | 5.4.150 (linux-intel-lts2019-chromium)
                AOSP                      | android-11.0.0_r46
                =======================   =======

        * Ubuntu Host:
                =======================   =======
                Platform                  Product
                -----------------------   -------
                Qemu                      | version 4.2.0
                Ubuntu                    | 20.04 LTS (Focal Fossa)
                Kernel_IoTG               | 5.4.209 (linux-intel-lts 5.4/yocto branch)
                =======================   =======

Validation results
------------------

Stable Releases (IoT) are validated with GVT-d mode on Comet Lake(CML), Tiger Lake(TGL), and Elkhart Lake(EHL) Intel® platforms in the following function domains. Validation cycles are performed on GMS user signed widevine enabled image as required by google certification requirements

.. figure:: stable-release_iot/images/sep22_Validation_Result2.png
    :align: right
    :width: 750px

CIV_02.22.01.12_A11
===================

Intended audience
-----------------

* Open Source Community who has subscribed to celadon@lists.linuxfoundation.org


Customer support
----------------

* subscribe/unsubscribe celadon mailing list using : https://lists.linuxfoundation.org/mailman/listinfo/celadon

Introduction
------------
Feature Details
---------------
* Features supported in this release

                * RTC (Real Time Clock) - Android Time keeping
                * Alarm Virtualization
                * Support wipe Google Factory Reset protection credentials on reset
                * Support secure data erase on dedicated partition
                * Use mesa i965 driver on CML and EHL

        * Celadon Upstreamed fixes

                * CiV suspend/resume stability
                * Update health values for CiV battery
                * Enable zram swap for device having <= 4G RAM
                * Enabled GuC/HuC firmware
                * Support EHL platform
                * Support Sensor enable/disable build configuration

Known issues
------------

* 1974128 '<https://android-review.googlesource.com/c/platform/test/suite_harness/+/1974128>`_  Temporarily skip platformPermissionPolicyIsUnaltered
* 1800607 '<https://android-review.googlesource.com/c/platform/test/vts-testcase/kernel/+/1800607>`_  sysfs.KernelApiSysfsTest#testAndroidUSB: enforce only if file present
* Buganizer-193114625 '<https://partnerissuetracker.corp.google.com/issues/193114625>`_ atest CtsAppTestCases/CtsAppTestCases[instant]
* 1989169 '<https://android-review.googlesource.com/c/platform/hardware/interfaces/+/1989169>`_  Fix for VTS test CleanupConnectionsOnInitialize/0_default

Where to find the release
-------------------------

* Manifest Link: https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_02.22.01.12_A11.xml

Host Kernel Release configuration
---------------------------------

* linux-intel-lts kernel
        * Branch: https://github.com/intel/linux-intel-lts/tree/5.4/yocto
        * SHA ID: https://github.com/intel/linux-intel-lts/releases/tag/lts-v5.4.170-yocto-220124T222417Z
* kernel-config
        * Config-File: https://github.com/projectceladon/vendor-intel-utils-vertical-iot/blob/main/x86_64_defconfig


Reference configuration
-----------------------

* Supported hardware
    =======================   =======
    Platform                  Product
    -----------------------   -------
    Comet Lake(CML)           | NUC10FNH Intel(R) Core(TM) i7-10710U CPU
    Elkhart Lake(EHL)         | EHL A0/EHL Bx CRB
    Tiger Lake(TGL)           | TGL Bx RVP
    =======================   =======

* Supported software
        * Android CIV Guest:
                =======================   =======
                Platform                  Product
                -----------------------   -------
                Android                   | Android 11
                Kernel                    | 5.4.142 (linux-intel-lts2019-chromium)
                AOSP                      | android-11.0.0_r39
                =======================   =======

        * Ubuntu Host:
                =======================   =======
                Platform                  Product
                -----------------------   -------
                Qemu                      | version 4.2.0
                Ubuntu                    | 20.04 LTS (Focal Fossa)
                Kernel_IoTG               | 5.4.170 (linux-intel-lts 5.4/yocto branch)
                =======================   =======

Validation results
------------------

Stable Releases (IoT) build running in GVT-d mode has been validated on Comet
Lake(CML), Tiger Lake(TGL), and Elkhart Lake(EHL) Intel® platforms in the
following function domains. Validation cycles are performed on GMS user-signed
widevine enabled imag
e as required by Google certification requirements.

.. figure:: stable-release_iot/images/Validation_Result2.png
    :align: center
    :width: 750px

.. note:: CTS on GSI Failures are due to Google dependency and shall be resolved in Upcoming new GSI patch.



Base Releases
*************

.. contents::
   :local:
   :depth: 1

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

This build has been validated on Alder Lake NUC in the following function domains:

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

CIV_01.22.03.32_A12
===================
* This is a Production Binary Release for evaluation and development purposes. This release enables support for 12th GEN Core and it has
  been tested on Alder Lake RVP [Celadon in VM].

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

 * New features
    * Camera sharing
    * Widevine API version 16 Support
    * Simultaneous Displays Support
    * Data sharing between Host and Guest
    * Remove root permission for android in container or virtual machine
    * Memory Balloon
    * Power S3 Suspend/Resume of the CiV Guest OS - standalone
    * Support Virtual A/B OTA on Celadon
    * Sound open firmware HDA passthrough solution for Android in VM

 * Existing Features
    * Android 12 with latest AOSP release tag (android-12.0.0_r28)
    * Enabled Virgl
    * Enabled SRIOV (Single Root I/O Virtualization)
    * Switch between h/w accelerated graphics and s/w graphics
    * Enabled Virtio-gpu
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
    * Celadon supports Android 12 with API level 31 and FCM target level 6
    * Boot control HAL upgraded to V1.2
    * Audio HAL upgraded to V7.0
    * Browse Internet (IPv6)
    * WiFi Direct
    * WiFi Control from Android in Virtual Machine
    * Basic sanity test passed for all components *
    * Bug fixes, customizations and optimizations for x86
    * SE Policy updated for API level 31
    * AIDL libs updated
    * Health HAL is optimized to adapt the new changes for S Dessert
    * Graphics introduced scheduling plans,
    * Graphics: Surface flinger caching, GPU memory accounting, profiling and
      GPU scheduling
    * Accessibility, System UI and backup & restore features updated with minor
      modifications
    * FUSE passthrough introduced to improve IO performance
    * IncFS updated with Better Monitoring Support, virtio-9p support, fs-verity
      support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Incremental: new Android 12+ feature that could reduce initial downloads
      of app
    * Approximate location access and privacy related updates
    * New Storage Features like Storage management API changes, New directory
      for voice recordings, Media management access, App storage access and
      Extended file access support.
    * Memory accounting updates
    * Framework introduced changes in foreground service, Gamepad – Input device
      features, Haptic related vibrator changes
    * Media side, Audio supports BLE audio, Haptics generator, Multi-channel audio
      along with audio HAL v7.0
    * Media transcoding, media extractor related changes and improved quality in
      encoded video
    * AVIF image support, Easier blurs, color filters, and other effects
    * CameraX vendor extension support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Improvements to bandwidth estimation APIs in connectivity and introduced principle of 5G slicing
    * Wi-Fi privacy improvements with - Non-Persistent MAC Address Randomization
    * Bluetooth side, BT classic and BLE introduced
    * Activity Detection, CHRE, Bluesky, FLP & RTT related changes
    * Major changes in window management and introduced Display grouping and emphasis for multi-display context
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.
    * Rich Haptic experience – Actuator effects, audio-coupled haptic, Enriched image supported notifications, rounded corner APIs etc.
    * Picture in Picture (PiP) improvements, Immersive mode improvements for gesture navigation, Rich content insertion and Recents URL sharing
    * Provide apps direct access to tombstone traces
    * Android 12 release from Google shall be referred from the below links
         * Release Notes: https://source.android.com/setup/start/android-12-release
         * Blog : https://android-developers.googleblog.com/2021/10/android-12-is-live-in-aosp.html


Known issues
------------
* Device going to offline while running cts tests (Recoverable through sudo kill -9 process-id)
* Cfi flaw seen in subsequent compute workload
* CLANG and HTML5 multicore scaling w.r.t. LiV when cores are > 6-8
* HDMI audio is lost after adb reboot

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_01.22.03.32_A12.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_01.22.03.32_A12


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

     * Product - Alder Lake RVP

 * Supported software

     * AOSP Version - android-12.0.0_r28
     * Host Kernel - -5.10.118-cvhb
     * Guest kernel - -5.10.118-cvhb


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

CIV_00.22.02.21_A12
===================
* This is a Pre Production Binary Release for evaluation and development
  purposes . This release enables support for 12th GEN Core and it has
  been tested on Alder Lake RVP [Celadon in VM].

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
    * Android 12 with latest AOSP release tag (android-12.0.0_r28)
    * Enabled Virgl
    * Enabled SRIOV (Single Root I/O Virtualization)
    * Switch between h/w accelerated graphics and s/w graphics
    * Enabled Virtio-gpu
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

 * Includes Android 12 main features:
    * Integrated VM Manager to configure CIV replacing start_civ.sh
        * This changes launch steps for CIV - please refer to
          https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager
    * Celadon supports Android 12 with API level 31 and FCM target level 6
    * Boot control HAL upgraded to V1.2
    * Audio HAL upgraded to V7.0
    * Browse Internet (IPv6)
    * WiFi Direct
    * WiFi Control from Android in Virtual Machine
    * Basic sanity test passed for all components *
    * Bug fixes, customizations and optimizations for x86
    * SE Policy updated for API level 31
    * AIDL libs updated
    * Health HAL is optimized to adapt the new changes for S Dessert
    * Graphics introduced scheduling plans,
    * Graphics: Surface flinger caching, GPU memory accounting, profiling and
      GPU scheduling
    * Accessibility, System UI and backup & restore features updated with minor
      modifications
    * FUSE passthrough introduced to improve IO performance
    * IncFS updated with Better Monitoring Support, virtio-9p support, fs-verity
      support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Incremental: new Android 12+ feature that could reduce initial downloads
      of app
    * Approximate location access and privacy related updates
    * New Storage Features like Storage management API changes, New directory
      for voice recordings, Media management access, App storage access and
      Extended file access support.
    * Memory accounting updates
    * Framework introduced changes in foreground service, Gamepad – Input device
      features, Haptic related vibrator changes
    * Media side, Audio supports BLE audio, Haptics generator, Multi-channel audio
      along with audio HAL v7.0
    * Media transcoding, media extractor related changes and improved quality in
      encoded video
    * AVIF image support, Easier blurs, color filters, and other effects
    * CameraX vendor extension support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Improvements to bandwidth estimation APIs in connectivity and introduced principle of 5G slicing
    * Wi-Fi privacy improvements with - Non-Persistent MAC Address Randomization
    * Bluetooth side, BT classic and BLE introduced
    * Activity Detection, CHRE, Bluesky, FLP & RTT related changes
    * Major changes in window management and introduced Display grouping and emphasis for multi-display context
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.
    * Rich Haptic experience – Actuator effects, audio-coupled haptic, Enriched image supported notifications, rounded corner APIs etc.
    * Picture in Picture (PiP) improvements, Immersive mode improvements for gesture navigation, Rich content insertion and Recents URL sharing
    * Provide apps direct access to tombstone traces
    * Android 12 release from Google shall be referred from the below links
         * Release Notes: https://source.android.com/setup/start/android-12-release
         * Blog : https://android-developers.googleblog.com/2021/10/android-12-is-live-in-aosp.html


Known issues
------------
* Unable to set and change the lock screen sometimes after couple of minutes
  of usage
* Volume control doesn't work with 3.5mm Headset button
* Unable to seek properly on recorded video
* HDMI audio is lost after adb reboot
* Limitation on Alderlake RVP--> Suspend-resume functionality is not applicable
  on ADL RVP

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.22.02.21_A12.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.22.02.21_A12


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

     * AOSP Version - android-12.0.0_r28
     * NUC11PAQI7 Host Kernel - -5.10.110-cvhb
     * NUC11PAQI7 Guest kernel - -5.10.110-cvhb


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

CIV_00.22.01.04_A12
===================
* This is a Pre Production Binary Release for evaluation and development
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
    * Android 12 with latest AOSP release tag (android-12.0.0_r26)
    * Integrated VM Manager to configure CIV replacing start_civ.sh
        * This changes launch steps for CIV - please refer https://docs.01.org/celadon/getting-started/on-vm.html#use-vm-manager

 * Includes Android 12 main features:
    * Celadon supports Android 12 with API level 31 and FCM target level 6
    * Boot control HAL upgraded to V1.2
    * Audio HAL upgraded to V7.0
    * Basic sanity test passed for all components *
    * Bug fixes, customizations and optimizations for x86
    * SE Policy updated for API level 31
    * AIDL libs updated
    * Health HAL is optimized to adapt the new changes for S Dessert
    * Graphics introduced scheduling plans,
    * Graphics: Surface flinger caching, GPU memory accounting, profiling and GPU scheduling
    * Accessibility, System UI and backup & restore features updated with minor modifications
    * FUSE passthrough introduced to improve IO performance
    * IncFS updated with Better Monitoring Support, virtio-9p support, fs-verity support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Incremental: new Android 12+ feature that could reduce initial downloads of app
    * Approximate location access and privacy related updates
    * New Storage Features like Storage management API changes, New directory for voice recordings, Media management access, App storage access and Extended file access support.
    * Memory accounting updates
    * Framework introduced changes in foreground service, Gamepad – Input device features, Haptic related vibrator changes
    * Media side, Audio supports BLE audio, Haptics generator, Multi-channel audio along with audio HAL v7.0
    * Media transcoding, media extractor related changes and improved quality in encoded video
    * AVIF image support, Easier blurs, color filters, and other effects
    * CameraX vendor extension support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Improvements to bandwidth estimation APIs in connectivity and introduced principle of 5G slicing
    * Wi-Fi privacy improvements with - Non-Persistent MAC Address Randomization
    * Bluetooth side, BLE audio introduced, NFC API/UX improved for payment enhancement.
    * Activity Detection, CHRE, Bluesky, FLP & RTT related changes
    * Major changes in window management and introduced Display grouping and emphasis for multi-display context
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.
    * Rich Haptic experience – Actuator effects, audio-coupled haptic, Enriched image supported notifications, rounded corner APIs etc.
    * Picture in Picture (PiP) improvements, Immersive mode improvements for gesture navigation, Rich content insertion and Recents URL sharing
    * Provide apps direct access to tombstone traces
    * Android 12 release from Google shall be referred from the below links
         * Release Notes: https://source.android.com/setup/start/android-12-release
         * Blog : https://android-developers.googleblog.com/2021/10/android-12-is-live-in-aosp.html


Known issues
------------
* There are WIP features in all components for full feature completions, This release tests only basic sanity of components.

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.22.01.04_A12.xml
* Binary Link : https://github.com/projectceladon/celadon-binary/tree/master/CIV_00.22.01.04_A12


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

This build has been validated on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_  in the following function domains:

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

     * AOSP Version - android-12.0.0_r26
     * NUC11PAQI7 Host Kernel - -5.10.82-cvhb
     * NUC11PAQI7 Guest kernel - -5.10.91-cvhb


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


CIV_00.21.03.41_A12
===================

* We are glad to announce that the Celadon Project now supports Android 12 within 2 days of Google PV. We wish the Celadon community to start working with Android 12 and provide us feedback on what more you would like to see in the Celadon project.

* This is a Pre Production Manifest Release for evaluation and development
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
    * Android 12 with latest AOSP manifest (android-12.0.0_r2)
    * Celadon supports Android 12 with API level 31 and FCM target level 6
    * Boot control HAL upgraded to V1.2
    * Audio HAL upgraded to V7.0
    * Basic sanity test passed for all components *
    * Bug fixes, customizations and optimizations for x86
    * SE Policy updated for API level 31
    * AIDL libs updated
    * Health HAL is optimized to adapt the new changes for S Dessert
 * Includes Android 12 main features:
    * Graphics introduced scheduling plans,
    * Graphics: Surface flinger caching, GPU memory accounting, profiling and GPU scheduling
    * Accessibility, System UI and backup & restore features updated with minor modifications
    * FUSE passthrough introduced to improve IO performance
    * IncFS updated with Better Monitoring Support, virtio-9p support, fs-verity support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Incremental: new Android 12+ feature that could reduce initial downloads of app
    * Approximate location access and privacy related updates
    * New Storage Features like Storage management API changes, New directory for voice recordings, Media management access, App storage access and Extended file access support.
    * Memory accounting updates
    * Framework introduced changes in foreground service, Gamepad – Input device features, Haptic related vibrator changes
    * Media side, Audio supports BLE audio, Haptics generator, Multi-channel audio along with audio HAL v7.0
    * Media transcoding, media extractor related changes and improved quality in encoded video
    * AVIF image support, Easier blurs, color filters, and other effects
    * CameraX vendor extension support
    * Enabled NNAPI updatability in Machine Learning
    * New platform features for Mainline Module
    * Improvements to bandwidth estimation APIs in connectivity and introduced principle of 5G slicing
    * Wi-Fi privacy improvements with - Non-Persistent MAC Address Randomization
    * Bluetooth side, BLE audio introduced, NFC API/UX improved for payment enhancement.
    * Activity Detection, CHRE, Bluesky, FLP & RTT related changes
    * Major changes in window management and introduced Display grouping and emphasis for multi-display context
    * pKVM (Protected KVM) code compatibility available, Celadon won’t support it.
    * Rich Haptic experience – Actuator effects, audio-coupled haptic, Enriched image supported notifications, rounded corner APIs etc.
    * Picture in Picture (PiP) improvements, Immersive mode improvements for gesture navigation, Rich content insertion and Recents URL sharing
    * Provide apps direct access to tombstone traces
    * Android 12 release from Google shall be referred from the below links
         * Release Notes: https://source.android.com/setup/start/android-12-release
         * Blog : https://android-developers.googleblog.com/2021/10/android-12-is-live-in-aosp.html


Known issues
------------
* There are WIP features in all components for full feature completions, This release tests only basic sanity of components.

Where to find the release
-------------------------

* Manifest Link : https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_00.21.03.41_A12.xml

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

   * After Building Binary please follow below steps
   * Untar <flash-files>
   * sudo -E ./scripts/setup_host -u headless
   * sudo -E ./scripts/start_flash_usb.sh caas-flashfiles-eng.<user>.zip --display-off
   * sudo -E ./scripts/start_civ.sh -g GVT-d

Validation results
------------------

This build has been validated on |NUC| Kit `NUC11PAQI7  <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc11paqi7.html>`_  in the following function domains:

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

     * AOSP Version - android-12.0.0_r2
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
      script like this: sudo E ./scripts/start_civ.sh -g GVT-d --passthrough-pci-usb
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
      script like this: sudo E ./scripts/start_civ.sh -g GVT-d --passthrough-pci-usb
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
    * To passthrough USB host controller in NUC11PAQI7, run the CIV launch script like this: sudo E ./scripts/start_civ.sh -g GVT-d --passthrough-pci-usb
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
  script like this: sudo E ./scripts/start_civ.sh -g GVT-d --passthrough-pci-usb
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










Deprecated Releases
*******************

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
