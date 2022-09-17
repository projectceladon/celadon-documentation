.. _enable-uac3:

Enabling USB Audio Class 3.0 audio in |C|
#########################################

Introduction
************

There has been an increasing trend of adopting USB digital audio among hardware manufacturers. Even Google has done away with the 3.5mm radio jack in its latest `Pixel 2 <https://www.android.com/phones/google-pixel-2/>`_ phone series. This is because USB digital audio will considerably increase the music quality and also eliminate the need for a separate audio jack, making the form factors thinner. The Android Compatibility Definition Document (CDD) version 9.0 mandates that the devices without the 3.5mm audio jack must implement the USB Audio Class [1]_ [2]_. The only major drawback with the USB digital audio is its higher power consumption relative to analog audio. To address this issue, USB-IF has come up with a new specification - USB Audio Class 3.0 specification (UAC3), which primarily focuses on optimizing power consumption over USB audio.

USB Audio Class 3.0 specification (UAC3)
****************************************

`USB Audio Class Specification 3.0 <https://www.usb.org/sites/default/files/USB_Audio_v3.0.zip>`_ was released by USB-IF with an aim to provide power-saving features and support new codec types and data formats for consumer audio applications. Some of its salient features are:

#. Support for LPM (link power management) L1 mode
#. Support for new power domains where we can selectively turn off certain
   components to save power
#. New cluster descriptors, high capability descriptors and class-specific
   descriptors
#. Support for basic audio device definition (BADD) profiles
#. Support for new codecs and data formats

:abbr:`BADD (basic audio device definition)` is a subset of
:abbr:`UAC3 (USB Audio Class 3.0 specification)` and it is strongly
recommended to have the BADD configuration implemented in the audio devices
that are compliant with :abbr:`UAC3 (USB Audio Class 3.0 specification)`.
BADD defines three types of audio functions:

#. Basic audio output function (BAOF)
#. Basic audio input function (BAIF)
#. Basic audio I/O function (BAIOF)

It includes the following profiles:

* Generic I/O
* Headphone
* Speaker
* Microphone
* Headset
* Headset adapter
* Speakerphone

Enabling UAC3 configuration in |C|
==================================

To maintain backward-compatibility with older host software which may not
support UAC3, the specification mandates that the first configuration in the
audio device should be compatible with either UAC1 (USB Audio Class 1.0) or
UAC2 (USB Audio Class 2.0). The next configuration will be a BADD-compliant
configuration. Selecting this configuration will enable the system to save
power by leveraging the new power domains and LPM (link power management)
L1 capability of the audio device. Support for this configuration is
available in |C|. Make sure that the following patches are in your build:

1. Patch to add support for USB Audio Class 3.0

.. code-block:: console

   commit 9a2fe9b801f585baccf8352d82839dcd54b300cf
   Author: Ruslan Bilovol <ruslan.bilovol@gmail.com>
   Date:   Wed Mar 21 02:03:59 2018 +0200

       ALSA: usb: initial USB Audio Device Class 3.0 support

       Recently released USB Audio Class 3.0 specification
       introduces many significant changes comparing to
       previous versions, like
        - new Power Domains, support for LPM/L1
        - new Cluster descriptor
        - changed layout of all class-specific descriptors
        - new High Capability descriptors
        - New class-specific String descriptors
        - new and removed units
        - additional sources for interrupts
        - removed Type II Audio Data Formats
        - ... and many other things (check spec)

       It also provides backward compatibility through
       multiple configurations, as well as requires
       mandatory support for BADD (Basic Audio Device
       Definition) on each ADC3.0 compliant device

       This patch adds initial support of UAC3 specification
       that is enough for Generic I/O Profile (BAOF, BAIF)
       device support from BADD document.

       Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
       Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
       Signed-off-by: Takashi Iwai <tiwai@suse.de>

2. Patch to add support for BADD profiles

.. code-block:: console

   commit 17156f23e93c0f59e06dd2aaffd06221341caaee
   Author: Ruslan Bilovol <ruslan.bilovol@gmail.com>
   Date:   Fri May 4 04:24:04 2018 +0300

       ALSA: usb: add UAC3 BADD profiles support

       Recently released USB Audio Class 3.0 specification
       contains BADD (Basic Audio Device Definition) document
       which describes pre-defined UAC3 configurations.

       BADD support is mandatory for UAC3 devices, it should be
       implemented as a separate USB device configuration.
       As per BADD document, class-specific descriptors
       shall not be included in the Deviceâ<80><99>s Configuration
       descriptor ("inferred"), but host can guess them
       from BADD profile number, number of endpoints and
       their max packed sizes.

       This patch adds support of all BADD profiles from the spec

       Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
       Tested-by: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
       Signed-off-by: Takashi Iwai <tiwai@suse.de>

3. Other patches adding additional features for UAC3:

.. code-block:: console

   ALSA: usb-audio: Operate UAC3 Power Domains in PCM callbacks
   ALSA: usb-audio: Add UAC3 Power Domains to suspend/resume
   ALSA: usb-audio: Unify virtual type units type to UAC3 values
   ALSA: usb-audio: Add support for Processing Units in UAC3
   ALSA: usb-audio: Add support for Selector Units in UAC3
   ALSA: usb-audio: Add insertion control for UAC3 BADD
   ALSA: usb-audio: UAC3: Parse Input Terminal number of channels.
   ALSA: usb-audio: UAC3 Add support for connector insertion.
   ALSA: usb-audio: UAC3. Add support for mixer unit.
   ALSA: usb-audio: Use Class Specific EP for UAC3 devices.
   ALSA: usb-audio: Add sanity checks in UAC3 clock parsers

4. Selecting UAC3 configuration for audio:

.. code-block:: console

   commit 084d710fc377bf1d32d67c000590d9d1ab37d375
   Author: Saranya Gopal <saranya.gopal@intel.com>
   Date:   Wed Sep 12 01:03:57 2018 +0530

       usbcore: Select UAC3 configuration for audio if present

       USB audio class 3.0 specification introduced many significant
       changes like
        - new power domains, support for LPM/L1
        - new cluster descriptor
        - new high capability and class-specific string descriptors
        - BADD profiles
        - ... and many other things (check spec from link below:
       http://www.usb.org/developers/docs/devclass_docs/USB_Audio_v3.0.zip)

       Now that UAC3 is supported in linux, choose UAC3
       configuration for audio if the device supports it.
       Selecting this configuration will enable the system to
       save power by leveraging the new power domains and LPM L1
       capability and also support new codec types and data formats
       for consumer audio applications.

       Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
       Reviewed-by: Felipe Balbi <felipe.balbi@linux.intel.com>

Enabling LPM in extensible host controller interface (XHCI)
===========================================================

:abbr:`XHCI (extensible host controller interface)` is capable of supporting
hardware :abbr:`LPM (link power management)`
in modern Intel® architecture platforms. For example, the following *sysfs*
entry confirms that the hardware USB port **3-1** is capable of supporting
hardware LPM, you can get the port information for your system from the
audio device enumeration logs in the ``dmesg`` output.

.. code-block:: bash

   $ cat /sys/bus/usb/devices/3-1/power/usb2_hardware_lpm
   enabled

If the output value is **disabled**, you could enable LPM by writing **1** to the entry. The transition into LPM L1 mode can be confirmed through protocol traces.

The following snapshot shows Lecroy traces of LPM transaction on a Kaby Lake
platform with a UAC3-compliant audio device:

.. figure:: images/uac3-usb-protocol-trace.png
    :align: center

Here, the LPM L1 residency is 252 us. The service interval in this configuration is 1 ms. The USB host is required to request LPM/L1 state after servicing the device in each service interval. In our case, the device was entering LPM L1 with around 250 us L1 residency during every 1 ms service interval.

Conclusion
**********

We have enabled **USB Audio Class 3.0** in |C| which helps us to leverage the power-saving features of USB digital audio. In future, USB audio power can be further optimized by offloading USB audio to an offload-engine, thereby allowing the processor to go into deeper sleep states.

.. [1] Android 9 Compatibility Definition - `Professional Audio <https://source.android.com/compatibility/android-cdd#5_10_professional_audio>`_
.. [2] Android 9 Compatibility Definition - `Audio <https://source.android.com/compatibility/android-cdd#7_8_audio>`_
