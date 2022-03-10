.. _widevine-integration:

Widevine\* L3 Integration Guide
###############################

Introduction
************

This section explains the process to integrate the Widevine v15
libraries into Celadon. It contains the following:

* Library and APKs integration

* Services integration

* Verification methods

* Troubleshooting

The target audience includes system integrators and testers for the Widevine
function and GTS/VTS.

Terminology
===========

+---------------+----------------------------------------------------------------+
| **Acronym**   | **Description**                                                |
+---------------+----------------------------------------------------------------+
| Widevine      | DRM solution which is used in Google\* Android\* by default.   |
+---------------+----------------------------------------------------------------+
| GTS           | GMS Test Suite.                                                |
+---------------+----------------------------------------------------------------+
| VTS           | Google Vendor Test Suite.                                      |
+---------------+----------------------------------------------------------------+
| CiV           | Celadon in VM                                                  |
+---------------+----------------------------------------------------------------+

Widevine libraries integration
******************************

Sources
=======

#. Check out the Celadon code base according to the Celadon release note on
   https://01.org/projectceladon/.

   The version we verified for Android 10 has the last commit of
   .repo/manifests/r1 as shown below (the newer version should be OK):

    commit 50bafa394758150137f1f89e499fbce812443d50

    Refs:
    {origin/cactus/celadon-r2/candidates/mergerequest},
    {origin/cactus/celadon-r1/can

    Author: rnaidu <ramya.v.naidu@intel.com>

    AuthorDate: Wed Apr 29 18:50:24 2020 +0530

    Commit: buildslave <ctbbot@intel.com>

    CommitDate: Tue May 5 07:25:05 2020 +0000

     Upgrading the aosp for civ

     Change-Id: Id41d20e11de0f349bddccb8b6b8c3a7a2a23a8b6

   The version we verified for Android 11 was
   manifest-android\_r\_staging-2020\_WW36\_A-r1-generated.xml.

#. Customers should get the widevine DRM package from Google. Normally, it
   contains:

    ├── Android.mk

    ├── CleanSpec.mk

    ├── libwvdrmengine

    │   ├── Android.mk

    │   ├── build\_and\_run\_all\_unit\_tests.sh

    │   ├── cdm

    │   ├── docs

    │   ├── include

    │   ├── include\_hidl

    │   ├── level3

    │   ├── mediacrypto

    │   ├── mediadrm

    │   ├── move\_widevine\_data.sh

    │   ├── oem\_certificate\_generator

    │   ├── oemcrypto

    │   ├── run\_all\_unit\_tests.sh

    │   ├── src

    │   ├── src\_hidl

    │   ├── test

    │   └── vts

    └── tests

    └── Android.mk

   The latest commit on our code base that was verified is shown below.
   Newer versions also should be acceptable.

     commit 387e21ac55064cc523102130bcaa4773de3959b6

     Refs: {origin/mirror/pdk/q-fs-release}

     Merge: 7a8e7dc 367befa

     Author:     android-build-team Robot
     <android-build-team-robot@google.com>

     AuthorDate: Sun Jun 2 23:08:40 2019 +0000

     Commit:     android-build-team Robot
     <android-build-team-robot@google.com>

     CommitDate: Sun Jun 2 23:08:40 2019 +0000


      Snap for 5627676 from 367befa3b7bffac8f9c569e269adafe7c906f343
      to qt-release*

      Change-Id: I43b1a334b936dbd81dfbaa99371fa835a7b9efdc*

   It is normally put under ``vendor/widevine/``.

#. Intel provides the following information in this document for
   customer integration.

   #. Mixins setting reference

   #. Sepolicy config reference

   #. Enablement flag for each project

Changes to be made in Celadon
=============================

* Mixins for the Widevine module should be created under project
  ``device/intel/mixins/``

    cd device/intel/mixins/groups/

    mkdir -p widevine/false

    mkdir -p widevine/L3\_Gen

    ln -s L3\_Gen default

    touch widevine/false/empty\_dir

    touch widevine/L3\_Gen/BoardConfig.mk

    touch widevine/L3\_Gen/product.mk

    touch groups/widevine/doc.spec

* Sepolicy for Widevine module, under project
  ``device/intel/sepolicy/``

    cd device/intel/sepolicy

    mkdir -p widevine/gen/gen\_common/

    touch widevine/gen/gen\_common/file.te

    touch widevine/gen/gen\_common/file\_contexts

    touch widevine/gen/gen\_common/hal\_drm\_widevine.te

* Enable widevine level 3 in project mixins, which is a one line change
  in the project related mixins file, such as
  ``device/intel/project-celadon/caas/mixins.spec``

Create mixins files and fill the content
----------------------------------------

Add the text below to widevine/doc.spec (this step is optional)::

    # device/intel/mixins/groups/widevine/doc.spec

    === Overview

    widevine is used to enable/disable the Android DRM widevine feature and
    set the relatedsecure level.

    --- deps

        - sepolicy

    ==== Options

    --- L1\_Gen

    this option enables widevine level 1 for Gen based devices.

    --- code dir

        - device/intel/mixins/groups/widevine

        - device/intel/sepolicy/widevine

        - vendor/widevine

        - vendor/intel/liboemcrypto/gen

   --- parameters

        - widevine\_arch: Graphics arch, gen9 for BXT, gen8 for CHT.

    --- L3\_Gen

    this option enables widevine level 3 for Gen based devices.

   --- code dir

       - device/intel/mixins/groups/widevine

       - device/intel/sepolicy/widevine

       - vendor/widevine

    --- default

    this option will only enable default drm, when not explicitly selected
    in mixins spec file, the default option will be used.

   --- code dir

       - device/intel/mixins/groups/widevine

       - device/intel/sepolicy/drm-default

       - hardware/interfaces/drm/1.0/default

Add the text below to
device/intel/mixins/groups/widevine/L3\_Gen/product.mk::

    # device/intel/mixins/groups/widevine/L3\_Gen/product.mk

    #enable Widevine drm

    PRODUCT\_PROPERTY\_OVERRIDES += drm.service.enabled=true

    PRODUCT\_PACKAGES += \\

      libwvdrmengine \\

      libwvhidl \\

        android.hardware.drm@1.2-service.widevine

    PRODUCT\_PACKAGES\_ENG += ExoPlayerDemo

    BOARD\_WIDEVINE\_OEMCRYPTO\_LEVEL := 3

Replace android.hardware.drm@1.2-service.widevine with
android.hardware.drm@1.3-service.widevine for Android 11

Add the text below to
device/intel/mixins/groups/widevine/L3\_Gen/BoardConfig.mk::

    # device/intel/mixins/groups/widevine/L3\_Gen/BoardConfig.

    BOARD\_SEPOLICY\_DIRS +=
    $(INTEL\_PATH\_SEPOLICY)/widevine/gen/gen\_common

For Android 11, make the following changes, if it’s not updated on your code
base::


    # device/intel/mixins/groups/default-drm/true/product.mk

    #only enable default drm service

    PRODUCT\_PACKAGES += android.hardware.drm@1.0-service \\

                         android.hardware.drm@1.0-impl \\

    -         android.hardware.drm@1.2-service.clearkey

    +         android.hardware.drm@1.3-service.clearkey

Update manifest.xml as follows::

    # device/intel/mixins/groups/device-specific/caas/manifest.xml

             </interface>

    -        <fqname>@1.1::ICryptoFactory/clearkey</fqname>

    -        <fqname>@1.1::IDrmFactory/clearkey</fqname>

    -        <fqname>@1.1::ICryptoFactory/widevine</fqname>

    -        <fqname>@1.1::IDrmFactory/widevine</fqname>

    +        <fqname>@1.3::ICryptoFactory/clearkey</fqname>

    +        <fqname>@1.3::IDrmFactory/clearkey</fqname>

        </hal>


Add sepolicy for Widevine
-------------------------

    cd device/intel/sepolicy/

    mkdir -p widevine/gen/gen\_common

    touch widevine/gen/gen\_common/file\_contexts

    touch widevine/gen/gen\_common/file.te

    touch widevine/gen/gen\_common/hal\_drm\_widevine.te

Add the text below to file\_contexts::


    # device/intel/sepolicy/ widevine/gen/gen\_common/file\_contexts

    /(vendor\|system/vendor)/bin/hw/android\\.hardware\\.drm@1\\.2-service.widevine
    u:object\_r:hal\_drm\_default\_exec:s0

    /data/vendor/mediadrm(/.\*)?
    u:object\_r:mediadrm\_vendor\_data\_file:s0

    \*Replace @1\\.2-service.widevine with @1\\.3-service.widevine for
    Android 11

Add the text below to file.te::


    # device/intel/sepolicy/ widevine/gen/gen\_common/file.te

    #data/vendor/mediadrm

    type mediadrm\_vendor\_data\_file, file\_type, data\_file\_type;

Add the text below to hal\_drm\_widevine.te::


    # device/intel/sepolicy/ widevine/gen/gen\_common/hal\_drm\_widevine.te

    vndbinder\_use(hal\_drm\_default)

    allow hal\_drm\_default mediadrm\_vendor\_data\_file:dir
    create\_dir\_perms;

    allow hal\_drm\_default mediadrm\_vendor\_data\_file:file
    create\_file\_perms;

    allow hal\_drm\_default gpu\_device:dir search;

    allow hal\_drm\_default gpu\_device:chr\_file rw\_file\_perms;

    allow hal\_drm\_default tmpfs:file { read write map};

For Android 11, make the changes shown below to
drm-default/file\_contexts if it’s not updated in your code base yet::

    # device/intel/sepolicy/drm-default/file\_contexts

    -/vendor/bin/hw/android\\.hardware\\.drm@1\\.2-service\\.clearkey
    u:object\_r:hal\_drm\_clearkey\_exec:s0

    +/vendor/bin/hw/android\\.hardware\\.drm@1\\.3-service\\.clearkey
    u:object\_r:hal\_drm\_clearkey\_exec:s0

Add the last line to enable widevine L3 for Celadon caas::


    # device/intel/project-celadon/caas/mixins.spec

    …

    gptbuild: true(size=16G,generate\_craff=false,compress\_gptimage=true)

    dynamic-partitions: true(super\_img\_in\_flashzip=true)

    dbc: true

    atrace: true

    firmware: true(all\_firmwares=true)

    aaf: true

    suspend: never

    widevine: L3\_Gen

Checkpoints
===========

#. Make sure that ``vendor/widewine/Android.mk`` is included in
   your device’s build process. (Normally, it should be included.)

#. After the build, you should have the following binaries in::

     out/target/product/$(TARGET\_DEVICE).

     vendor/lib/libwvhidl.so

     vendor/lib/mediadrm/libwvdrmengine.so

     vendor/bin/hw/android.hardware.drm@1.2-service.widevine

     vendor/etc/init/android.hardware.drm@1.2-service.widevine.rc <mailto:vendor/etc/init/android.hardware.drm@1.2-service.widevine.rc>`__

   For Android 11::

     vendor/bin/hw/android.hardware.drm@1.3-service.widevine ``

     vendor/etc/init/android.hardware.drm@1.3-service.widevine.rc``

#. Finally, you need to ensure that those files are on the TARGET
   devices and services are running.

Widevine keybox provision
*************************

Level 3 doesn’t need an factory Keybox provision.

Verify Widevine function
************************

Use Exoplayer to check
======================

ExoPlayerDemo.apk can be used to do an end-to-end verification of Modular
DRM. To install the ExoPlayer app, which is in source code, execute the
following:

``adb install vendor/widevine/libwvdrmengine/test/demo/ExoPlayerDemo.apk``

To run, launch ExoPlayer, then choose the clip to play. The
Widevine-encrypted DASH CENC assets are in the "WIDEVINE DASH GTS"
section.::

    ===WIDEVINE DASH GTS===

    | WV:HDCP not specified
    | HDCP not requied
    | HDCP requied
    | Secure video path requied(MP4,H264)
    | Secure video path requied (WebM,VP9)
    | Secure video path requied (MP4,H265)
    | HDCP+Secure video path requied
    | 30s license duration(fails at ~30s)

Check the AP log
================

Check logcat to confirm that the widevine service is running.::

    adb logcat \*:s WVCdm:v

    D WVCdm : Instantiating CDM.

    I WVCdm : [cdm\_engine.cpp(529):QueryStatus] CdmEngine::QueryStatus

    I WVCdm : [oemcrypto\_adapter\_dynamic.cpp(636):Initialize] Level 3
    Build Info (v15): OEMCrypto Level3 Code 8162 Apr 18 2019 19:27:27

    I WVCdm : [(0):] Level3 Library 8162 Apr 18 2019 19:27:27

    I WVCdm : [oemcrypto\_adapter\_dynamic.cpp(650):Initialize] L3
    Initialized. Trying L1.

    W WVCdm : [oemcrypto\_adapter\_dynamic.cpp(662):Initialize] Could not
    load liboemcrypto.so. Falling back to L3. dlopen failed: library
    "liboemcrypto.so" not found

    I WVCdm : [(0):] L3 Terminate.

Run GTS test cases
==================

In the GTS test environment, check the GtsExoPlayerTestCases and
GtsMediaTestCases modules to confirm that the widevine service is enabled
successfully::

  >  run gts -m GtsExoPlayerTestCases

  >  run gts -m GtsMediaTestCases

All test cases in these two modules are expected to pass.
