.. _caas-on-bm:

Run CaaS on Bare Metal
======================

Hardware
--------

* Most of 5th, 6th, 7th or 8th SoC Generation Intel® Core and Celeron® Processors
* Intel® E3, E5 Xeon® Processor E3 and E5 family have been verified

You are welcome to try out the CaaS experience on your Intel x86 hardware platforms with UEFI BIOS and VT-x/VT-d features enabled.

Configure the BIOS Setting
--------------------------

#. Depending on your bare metal target device, enter the BIOS firmware menu by pressing the hot-key (e.g. ``F2``, ``DEL``, or ``F12``) at the early of system booting-up.

#. Enable the **VT-d** and **VT-x** features in Security configuration of the BIOS if it is not enabled.

#. Disable the **Secure Boot** feature in the BIOS for live-testing the CaaS fatures at the early stage. Secure Boot should be re-enabled later.

    .. note::
        Don't forget to restore your previous BIOS settings after the test. Disable the secure boot may result the previous installed OS failed to boot.

Build Android Image
-------------------

Reference the :ref:`build-os-image` section in the Getting Started Guide to build the CaaS images.

Flash and Boot the Device
-------------------------

The following CaaS image types are generated at the end of the build:

* caas.img
    The GPT disk image for live-booting on the traget device. Reference the :ref:`Live Boot <usb-live-boot>` section to write the CaaS GPT image to a USB key, and boot the Android from that USB key.

* caas-flashfiles-eng.<user>.zip
    The compressed *flashfile* package contains the kernelflinger executables. Reference :ref:`install-on-nuc` section to unzip the content of the package to a USB key, and install the CaaS images from the **UEFI Shell**.
