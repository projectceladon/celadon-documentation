.. _caas-on-container:

Run |C| in a Docker* container
##############################

This page explains how to run the |C| Android\* image in a Docker\*
container.

.. contents::
   :local:
   :depth: 1

Description
***********

:abbr:`CiC (Celadon in Container)` is Intel's open source Android solution
for running |C| on a Linux based container environment, in order to achieve
high-scalability, low performance overhead for some emerging use cases
such as Cloud Gaming, IOT and :abbr:`FCF (Flexible Container Framework)`.

To support CiC running multiple Android instances on a single kernel without
interfering each other, the following isolation approach is implemented:

    :dfn:`I/O Devices`

        I/O devices can be shared between different Android instances,
        and mediation is required.

    :dfn:`Kernel`

        Shared resources consumed by the Android instances should be isolated.

            * CPU, Memory are isolated using CGroup.
            * Binder is isolated by adding multiple device nodes.

    :dfn:`Usespace`

        Resources in different Android instances need to be isolated,
        for example, network/process id/... PID, process name, network, cgroup names, etc.

Running CiC requires modern PCs with 6th generation or newer Intel®
Architecture Processors with integrated GPU. The |NUC| model `NUC7i7BNH`_
and model `NUC7i5BNH`_ are recommended devices to try out the CiC features.

.. note::
   The current version of CiC is 0.5, which provides a preview of the feature
   for pilot and development purposes. Some features such as `Trusty`_, `Verified Boot`_,
   and the `OTA update`_ do not exist in this preview version.
   We plan for these features in upcoming releases.

Prerequisites
*************

Set up Security-Enhanced Linux (SELinux)
========================================

#. On the target device, CiC currently requires Ubuntu 18.04.3 or later
   running `SELinux`_ module enabled Linux\* kernel, Ubuntu 20.04 (Focal Fossa)
   is recommended. Though SELinux module
   may be enabled in the Ubuntu kernels by default, you have to hook
   the module to the kernel through the Linux Security Module (LSM) framework.
   The following command adds the required kernel command line option to
   the configuration file template :file:`/etc/default/grub` of GRUB bootloader,
   in order to hook the SELinux module to the kernel LSM framework.

    .. code-block:: bash

        $ sudo vi /etc/default/grub

   Modify the :guilabel:`GRUB_CMDLINE_LINUX` setting as follows:

    .. code-block:: none

        ...
        GRUB_CMDLINE_LINUX="lsm=yama,loadpin,integrity,selinux"
        ...

#. Update the bootloader with the new setting and reboot the device
   with the following commands:

    .. code-block:: none

        $ sudo update-grub
        Sourcing file `/etc/default/grub'
        Generating grub configuration file ...
        ...
        Adding boot menu entry for EFI firmware configuration
        Done
        $ sudo reboot

Set up Docker Engine
====================

#. You must install Docker on both the development host and the target
   device. Enter the following commands to install the prerequisites, set up
   the repository, and install the Docker Engine. Refer to the
   `Get Docker Engine - Community for Ubuntu`_ installation guide for more
   detailed information.

   .. code-block:: bash

      $ sudo apt-get install apt-transport-https ca-certificates curl
      $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
      $ sudo apt-get update
      $ sudo apt-get install -y docker-ce docker-ce-cli containerd.io
      $ sudo usermod -aG docker $USER

   .. note::
      The last command is optional if you want to run the Docker as a non-root user.

#. Restart your session for changes to take effect.

Build the CiC Package
*********************

#. Refer to the :ref:`build-from-source` section in the Getting Started
   Guide to set up the |C| source tree and the build environment. There are
   two build targets associated with the CiC builds:

   :makevar:`cic`

      The lunch target which is Android CDD compliant.

   :makevar:`cic_dev`

      The lunch target for development purposes (available on the CiC branch of the |C|
      Android-P release). This lunch target is deprecated.

#. Run the following commands to select :guilabel:`cic-userdebug` as the lunch
   target and start the build. The CiC package is generated at
   :file:`$OUT/$TARGET_PRODUCT-*.tar.gz`.

   .. code-block:: bash

      $ source build/envsetup.sh
      $ lunch cic-userdebug
      $ make cic -j $(nproc)

.. _deploy-cic-on-target:

Deploy on Target
****************

#. Download and extract the CiC package tar file on the target device.

#. The CiC image supports *secure* mode and *non-secure* mode.
   In **secure** mode, `Trusty`_ is enabled and `SELinux`_ policy is set to
   enforcing mode, thus you can't modify the :dfn:`/system` partition,
   update the docker container is not possible. In addition, since Trusty should
   implement a secure storage service based on the :abbr:`RPMB (Replay Protected Memory Block)`
   partition in eMMC, the following step includes instructions on how to
   set up a :dfn:`teedata` partition to simulate the RPMB secure storage.

   In contrast, Trusty is disabled and SELinux policy is set to permissive mode
   in **non-secure** mode. The container can be updated, and you can
   modify the :dfn:`/system` partition as well.

#. Skip this step if you are setting up the CiC image in non-secure mode.

   a. A ':dfn:`teedata`' disk partition is required to run CiC in secure mode.
      Create a new disk partition of 32M bytes in size with the name '**teedata**'
      if there are unallocated disk space on the target device. You may reference
      `this article <https://howtoubuntu.org/how-to-resize-partitions-with-the-ubuntu-or-gparted-live-cd>`_
      to shrink the root partition of an existing Ubuntu setup, if no disk space
      can be reserved as the :dfn:`teedata` partition.

      The following example boots the device from a Ubuntu live-CD, runs the :command:`gparted`
      utility, right-clicks the root partition and selects :guilabel:`Resize/Move` item
      to reserve 32MB disk space at the bottom of the root disk:

      .. figure:: images/cic-shrink-root-partition.png
         :align: center

   #. To create a ':dfn:`teedata`' partition,
      right-click the unallocated partition, select :guilabel:`New` item, create
      a new partition named "':dfn:`teedata`", set its label to "':dfn:`teedata`" as well,
      and leave the File system "unformatted":

      .. figure:: images/cic-add-teedata-partition.png
         :align: center

   #. The first disk partition used to be the EFI System Partition, please rename
      it to "EFI" by right-clicking the partition, and select :guilabel:`Name Partition` item:

      .. figure:: images/cic-rename-efi-partition.png
         :align: center

   #. Finally, click :guilabel:`Edit` then :guilabel:`Apply All Operations` items
      for changes to take effect.

      .. figure:: images/cic-apply-parrtition-changes.png
         :align: center

   #. Before rebooting the Ubuntu system, make sure the :guilabel:`Secure Boot` feature
      is disabled in the UEFI firmware:

      .. figure:: images/nuc7i5dnh-secure-boot-disabled.png
         :align: center

#. Run the :file:`setup-aic` script to install the container images.
   You can pass ':command:`-s`' argument to the script to set up the containers
   in secure mode, or ':command:`-ns`' argument for non-secure mode.

   .. note::
      To run CiC in secure mode, make sure you have ever set up a :dfn:`teedata`
      partition for the :abbr:`RPMB (Replay Protected Memory Block)` simulation.
      Check out the previous step for detailed information.

   .. code-block:: bash

      # The following command sets up CiC in non-secure mode
      $ sudo -E ./setup-aic -ns

   .. code-block:: bash

      # The following command sets up CiC in secure mode
      $ sudo -E ./setup-aic -s

   .. note::
      #. If you are setting up the CiC in secure mode, some of the Ubuntu startup
         files in the :abbr:`ESP (EFI System Partition)` are overwritten
         by the :file:`setup-aic` script. Specifically, the bootloader shim file
         :file:`shimx64.efi` is replaced by :file:`kf4cic.efi` in the CiC package.
         The original shim file is renamed as :file:`loaderx64.efi`.
         In addition, the :file:`tos.img` image, which contains the Trusty OS,
         is copied to the ESP partition as well.

      #. Since the Ubuntu booting sequence has been extended to run the Trusty OS,
         you would see the following warning during the system startup as the secure
         boot is disabled:

         .. figure:: images/cic-boot-warning.jpg
            :align: center

#. Reboot the device after the installation.

#. The :file:`setup-aic` script not only set up CiC docker images on the target
   device, but also installed a `systemd`_ service ':command:`cic`' to launch the CiC
   container images automatically on system startup. You can verify whether the CiC
   containers are running successfully with the following command:

   .. code-block:: bash

      $ sudo docker ps
      CONTAINER ID        IMAGE                                 COMMAND                  CREATED             STATUS              PORTS                    NAMES
      b5186e3c2116        android:CC0000105-cic-userdebug       "/android-entry -e 0"    5 minutes ago       Up 2 minutes        0.0.0.0:5555->5555/tcp   android0
      f077a4eb722c        aic-manager:CC0000105-cic-userdebug   "/aic-manager-entry ..." 5 minutes ago       Up 2 minutes                                 aic-manager

#. In addition, an Android Container Client for Linux script ':command:`cfc`'
   and its desktop file :guilabel:`cfc.desktop` are also installed on the Gnome desktop.
   Run the :command:`cfc` script in a shell terminal or launch the :guilabel:`cfc.desktop`
   from the GUI, a full screen window pops up and shows the Android home screen:

   .. figure:: images/cic-start.png
        :align: center

   .. note::
      CiC runs as a Docker container, as a result, you can use
      `Docker CLI commands`_ directly for debugging. For example, if you
      encounter issues, you can capture necessary information by running the
      following commands:

   .. code-block:: bash

      $ docker logs aic-manager 2>&1 | tee aic-manager.log
      $ docker exec -it android0 sh | tee android.log
      # run commands to get information, such as
           getprop
           logcat -b all

.. _NUC7i7BNH: https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc7i7bnh.html

.. _NUC7i5BNH: https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc7i5bnh.html

.. _Trusty: https://source.android.com/security/trusty

.. _Verified Boot: https://source.android.com/security/verifiedboot

.. _OTA update: https://source.android.com/devices/tech/ota

.. _SELinux: https://selinuxproject.org

.. _Get Docker Engine - Community for Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/

.. _Docker CLI commands: https://docs.docker.com/engine/reference/commandline/cli

.. _systemd: https://www.freedesktop.org/wiki/Software/systemd/
