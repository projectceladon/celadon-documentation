.. _build-from-source:

Build |C| From Source
#####################

This page explains the prerequisites and steps to set up your environment,
download source code, and build |C| from source.

.. contents::
   :local:
   :depth: 1

Prerequisites
*************

* A 64-bit development workstation running Ubuntu* 18.04 (Bionic Beaver)
  operating system.

* At least 150GB of free disk space on your workstation to checkout the
  source code and to store the build artifacts.

.. note:: 
   Although Android\* is typically built with a GNU/Linux\* or macOS\*
   operating system, we recommend you build |C| images on Ubuntu* 18.04.
   For setup instructions using other operating systems, refer to the
   `Establishing a Build Environment <https://source.android.com/setup/build/initializing>`_ section on the AOSP website.

Set up the development environment
**********************************

|C| and Android source code consist of multiple Git\* repositories. The
:command:`repo` tool makes it easier to work with those repositories. 

#. Create a local :file:`bin/` directory, download the :command:`repo` tool
   to that directory, and make the binary executable with the following commands:

   .. code-block:: bash

       $ mkdir -p ~/bin
       $ curl https://storage.googleapis.com/git-repo-downloads/repo >  ~/bin/repo
       $ chmod a+x ~/bin/repo
       $ export PATH=~/bin:$PATH

#. Install the following required packages on your 64-bit Ubuntu 18.04 LTS
   development workstation prior to starting the build:

   .. code-block:: bash
   
      $ sudo apt-get update
      $ sudo apt-get install openjdk-8-jdk git ccache automake \
            lzop bison gperf build-essential zip curl \
            zlib1g-dev g++-multilib python-networkx \
            libxml2-utils bzip2 libbz2-dev libbz2-1.0 \
            libghc-bzlib-dev squashfs-tools pngcrush \
            schedtool dpkg-dev liblz4-tool make optipng maven \
            libssl-dev bc bsdmainutils gettext python-mako \
            libelf-dev sbsigntool dosfstools mtools efitools \
            python-pystache git-lfs python3

Installing Docker\*
===================

:abbr:`CiV (Celadon in VM)` and :abbr:`CIC (Celadon in Container)` require
`Docker <https://www.docker.com/>`_ to build the images. 

#. Install the following packages before performing the CiV or CiC build:

   .. code-block:: bash

       $ sudo apt-get install apt-transport-https ca-certificates curl

#. Execute the following commands to add the Docker's official GPG key, set
   up the repository, and install the Docker Engine - Community from the
   repository:

   .. code-block:: bash

       $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
       $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
       $ sudo apt-get update
       $ sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#. You may use Docker as a non-root user by adding your user ID to the
   **docker** group. For more information, refer to the
   `Get Docker Engine - Community for Ubuntu <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_ installation guide.

   .. code-block:: bash
   
       $ sudo usermod -aG docker $USER

Build |C| in VM with Android 10
*******************************

Download the source
===================

#. Enter the following commands to create an empty directory to hold the
   |C| source files and serve as the working directory, and to bring down the
   latest version of :command:`repo` tool, including its most recent fixes.

   .. note::
      The URL specifies the manifest that refers to various repositories
      used by |C|, which are placed within the working directory. For now, a
      :file:`.repo/` folder is created to store the manifest and the metadata of
      the source repositories.

   .. code-block:: bash

       $ mkdir civ
       $ cd civ
       $ repo init -u https://github.com/projectceladon/manifest.git

#. Enter the following command to pull down the |C| Android source tree to
   your working directory. The :command:`repo sync` operation might take time
   depending on your Internet download speed. Refer to the
   `Downloading the Source <https://source.android.com/setup/build/downloading>`_
   section of the AOSP website for tips to download the source behind a
   proxy.

   .. code-block:: bash

       $ repo sync -c

.. _build-os-image:

Build |C| in VM image
=====================

#. Optionally, delete existing output of any previous build with the
   following command in the top-most |C| source directory:

   .. code-block:: bash

       $ make clobber

#. Enter the following command to initialize the build variables with the
   :file:`envsetup.sh` script:

   .. code-block:: bash

       $ source build/envsetup.sh

#. Specify your |C| lunch target using the :command:`lunch` command. You can
   run :command:`lunch` with no arguments to choose different build
   variants, and select a lunch target from a list of available options.
   For example, the following commands configure the build system to
   build the installer files for |C| in VM images with the traditional tablet UI:

   .. code-block:: bash

       $ lunch caas-userdebug
       $ make SPARSE_IMG=true flashfiles -j $(nproc)

   .. note::
      The *-j $(nproc)* argument instructs the builder to compile the source
      code with parallel tasks. The generated kernelflinger executables
      .ZIP file
      (:file:`out/target/product/caas/caas.flashfiles.eng.${USER}.zip`)
      is available after the build. You can refer to :ref:`caas-on-vm`
      section to prepare the host environment and boot the CiV image with QEMU.
      Or, follow :ref:`install-on-nuc` of this guide to flash the installer
      image to a removable USB drive and install |C| on an Intel platform.

Build |C| in Container with Android 9
*************************************

Download the source
===================

#. Enter the following commands to create an empty directory to hold the
   |C| source files and serve as the working directory, and to bring down the
   latest version of :command:`repo` tool, including its most recent fixes.

   .. note::
      The URL specifies the manifest that refers to various repositories
      used by |C|, which are placed within the working directory. For now, a
      :file:`.repo/` folder is created to store the manifest and the metadata of
      the source repositories.

   .. code-block:: bash

       $ mkdir cic
       $ cd cic
       $ repo init -u https://github.com/projectceladon/manifest -b celadon/p/mr0/master -m cic

#. Enter the following command to pull down the |C| Android source tree to
   your working directory. The :command:`repo sync` operation might take time
   depending on your Internet download speed. Refer to the
   `Downloading the Source <https://source.android.com/setup/build/downloading>`_
   section of the AOSP website for tips to download the source behind a
   proxy.

   .. code-block:: bash

       $ repo sync -c

.. _build-cic-package:

Build |C| in Container package
==============================

#. Optionally, delete existing output of any previous build with the
   following command in the top-most |C| source directory:

   .. code-block:: bash

       $ make clobber

#. Enter the following command to initialize the build variables with the
   :file:`envsetup.sh` script:

   .. code-block:: bash

       $ source build/envsetup.sh

#. Specify your |C| lunch target using the :command:`lunch` command. You can
   run :command:`lunch` with no arguments to choose different build
   variants, and select a lunch target from a list of available options.
   For example, the following commands configure the build system to
   build the package containing |C| in Container images with the traditional tablet UI:

   .. code-block:: bash

       $ lunch cic_dev-userdebug
       $ make cic -j $(nproc)

   .. note::
      The *-j $(nproc)* argument instructs the builder to compile the source
      code with parallel tasks. The generated CIC package
      (:file:`out/target/product/cic/cic-${USER}.tar.gz`)
      is available after the build. You can follow :ref:`deploy-cic-on-target` of
      this guide to deploy and start the CIC container on the target device.
