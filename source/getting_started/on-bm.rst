.. _caas-on-bm:

Run |C| on Bare Metal
#####################

This page explains what you'll need to run |C| on bare metal.

.. contents::
   :local:
   :depth: 1


Hardware Prerequisites
**********************

* Most of 5th, 6th, 7th, or 8th SoC Generation Intel® Core processors and
  Intel® Celeron® processors
* Intel® Xeon® E3 processor family
* Intel® Xeon® E5 processor family

You can try out the :abbr:`CaaS (Celadon as a Service)` experience on your
Intel® architecture (x86) hardware platforms with UEFI BIOS and Intel®
Virtualization Technology (Intel® VT) for IA-32, Intel® 64 and Intel®
Architecture (Intel® VT-x) and Intel® Virtualization Technology (Intel® VT)
for Directed I/O (Intel® VT-d) features enabled.

Configure the BIOS Setting
**************************

#. Depending on your bare metal target device, enter the BIOS firmware menu
   by pressing the hotkey (e.g. :kbd:`F2`, :kbd:`DEL`, or :kbd:`F12`) at
   the start of system bootup.

#. Enable Intel® VT-d and Intel® VT-x features in the Security configuration
   of the BIOS if it is not enabled.

#. Disable the *Secure Boot* feature in the BIOS for live testing the CaaS
   features at the early stage. Secure Boot should be re-enabled later.

    .. note::
        Do not forget to restore your previous BIOS settings after the test.
        Disabling the Secure Boot feature may result in the previously
        installed OS failing to boot.

Build Android Image
*******************

Refer to the :ref:`build-os-image` section in the Getting Started Guide to build the CaaS images.

Flash and Boot the Device
*************************

The following CaaS image types are generated at the end of the build:

* caas.img
    The GPT disk image for live booting on the target device.

* caas-flashfiles-eng.<user>.zip
    The compressed *flashfile* package contains the kernelflinger executables
    Refer to the :ref:`install-on-nuc` section to unzip the content of the
    package to a USB key, and install the CaaS images from the *UEFI Shell*.
