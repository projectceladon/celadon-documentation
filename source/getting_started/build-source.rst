.. _build-from-source:

Build |C| from source
=====================

System requirements
-------------------

Though Android is typically built with a GNU/Linux or Mac OS operating system, we recommend you build the |C| images on a 64-bit development workstation running the Ubuntu 16.04 (Xenial Xerus) operating system. In addition, ensure your system has at least 150GB of free disk space to checkout the source code and to store the build artifacts. Please reference the `Establishing a Build Environment <https://source.android.com/setup/build/initializing>`_ section on the AOSP website for setup instructions using other operating systems.

Set up the development environment
----------------------------------

|C| and Android source code consist of multiple Git repositories and ``repo`` is the tool that makes it easier to work with those repositories as a whole. Create a local *bin/* directory, download the ``repo`` tool to that directory, and allow the binary executable with the following commands:

.. code-block:: bash

    $ make -p ~/bin
    $ curl https://storage.googleapis.com/git-repo-downloads/repo >  ~/bin/repo
    $ chmod a+x ~/bin/repo
    $ export PATH=~/bin:$PATH

In addition, you are required to install the following packages on your 64-bit Ubuntu 16.04 LTS development workstation prior the build:

.. code-block:: bash

    $ sudo apt-get update
    $ sudo apt-get install openjdk-8-jdk git ccache automake \
           lzop bison gperf build-essential zip curl \
           zlib1g-dev g++-multilib python-networkx \
           libxml2-utils bzip2 libbz2-dev libbz2-1.0 \
           libghc-bzlib-dev squashfs-tools pngcrush \
           schedtool dpkg-dev liblz4-tool make optipng maven \
           libssl-dev bc bsdmainutils gettext python-mako \
           libelf-dev sbsigntool dosfstools mtools

Download the source
-------------------

Create an empty directory that will hold the |C| source files and serve as the working directory. Enter the following commands to bring down the latest version of ``repo`` tool, including its most recent fixes. The URL specifies the manifest that refers various repositories used by |C|, which are placed within the working directory. For now, a *.repo* folder is created to store the manifest and the metadata of the source repositories.

.. code-block:: bash

    $ mkdir celadon
    $ cd celadon
    $ repo init -u https://github.com/projectceladon/manifest.git

Enter the following command to pull down the |C| Android source tree to your working directory. The ``repo sync`` operation might take time depending on your Internet download speed. Reference the `Downloading the Source <https://source.android.com/setup/build/downloading>`_ section of the AOSP website for tips to download the source behind a proxy.

.. code-block:: bash

    $ repo sync

Build the OS image
------------------

Optionally, delete existing output of any previous build with the following command in the top-most |C| source directory:

.. code-block:: bash

    $ make clobber

Enter the following commands to initialize the build variables with the *envsetup.sh* script and to select the |C| build target. You can run ``lunch`` with no arguments in order to choose different build variants.

.. code-block:: bash

    $ source build/envsetup.sh
    $ lunch celadon-userdebug

Build the |C| installer image with the following command. Replace the *$(proc)* argument with the number of processor threads on your workstation in order to build the source code with parallel tasks. The generated image is available at **out/target/product/celadon/celadon.img** after the build. You can follow :ref:`install-on-nuc` of this guide to flash the installer image to a removable USB drive and install |C| on a |NUC|.

.. code-block:: bash

    $ make SPARSE_IMG=true project_celadon-efi -j $(nproc)
