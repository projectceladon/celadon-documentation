.. _caas-on-vm:

Run |C| in a virtual machine
############################

This page explains what you'll need to run |C| in a virtual machine, or
run native |C| on an Intel® hardware platform.

.. contents::
   :local:
   :depth: 1

Prerequisites
*************

* Linux\* kernel version 5.0.0 or above running as the host OS

Prepare the host environment
****************************

To simpify the preparation works, a helper script :file:`setup_host.sh` is
provided.
The host device that launches the virtual machine requires Linux kernel
version 5.0.0 or above running as the host OS. Complete the following
instructions to set up `Clear Linux OS <https://clearlinux.org/>`_ 30870 or
`Ubuntu OS <https://ubuntu.com/>`_ 18.04.3 as the host device.
Any later OS version should also work.
During the installation, you will be prompted by some questions to confirm the
changes to the packages, it's safe to respond :kbd:`y` to all of them.

     .. code-block:: bash

        $ mkdir -p ~/civ && cd ~/civ
        $ wget https://raw.githubusercontent.com/projectceladon/device-androidia-mixins/master/groups/device-specific/caas/setup_host.sh
        $ chmod +x setup_host.sh
        $ sudo -E ./setup_host.sh

Build |C| images running in VM
******************************

Refer to the :ref:`build-os-image` section in the Getting Started Guide and
specify :envvar:`caas` as the lunch target to build the CiV images. The
following CiV image types are generated at the end of the build:

:file:`caas.img`

    The GPT disk image for direct booting. Skip next section to
    boot the CiV image with QEMU.

:file:`caas-flashfiles-eng.<user>.zip`

    The compressed *flashfile* package contains the |C| partition images for running in a VM.
    Proceed with the following section to install these images to a virtual
    disk image in `qcow2 <https://www.linux-kvm.org/page/Qcow2>`_ format.
    The flashfile package also can be used to install |C| natively on Intel hardware platforms,
    refer to :ref:`caas-on-bm` section for more detailed information.

Create a CiV virtual disk
*************************

.. note::
        Skip this section if you plan to boot the device directly with the GPT disk image :file:`caas.img`,
        or install the flashfile package :file:`caas-flashfiles-eng.<user>.zip`
        natively on an Intel hardware platform.

Follow the instructions below to create and set up CiV partitions on
a *qcow2* formatted virtual disk.

#. Run the helper script :file:`start_flash_usb.sh`.

    .. code-block:: bash

        $ cd ~/civ
        $ sudo ./start_flash_usb.sh caas-flashfiles-eng.<user>.zip

#. By running the :file:`start_flash_usb.sh` script, a QEMU window will be popped up, it
   will drop to the built-in UEFI Shell and start flashing the partitions to
   the virtual disk image.

    .. figure:: images/qemu-bios-flashing.png
        :align: center

#. The QEMU window will be closed automatically once flash complete.
   Now we get the CiV virtual disk :file:`android.qcow2` under the current
   directory.

Reboot to Android UI
********************

A script :file:`start_android_qcow2.sh` is developed to facilitate the CiV images 
booting process. However, before launching the script to boot to the Android UI,
you may need to edit the CiV image filename in the script, as the default image
file `android.qcow2` is hard-coded in the script:

.. code-block:: bash

    ...
    function launch_*render(){
        qemu-system-x86_64 \
        -m 2048 -smp 2 -M q35 \
        -name celadon-vm \
        -enable-kvm \
        ...
        -drive file=./android.qcow2,if=none,id=disk1 \  ### Edit the CiV image file name on the left
        ...
    }
    ...

Enter the following commands to run the script :file:`start_android_qcow2.sh` with
root permissions to facilitate the booting of CiV images with `QEMU <https://www.qemu.org/>`_.

.. code-block:: bash

    $ cd ~/civ
    $ sudo -E ./start_android_qcow2.sh

.. figure:: images/caas-qemu-booting.jpg
    :align: center

.. figure:: images/caas-qemu-lockscreen.jpg
    :align: center


.. _Clear Linux installation guide: https://docs.01.org/clearlinux/latest/get-started/bare-metal-install-desktop.html

.. _start_android_qcow2.sh: https://raw.githubusercontent.com/projectceladon/device-androidia-mixins/master/groups/device-specific/caas/start_android_qcow2.sh
