.. _caas-on-container:

Run |C| in Container
####################

This page explains how to run the |C| Android\* image in a Docker\*
container.

.. contents::
   :local:
   :depth: 1

Description
***********

The goal of the :abbr:`CIC (Celadon in Container)` feature is to run the |C|
Android image in a Docker container, so that you can run the image on Linux\*
devices through Docker tools, and run Android applications in it.

CIC should be able to run on modern PCs with 6th generation or later Intel®
Architecture Processors with integrated GPU. The |NUC| model `NUC7i7BNH`_
and model `NUC7i5BNH`_ are recommended to try out the CIC features.

.. note::
   The current version of CIC is 0.5, which provides a preview of the feature for pilot and development purposes. Some features such as Trusty, Verified Boot, and the OTA update do not exist in this preview version. We plan for these features in upcoming releases.

Set up Docker Engine
********************

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

   The last command is optional if you want to run the Docker as a non-root
   user.

#. Restart your session for changes to take effect.

On the target device, CIC currently requires Linux\* kernel version 4.14.20 or later, which is available in most Linux distributions such as Clear Linux, Rancher OS, and Ubuntu Linux. The setup instructions previously listed are based on Ubuntu 16.04 LTS distribution.

Build the CIC Package
*********************

#. Refer to the :ref:`build-from-source` section in the Getting Started
   Guide to set up the |C| source tree and the build environment. There are
   two build targets associated with the CIC builds:

   cic
      target to compliant with Android CDD

    cic_dev
      target for development purposes (available on the CIC branch of the |C|
      Android-P release)

#. Run the following commands to select **cic-userdebug** as the lunch
   target and start the build. The CIC package generates at
   :file:`$OUT/$TARGET_PRODUCT-*.tar.gz`.

   .. code-block:: bash

      $ source build/envsetup.sh
      $ lunch cic-userdebug
      $ make cic -j $(nproc)

Deploy on Target
****************

#. After completely building the code, download and extract the CIC package
   on the target device, and then install and start the software by using
   the :file:`aic` script as follows:

   .. code-block:: bash

      $ ./aic install
      $ ./aic start

#. After the CIC container initializes and runs, a window pops up to
   show Android booting. You can stop the CIC by entering the following
   command:

   .. code-block:: bash

       $ ./aic stop

   Or uninstall the software:

   .. code-block:: bash

       $ ./aic uninstall

   .. note::
      CIC runs as a Docker container, as a result, you can use
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

.. _Get Docker Engine - Community for Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/

.. _Docker CLI commands: https://docs.docker.com/engine/reference/commandline/cli
