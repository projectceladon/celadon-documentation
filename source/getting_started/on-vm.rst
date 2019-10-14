.. _caas-on-vm:

Run |C| on a virtual machine
############################

This page explains what you'll need to run |C| on a virtual machine.

.. contents::
   :local:
   :depth: 1

Prerequisites
*************

* Linux\* kernel version 5.0.0 or above running as the host OS
* USB flash drive
* At least 16GB free disk space on the host

Prepare the host environment
****************************

The host device that launches the virtual machine requires Linux kernel
version 5.0.0 or above running as the host OS. Complete the following
instructions to set up `Clear Linux OS <https://clearlinux.org/>`_ 30870 as
the host device. Any later Clear Linux OS version should also work.

#. Refer to the `Clear Linux installation guide`_ for instructions on how to
   install Clear Linux OS on the host device.

#. Install the required bundles:

    .. code-block:: bash

        $ sudo swupd bundle-add kvm-host
        $ sudo mkdir -p /etc/kernel/cmdline.d/
        $ sudo echo "ignore_loglevel log_buf_len=128M console=ttyS0,115200,8n1 i915.enable_gvt=1 kvm.ignore_msrs=1 intel_iommu=on drm.debug=0" > /etc/kernel/cmdline.d/gvtg.conf
        $ sudo clr-boot-manager update

#. Reboot the host device for the changes to take effect.

Build OVMF firmware
*******************

*OVMF* is the project that enables UEFI support for virtual machines. OVMF
is used by QEMU (the open source machine emulator and virtualizer) to boot
:abbr:`CaaS (Celadon as a Service)` images on virtual machines. Follow
the steps below to build the OVMF firmware from source.

#. Get the firmware source code:

    .. code-block:: bash

        $ mkdir -p ~/caas
        $ wget https://github.com/tianocore/edk2/archive/edk2-stable201808.tar.gz -O ~/caas/edk2-stable201808.tar.gz
        $ cd ~/caas/ && tar zxvf edk2-stable201808.tar.gz

#. Install the dependencies prior to building:

    .. code-block:: bash

        $ sudo apt install -y build-essential git uuid-dev iasl nasm

#. Build the OVMF firmware binary:

    .. code-block:: bash

        $ cd edk2-edk2-stable201808
        $ source ./edksetup.sh
        $ make -C BaseTools/
        $ build -a X64 -t GCC48 -p OvmfPkg/OvmfPkgX64.dsc

#. Copy the generated firmware binary :file:`OVMF.fd` to the working
   directory:

    .. code-block:: bash

        $ find . -name OVMF.fd -exec cp {} ~/caas \;

Build CaaS image
****************

Refer to the :ref:`build-os-image` section in the Getting Started Guide and
specify :envvar:`caas` as the lunch target to build the CaaS images. The
following CaaS image types are generated at the end of the build:

caas.img
    The GPT disk image for direct booting. Skip the following section to
    boot the CaaS image with QEMU.

caas-flashfiles-eng.<user>.zip
    The compressed *flashfile* package contains the CaaS partition images.
    Proceed with the following section to install these images to a virtual
    disk image in `qcow2 <https://www.linux-kvm.org/page/Qcow2>`_ format.

Create a CaaS virtual disk
**************************

To create a virtual disk containing the CaaS partitions, you'll need
a USB flash drive and at least 16GB free disk space. Follow the instructions
below to create and set up CaaS partitions on a *qcow2* formatted virtual
disk.

#. Create a 16GB empty disk image of *qcow2* type:

    .. code-block:: bash

        $ qemu-img create -f qcow2 ~/caas/android.qcow2 16G

#. Connect the USB flash drive to the development host.

#. Run the :command:`lsusb` command. Use the output to identify the vendor
   ID and product ID of the USB flash drive.
   :

    .. code-block:: bash

        $ lsusb
        ...
        Bus 002 Device 002: ID 0781:5591 SanDisk Corp.
        ...

    In the example above, *0781* and *5591* are the vendor ID and
    product ID, respectively, of the target USB flash drive.

#. Identify the directory on which you mounted the USB flash drive. If the
   flash drive is not mounted, mount the USB flash drive to a temporary
   directory. Unzip the content of the CaaS *flashfile* package to the flash
   drive. Unmount the USB flash drive after finishing:

    .. code-block:: bash

        $ sudo mount /dev/sdc /mnt   ## if the USB disk is not auto-mounted
        $ sudo unzip caas-flashfiles-eng.<user>.zip -d /mnt
        $ umount /dev/sdc

    .. note::
        The previous example assumes you assigned :file:`/dev/sdc` to the
        USB flash drive. You might need to replace the drive names with the
        actual device node observed from the :command:`lsblk` command.

#. Download the helper script :file:`start_flash_usb.sh`. Edit the script
   with the vendor ID and product ID for your USB flash drive obtained from
   the previous step:

    .. code-block:: bash

        $ wget https://raw.githubusercontent.com/projectceladon/device-androidia-mixins/master/groups/device-specific/caas/start_flash_usb.sh  -O ~/caas/start_flash_usb.sh
        $ chmod +x ~/caas/start_flash_usb.sh

    .. code-block:: none

        #!/bin/bash

        qemu-system-x86_64 \
        ...
        -device usb-host,bus=xhci.0,vendorid=<your-usb-vendorid>,productid=<your-usb-productid> \
        ...
        -bios ./OVMF.fd \

#. After launching the :file:`start_flash_usb.sh` script, a QEMU window
   pops up. Click the QEMU window, press the :kbd:`F2` key, and select the
   :menuselection:`Boot Manager` option to enter the boot-manager menu:

    .. code-block:: bash

        $ cd ~/caas
        $ sudo ./start_flash_usb.sh

    .. figure:: images/qemu-bios.png
        :align: center

#. Select the :menuselection:`EFI Internal Shell` entry to run the built-in
   UEFI Shell. The virtual UEFI firmware will detect the USB flash drive and
   start flashing the CaaS partition images to the :file:`android.qcow2`
   virtual disk.

    .. figure:: images/qemu-bios-bootmanager.png
        :align: center

    .. figure:: images/qemu-bios-flashing.png
        :align: center

#. Close the QEMU window when the process is complete. You may now remove
   the USB flash drive.

Reboot to Android UI
********************

Run the script :file:`start_android_qcow2.sh` to faciltate booting the CaaS
images with `QEMU <https://www.qemu.org/>`_. Download the
:file:`start_android_qcow2.sh`_ script to the working directory and change
the permissions on the binary executable with the following commands:

.. code-block:: bash

    $ wget https://raw.githubusercontent.com/projectceladon/device-androidia-mixins/master/groups/device-specific/caas/start_android_qcow2.sh -O ~/caas/start_android_qcow2.sh
    $ chmod +x ~/caas/start_android_qcow2.sh

Before launching the script to boot to the Android UI, edit the CaaS image
filename in the script if necessary. The default image file
:file:`android.qcow2` is hard-coded in the script:

.. code-block:: bash

    ...
    function launch_hwrender(){
        qemu-system-x86_64 \
        -m 2048 -smp 2 -M q35 \
        -name caas-vm \
        -enable-kvm \
        ...
        -drive file=./android.qcow2,if=virtio \ ### Edit the CaaS image file name on the left
        ...
    }
    ...

.. code-block:: bash

    $ cd ~/caas
    $ sudo ./start_android_qcow2.sh

.. figure:: images/caas-qemu-booting.jpg
    :align: center

.. figure:: images/caas-qemu-lockscreen.jpg
    :align: center


.. _Clear Linux installation guide: https://docs.01.org/clearlinux/latest/get-started/bare-metal-install-desktop.html

.. _start_android_qcow2.sh: https://raw.githubusercontent.com/projectceladon/device-androidia-mixins/master/groups/device-specific/caas/start_android_qcow2.sh
