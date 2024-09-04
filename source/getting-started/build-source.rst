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

* A 64-bit development workstation running Ubuntu\* 22.04 (Jammy Jellyfish)
  operating system.

* Python supported version is 3.6+. This is mainly to be inline with latest repo command released by Google.

* Around 350GB of free disk space on your workstation is required to
  checkout the source code and to store the build artifacts.

.. note::
   #. Although Android\* is typically built with a GNU/Linux\* or macOS\*
      operating system, we recommend you build |C| images on Ubuntu\* 22.04.
      For setup instructions using other operating systems, refer to the
      `Establishing a Build Environment <https://source.android.com/setup/build/initializing>`_ section on the AOSP website.
   #. Also, note the `Android prerequisites <https://source.android.com/setup/build/requirements>`_ for build.

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

#. Install the following required packages on your 64-bit Ubuntu 22.04 LTS
   development workstation prior to the compilation:

   .. code-block:: bash

      $ sudo apt-get update
      $ sudo apt-get install -y wget openjdk-8-jdk git ccache automake \
         lzop bison gperf build-essential zip curl \
         zlib1g-dev g++-multilib python3-networkx \
         libxml2-utils bzip2 libbz2-dev libbz2-1.0 \
         libghc-bzlib-dev squashfs-tools pngcrush \
         schedtool dpkg-dev liblz4-tool make optipng maven \
         libssl-dev bc bsdmainutils gettext python3-mako \
         libelf-dev sbsigntool dosfstools mtools efitools \
         python3-pystache git-lfs python-is-python3 flex clang libncurses5 \
         fakeroot ncurses-dev xz-utils cryptsetup-bin \
         apt-transport-https ca-certificates curl lsb-release \
         rsync vim python-six kmod \
         software-properties-common cpio python3-pip ninja-build \
         cutils cmake pkg-config xorriso mtools libjson-c-dev file

      $ sudo pip3 install meson==0.60.0 mako==1.1.0 dataclasses pycryptodome ply==3.11

Build |C| in VM with Android 15
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

   Note, the below :command:`repo init` command pulls the latest development
   CiV source code based on *Android 15* from the master branch.

   .. code-block:: bash

       $ repo init -u https://github.com/projectceladon/manifest -b master -m default.xml

   To continue working on the *Android 14* based CiV source code,
   use the following manifest instead:

   .. code-block:: bash

       $ repo init -u https://github.com/projectceladon/manifest -b celadon/u/mr0/master

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
        
       $ lunch caas-userdebug # this will be used until Android 14 
       $ lunch caas-ap3a-userdebug # this is used for Android 15 onwards
       $ make flashfiles -j $(nproc)

   .. note::
         The *-j $(nproc)* argument instructs the builder to compile the source
         code with parallel tasks. The generated kernelflinger executables
         .ZIP file
         (:file:`out/target/product/caas/caas-flashfiles-eng.${USER}.zip`
         and :file:`out/target/product/caas/caas-flashfiles-eng.${USER}.iso.zip`)
         is available after the build. You can refer to :ref:`caas-on-vm`
         section to prepare the host environment and boot the CiV image with QEMU.


.. _ Intel® Advanced Vector Extensions (Intel® AVX):    https://en.wikipedia.org/wiki/Advanced_Vector_Extensions#Advanced_Vector_Extensions
.. _Intel® Advanced Vector Extensions 2 (Intel® AVX2):   https://en.wikipedia.org/wiki/Advanced_Vector_Extensions#Advanced_Vector_Extensions_2
.. _Comet Lake: https://en.wikipedia.org/wiki/Comet_Lake
