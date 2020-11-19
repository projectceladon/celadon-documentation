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

* A 64-bit development workstation running Ubuntu\* 18.04 (Bionic Beaver)
  operating system.

* One of the supported versions of python\*, either 2.7 or 3.5.6, with
  python 2.7 as the default.

* Around 350GB of free disk space on your workstation is required to 
  checkout the source code and to store the build artifacts.

.. note:: 
   Although Android\* is typically built with a GNU/Linux\* or macOS\*
   operating system, we recommend you build |C| images on Ubuntu\* 18.04.
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
   development workstation prior to the compilation:

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
            python-pystache git-lfs python3 flex clang

#. Both :abbr:`CiV (Celadon in VM)` and :abbr:`CiC (Celadon in Container)`
   require `Docker <https://www.docker.com/>`_ to build the images.
   The following instructions install Docker\* on your Ubuntu development
   workstation:

   a) Install the following packages before performing the CiV or CiC build:

   .. code-block:: bash

       $ sudo apt-get install apt-transport-https ca-certificates curl

   b) Run the following commands to add the Docker's official GPG key, set
      up the repository, and install the *Docker Engine - Community* from the
      repository:

   .. code-block:: bash

       $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
       $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
       $ sudo apt-get update
       $ sudo apt-get install -y docker-ce docker-ce-cli containerd.io

   c) You may run Docker as a non-root user by adding your user ID to the
      **docker** group. For more information, refer to the
      `Get Docker Engine - Community for Ubuntu <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_ installation guide.

   .. code-block:: bash
   
       $ sudo usermod -aG docker $USER

Build |C| in VM with Android 11
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
       $ repo init -u https://github.com/projectceladon/manifest -b master -m default.xml

   Note, the last :command:`repo init` command pulls the latest development
   CiV source code based on *Android 11* from the master branch.
   To continue working on the *Android 10* based CiV source code,
   use the following manifest instead:

   .. code-block:: bash

       $ repo init -u https://github.com/projectceladon/manifest  -b celadon/q/mr0/stable -m default.xml

   You can also checkout the source code
   of the `QMR0 March-31-2020`_ release that passed the *Platform Exit*
   criteria with the following command:

   .. _QMR0 March-31-2020: https://01.org/projectceladon/documentation/release-notes#civ-01-20-01-12-a10

   .. code-block:: bash

       $ repo init -u https://github.com/projectceladon/manifest -b celadon/master/2020q1 -m default.xml

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
   build the installer files for |C| in VM images:

   .. code-block:: bash

       $ lunch caas-userdebug
       $ make BUILD_CPU_ARCH=kabylake flashfiles -j $(nproc)

   .. note::
      #. The *-j $(nproc)* argument instructs the builder to compile the source
         code with parallel tasks. The generated kernelflinger executables
         .ZIP file
         (:file:`out/target/product/caas/caas-flashfiles-eng.${USER}.zip`)
         is available after the build. You can refer to :ref:`caas-on-vm`
         section to prepare the host environment and boot the CiV image with QEMU.
      #. The ':makevar:`BUILD_CPU_ARCH`' variable instructs the builder to
         generate images that leverage `AVX`_ and `AVX2`_ instructions on
         the target device. It's recommended to specify ':makevar:`BUILD_CPU_ARCH=kabylake`'
         while building the images for `Comet Lake`_ platform.

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

   Note, the last :command:`repo init` command pulls the latest development
   CiC source code from the the *master* branch. To checkout the source code of
   the `PMR0 March-31-2020`_ release that passed the *Platform Exit*
   criteria, run the following command instead:

   .. _PMR0 March-31-2020: https://01.org/projectceladon/documentation/release-notes#cic-01-20-01-12-a09

   .. code-block:: bash

       $ repo init -u https://github.com/projectceladon/manifest -b celadon/p/mr0/2020q1 -m cic

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
   build the package containing |C| in Container images:

   .. code-block:: bash

       $ lunch cic-userdebug
       $ make cic -j $(nproc)

   .. note::
      The *-j $(nproc)* argument instructs the builder to compile the source
      code with parallel tasks. The generated CiC package
      (:file:`out/target/product/cic/cic-aic-eng.${USER}.<time code>.tar.gz`)
      is available after the build. You can follow :ref:`deploy-cic-on-target` of
      this guide to deploy and start the CiC container on the target device.

.. _AVX:    https://en.wikipedia.org/wiki/Advanced_Vector_Extensions#Advanced_Vector_Extensions
.. _AVX2:   https://en.wikipedia.org/wiki/Advanced_Vector_Extensions#Advanced_Vector_Extensions_2
.. _Comet Lake: https://en.wikipedia.org/wiki/Comet_Lake
