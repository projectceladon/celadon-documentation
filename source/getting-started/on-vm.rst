.. _caas-on-vm:

Run |C| in a virtual machine
############################

This page explains what you'll need to run |C| in a virtual machine.

.. contents::
   :local:
   :depth: 1

Prerequisites
*************

* A |NUC| device installed Ubuntu 18.04.3 or higher running Linux\* kernel
  version 5.0.0 or above.

  .. note::
     :abbr:`CiV (Celadon in VM)` releases have been validated on
     |NUC| model `NUC7i5DNHE`_. Releases after **April 17th 2020** are
     validated on |NUC| model `NUC10i7FNK`_ and `NUC10i7FNH`_ to
     take performance advantages of 10th Generation Intel® Core Processors.

Prepare the host environment
****************************

The host device that launches the virtual machine requires Ubuntu 18.04.
To simpify the preparation works, a helper script :file:`setup_host.sh` is
provided.
Complete the following instructions to set up Docker\* and the required
software on Ubuntu 18.04.3 before running |C| in a VM with `QEMU`_.
During the installation, you will be prompted by some questions to confirm the
changes to the packages, it's safe to respond :kbd:`y` to all of them.

     .. code-block:: bash

        $ mkdir -p ~/civ && cd ~/civ
        $ wget https://raw.githubusercontent.com/projectceladon/device-androidia-mixins/master/groups/device-specific/caas/setup_host.sh
        $ chmod +x setup_host.sh
        $ sudo -E ./setup_host.sh

The Linux kernel is extremely important on every Android devices, Google
recommends using `AOSP common kernels`_ on Android devices to include
features and implementations required by Android.
In addition to the AOSP common kernel, |C| also integrates several
`staging patches <https://github.com/projectceladon/vendor-intel-utils/tree/master/host/kernel/lts2019-chromium>`_
to take advantages of high performance new Intel processors,
so it's strongly recommended to run the |C| kernel as the host OS,
especially running CiV on `NUC10i7FNK`_ or `NUC10i7FNH`_ |NUC| devices.
To that end, a
`helper script <https://github.com/projectceladon/vendor-intel-utils/blob/master/host/kernel/lts2019-chromium/build.sh>`_
:file:`build.sh` is designed to facilitate
the building and deploying of |C| kerenl on the Ubuntu host.
Refer to the `README`_ for more detailed instructions.

.. _README: https://github.com/projectceladon/vendor-intel-utils/blob/master/host/kernel/lts2019-chromium/README

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

Create a CiV virtual disk
*************************

.. note::
        Skip this section if you plan to boot the device directly with the GPT disk image :file:`caas.img`.

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

    #!/bin/bash

    work_dir=$PWD
    caas_image=$work_dir/android.qcow2
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

.. _QEMU: https://www.qemu.org/

.. _start_android_qcow2.sh: https://raw.githubusercontent.com/projectceladon/device-androidia-mixins/master/groups/device-specific/caas/start_android_qcow2.sh

.. _NUC7i5DNHE: https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc7i5dnhe.html

.. _NUC10i7FNK: https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc10i7fnk.html

.. _NUC10i7FNH: https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc10i7fnh.html

.. _AOSP common kernels: https://source.android.com/devices/architecture/kernel/android-common
