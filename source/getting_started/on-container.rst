.. _caas-on-container:

Run |C| in Container
====================

Introduction
------------

The goal of **Celadon in Container (CIC)** feature is to run the |C| Android image in a Docker container, so that you can run the image on Linux devices through Docker tools, and run Android applications in it.

CIC should be able to run on modern PCs with Intel® processors which have Intel 6th Generation or later GPU integrated. The |NUC| model `NUC7i7BNH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc7i7bnh.html>`_ and model `NUC7i5BNH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc7i5bnh.html>`_ are recommended to try out the CIC features.

.. note::
   The CIC is currently of Version 0.5, whcih provides a preview of the feature for pilot and development purposes. Some features such as Trusty, Verified Boot, and OTA update are not included in this preview version. Those features is planned for the upcoming releases.

Set up Docker Engine
--------------------

You need to install Docker on both the development host and the target device. Enter the following commands to install the prerequisites, set up the repository, and install the Docker Engine. Reference `Get Docker Engine - Community for Ubuntu <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_ installation guide for more detailed information.

.. code-block:: bash

    $ sudo apt-get install apt-transport-https ca-certificates curl
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    $ sudo apt-get update
    $ sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    $ sudo usermod -aG docker $USER

The last command is optional if you want to run the Docker as a non-root user.

On the target device, CIC currently requires Linux kernel version 4.14.20 or later, which is available in most Linux distributions such as Clear Linux, Rancher OS, and Ubuntu Linux, etc. The previous setup instructions are based on Ubuntu 16.04 LTS distribution.

Build the CIC Package
---------------------

Reference the :ref:`build-from-source` section in the Getting Started Guide to set up the |C| source tree and the build environment. There are two build targets associated with the CIC builds:

    **cic**
        target to compliant with Android CDD

    **cic_dev**
        target for development purposes (available on the CIC branch of the |C| Android-P release)

The following commands select **cic-userdebug** as the lunch target and start the build. The CIC package will be generated at **out/target/product/celadon/cic-${USER}.tar.gz**.

.. code-block:: bash

    $ source build/envsetup.sh
    $ lunch cic-userdebug
    $ make cic -j $(nproc)

Deploy on Target
----------------

After completely building the code, download and extract the CIC package on the target device, and then install and start the software by using the ``aic`` script as follows:

.. code-block:: bash

    $ ./aic install
    $ ./aic start

A window will be pop-up showing Android is booting after the CIC container is initialized and running. You can stop the CIC with the following command:

.. code-block:: bash

    $ ./aic stop

Or uninstall the software:

.. code-block:: bash

    $ ./aic uninstall

.. note::
   CIC runs as a Docker container, as a result, you can use `Docker CLI commands <https://docs.docker.com/engine/reference/commandline/cli>`_ directly for debugging. For example, if you encounter issues, you can capture necessary information by the following commands:

   .. code-block:: bash

      $ docker logs aic-manager 2>&1 | tee aic-manager.log
      $ docker exec -it android0 sh | tee android.log
      # run commands to get information, such as
           getprop
           logcat -b all
