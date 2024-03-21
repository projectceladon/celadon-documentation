.. _caas-on-bm:

Run |C| on Intel Platforms
#################################

This page explains what you'll need to run |C| natively on Intel hardware platforms.

.. contents::
   :local:
   :depth: 1


Hardware Prerequisites
**********************

* An |NUC-attr| with an eighth generation or newer |Core-attr| Processor.

You can try out the :abbr:`CiV (Celadon in VM)` experience on your
Intel® architecture (x86) hardware platforms with UEFI BIOS and Intel®
Virtualization Technology (Intel® VT) for IA-32, Intel® 64 and Intel®
Architecture (Intel® VT-x) and Intel® Virtualization Technology (Intel® VT)
for Directed I/O (Intel® VT-d) features enabled.

.. note::
    Users should be aware that test suites provided by Google may not pass
    with 100% scoring if deploying |C| on bare metal systems. While |C| in VM
    deployments are supported by `Google Mobile Services (GMS) <https://www.android.com/gms/>`_,
    |C| on bare metal does not have GMS support. Dedicated use cases like retail,
    client, education and gaming do not need GMS. If there is a need for GMS
    while running |C| on bare metal, direct communication with Google will
    be necessary.

Configure the BIOS Setting
**************************

#. Depending on your bare metal target device, enter the BIOS firmware menu
   by pressing the hotkey (e.g. :kbd:`F2`, :kbd:`DEL`, or :kbd:`F12`) at
   the start of system bootup.

#. Enable Intel® VT-d and Intel® VT-x features in the Security configuration
   of the BIOS if it is not enabled.

#. Disable the *Secure Boot* feature in the BIOS for live testing the CiV
   features at the early stage. Secure Boot should be re-enabled later.

    .. note::
        Do not forget to restore your previous BIOS settings after the test.
        Disabling the Secure Boot feature may result in the previously
        installed OS failing to boot.

Build Android Image
*******************

Refer to the :ref:`build-os-image` section in the Getting Started Guide to build the CiV images.

Flash and Boot the Device
*************************

The following CiV image types are generated at the end of the build:

* :file:`caas.img`

    The GPT disk image for live booting on the target device.

* :file:`caas-flashfiles-eng.<user>.zip`

    The compressed *flashfile* package contains the kernelflinger executables.
    You need to unzip the content of the
    package to a USB key, and install the CiV images from the *UEFI Shell*.

Live Boot
*********

The *live boot* feature is enabled in the CiV images by default.
The live boot feature allows you to flash a specially-built image to a USB
drive and then boot from the USB drive to Android\* directly without
installing Android to internal storage first.

The live boot feature is used only for debug purposes and must be built
with :command:`eng` or :command:`userdebug` build flavors.

For |C|, you will build a :command:`GPT` disk image, flash it to a USB drive
(similar to installing Android on the USB drive), and then boot Android from
the USB drive. With this approach, |C| supports all Android features, except
some security features that need hardware binding.

Perform the following steps to live-boot |C|.

#. Build a live boot image.

    #. Follow the steps in :ref:`build-from-source` to set up the local
       development environment and to download the source code.

    #. Open the *mixins* config file to verify that the kernelflinger
       supports the USB live boot feature for your
       :command:`[lunch_target]`, because the feature is enabled by default
       for some of the lunch targets such as :command:`"caas"`,
       :command:`"celadon_ivi"` and :command:`"celadon_tablet"`.

       The following example shows the mixins config file
       :file:`device/intel/project-celadon/caas/mixins.spec` for the
       :command:`"caas"` lunch target:

       .. code-block:: none

          boot-arch: project_celadon(...,...,usb_storage=true,live_boot=true)

    #. Enable the live boot feature by adding the :command:`usb_storage`
       and :command:`live_boot` options to the :file:`mixins.spec` file.

    #. Execute the following command to build a live boot image:

       .. code-block:: bash

          $ make SPARSE_IMAGE=true gptimage -j $(nproc)

       As an alternative, you can pass the options in the :command:`make`
       command line:

       .. code-block:: bash

          $ make SPARSE_IMAGE=true KERNELFLINGER_SUPPORT_USB_STORAGE=true KERNELFLINGER_SUPPORT_LIVE_BOOT=true gptimage -j $(nproc)

       After a successful build, you will have an
       :file:`out/target/product/[lunch_target]/[lunch_target].img` image.
       For example, an :file:`out/target/product/caas/caas.img` image is
       generated for the :command:`caas` lunch target.

    #. The previous command creates an image file of 32GB that
       contains an entire GPT disk. To change the default image size, edit
       the mixins config file
       :file:`device/intel/project-celadon/[lunch_target]/mixins.spec`
       as follows:

       .. code-block:: none

          gptbuild: true(size=32G,generate_craff=false)

.. _usb-live-boot:

#. Flash the live boot image to a USB drive.

   * For Linux\*, use the *dd* tool to flash the image file to the USB
     drive. For example:

      .. code-block:: bash

         $ sudo dd if=caas.img of=/dev/sdc bs=1M

      .. caution::
         You **MUST** change the :file:`/dev/sdc` to the actual USB drive
         device.

      Be sure all the buffered data is written to the USB drive before
      removing the USB drive by running the :command:`sync` command in Linux.

   * For Windows, use the *rufus* tool to flash the image file to the USB
     drive.

#. Boot from the USB drive to Android directly.

   Insert the USB drive and power on the computer. Then, press a function
   key to enter the BIOS boot menu. Select :menuselection:`boot` from the
   USB drive. Now, you can boot from the USB drive to Android directly.

   If you choose to save data to this Android device and you have not
   removed the USB drive, the data will be saved to the USB drive. You can
   then use the saved data on other computers.

   .. note::
      #. If you already installed Android in the internal storage, disable
         the internal storage if you are using USB live boot.

      #. If you want to use one USB drive in two computers, make sure the
         lock state is the same on each computer.

Dual Boot |C| with Windows
**************************

You may want to install Windows and |C| Android on one device, and select
which OS to boot every time the device is powering up. To facilitate dual
boot, install Windows and |C| on two separate storage devices.

The compressed *flashfile* package contains the kernelflinger UEFI installer,
which does not prompt the target storage device to install.
You must disconnect the Windows installed storage device first,
connect the storage back to the device after installing |C|, and then
select the OS to boot from the BIOS boot menu.
