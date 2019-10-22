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

    $ mkdir -p ~/bin
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
           libelf-dev sbsigntool dosfstools mtools efitools \
           python-pystache git-lfs python3

|C| as a Service (**CaaS**) and |C| in Container (**CIC**) require `Docker <https://www.docker.com/>`_ to build the images. Install the following prerequisites prior the CaaS or CIC build:

.. code-block:: bash

    $ sudo apt-get install apt-transport-https ca-certificates curl

The following commands add the Docker's official GPG key, set up the repository, and install the Docker Engine - Community from the repository:

.. code-block:: bash

    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    $ sudo apt-get update
    $ sudo apt-get install -y docker-ce docker-ce-cli containerd.io

You may use Docker as a non-root user by adding your user ID to the **docker** group. Reference `Get Docker Engine - Community for Ubuntu <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_ installation guide for more detailed information.

.. code-block:: bash

    $ sudo usermod -aG docker $USER

Download the source
-------------------

Create an empty directory that will hold the |C| source files and serve as the working directory. Enter the following commands to bring down the latest version of ``repo`` tool, including its most recent fixes. The URL specifies the manifest that refers various repositories used by |C|, which are placed within the working directory. For now, a *.repo* folder is created to store the manifest and the metadata of the source repositories.

.. code-block:: bash

    $ mkdir celadon
    $ cd celadon
    $ repo init -u https://github.com/projectceladon/manifest.git

The master branch of |C| build is based on Google `Android 10 <https://www.android.com/android-10/>`_ Pre-Production Release. Use the following command to initialize your source tree with the Google `Android 9 Pie <https://www.android.com/versions/pie-9-0/>`_ code base:

.. code-block:: bash

    $ repo init -u https://github.com/projectceladon/manifest -b celadon/p/mr0/master -m default.xml

Enter the following command to pull down the |C| Android source tree to your working directory. The ``repo sync`` operation might take time depending on your Internet download speed. Reference the `Downloading the Source <https://source.android.com/setup/build/downloading>`_ section of the AOSP website for tips to download the source behind a proxy.

.. code-block:: bash

    $ repo sync

.. _build-os-image:

Build the OS image
------------------

Optionally, delete existing output of any previous build with the following command in the top-most |C| source directory:

.. code-block:: bash

    $ make clobber

Enter the following command to initialize the build variables with the *envsetup.sh* script:

.. code-block:: bash

    $ source build/envsetup.sh

Specify your |C| lunch target using the ``lunch`` command. You can run ``lunch`` with no arguments in order to choose different build variants, and select a lunch target from a list of available options. For example, the following command configures the build system for `Android 9 Pie <https://www.android.com/versions/pie-9-0/>`_ with the traditional tablet UI:

.. code-block:: bash

    $ lunch celadon-userdebug

The following command selects **celadon_ivi-userdebug** as the lunch target for building the `Android 10 <https://www.android.com/android-10/>`_ Pre-Production Release image with IVI UI:

.. code-block:: bash

    $ lunch celadon_ivi-userdebug

Instead, to :ref:`run-as-service`, use either **caas-userdebug** or **cic-userdebug** lunch targets as follows:

.. code-block:: bash

    $ lunch caas-userdebug

or

.. code-block:: bash

    $ lunch cic-userdebug

Build the |C| installer files with the following command. The *-j $(nproc)* argument instructs the builder to compile the source code with parallel tasks. The generated kernelflinger executables .ZIP file (**out/target/product/celadon/celadon.flashfiles.eng.${USER}.zip**) is available after the build. You can follow :ref:`install-on-nuc` of this guide to flash the installer image to a removable USB drive and install |C| on a |NUC|.

.. code-block:: bash

    $ make SPARSE_IMG=true flashfiles -j $(nproc)

.. note::
    In case of the CIC build, the generated image is packaged at the following location:
    **out/target/product/celadon/cic-${USER}.tar.gz**
