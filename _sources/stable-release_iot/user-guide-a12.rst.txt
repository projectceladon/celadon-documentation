.. _user-guide-a12:

User Guide
##########

System Requirements
*******************

Recommended system requirements for Host:

* CPU: 4 cores or more
* RAM: 8 GB or more
* Hard-Disk: 500 GB

How to install this release
***************************

Celadon build steps
===================

Follow the development environment set up instructions in
`<https://docs.01.org/celadon/getting-started/build-source.html#set-up-the-development-environment>`_ for |C| build host setup.

Manifest Link: https://github.com/projectceladon/manifest/blob/master/stable-build/CIV_02.22.04.50_A12.xml

Prerequisites and host kernel build steps:

Prerequisites

* Install Ubuntu 18.04 LTS
* If operating behind a corporate firewall, setup the proxy
  settings
* Install the following packages

.. code-block:: bash

	$ sudo apt install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison rsync kmod cpio

Host kernel build steps
=======================

Requirement:

* x86_64_defconfig [Make sure downloaded file is not html]
  Defconfig_link: https://github.com/projectceladon/vendor-intel-utils-vertical-iot/blob/main/x86_64_defconfig

.. code-block:: bash

	# Sync kernel
	# Note that this will pick up the latest on the branch
	$ git clone https://github.com/intel/linux-intel-lts.git

	# Change directory
	$ cd linux-intel-lts

	# Checkout to  specific commit (Refer to release notes for SHA ID)
	$ git checkout lts-v5.15.71-adl-linux-221121T044440Z

	$ cp x86_64_defconfig .config
	$ echo ""| make ARCH=x86_64 olddefconfig

	# Make kernel debian package
	$ make ARCH=x86_64 -j16 LOCALVERSION=-lts2021-iotg bindeb-pkg

        # To find output files
	$ find .. -name "*.deb"
        ../linux-image-5.15.71-lts2021-iotg-dbg_5.15.71-lts2021-iotg-1_amd64.deb
	../linux-headers-5.15.71-lts2021-iotg_5.15.71-lts2021-iotg-1_amd64.deb
	../linux-image-5.15.71-lts2021-iotg_5.15.71-lts2021-iotg-1_amd64.deb
	../linux-libc-dev_5.15.71-lts2021-iotg-1_amd64.deb

	# Copy built .deb packages to use during Installing Ubuntu host kernel
	$ cd ..
	$ cp *.deb <target path>

For Celadon Host OS hardening recommendations see:
https://github.com/projectceladon/celadon-documentation/blob/master/source/getting-started/host-os-hardening.rst


Build Celadon from Source
=========================

Celadon Source Requirements:

* CIV_02.22.04.50_A12.xml

.. code-block:: bash

	# Create symbolic link for Python if not already exists in ‘/usr/bin’ directory
	$ sudo ln -s /usr/bin/python3 /usr/bin/python

Steps to sync to this release:

.. code-block:: bash

	# Init with the default manifest
        $ mkdir <build_workspace>
        $ cd <build_workspace>
	$ repo init -u https://github.com/projectceladon/manifest.git

	# Copy the CIV manifest and use it
	$ cp <source path>/CIV_02.22.04.50_A12.xml .repo/manifests/
	$ repo init -u https://github.com/projectceladon/manifest.git -m CIV_02.22.04.50_A12.xml
        #NOTE : Manifest tag will change according to the latest release

	# Sync the code
	$ repo sync -c -q -j${nproc}
	$ repo for all -c git lfs pull

Step to generate the Android-CIV\* Image:

.. code-block:: bash

	# Perform the environment setup from directory where repo is initialized
	$ source build/envsetup.sh

	# Select userdebug variant
	$ lunch caas-userdebug

	# Start the build
	$ make flashfiles BASE_LTS2020_YOCTO_KERNEL=true -j $(nproc)


	# Build output (CIV flashfiles)
	$ find out/target/product/caas/ -name caas-releasefiles-*.zip
	out/target/product/caas/caas-releasefiles-xxxxx.zip


Change to the ADL target directory and copy caas-releasefiles-userdebug.tar.gz to the target director

DUT setup
*********

Hardware details:

* HW Alder Lake (ADL) DUT details
	* For ADL RVP DDR5 C1 CPU
	* BIOS Version ADLSFWI1.R00.3225.B00.2205270548

.. note::
	Every type of Guest VM configuration has a minimum required number of assigned cores/vCPUs.
	Not meeting minimum cores requirement will result in degraded performance

BIOS setting:

* Intel®(VMX) Virtualization Technology (Intel® VT)

  * Settings: Intel Advance Menu-> CPU Configurations
    Intel (VMX) Virtualization: Enabled

* Intel® Virtualization Technology (Intel® VT) for

  * Settings: Intel Advance Menu-> System Agent (SA) Configuration
    VT-d: Enabled

* SRIOV Enable

  * Settings: Intel Advance Menu-> System Agent (SA) Configuration -
    Graphics Configuration: Enabled

* Intel(R) TCC Mode

  * Settings: Intel Advance Menu-> Intel(R) Time Coordinated Computing
    TCC: Disabled

.. note::
	The menu structure may differ due to BIOS differences

Host setup
**********

Prerequisites:

Install Ubuntu 22.04 LTS:

* Download and install the Ubuntu 22.04 LTS from the official Ubuntu
  website: https://www.releases.ubuntu.com/22.04/ubuntu-22.04.1-desktop-amd64.iso
* If operating behind a corporate firewall, setup the proxy settings

Installation Scripts Required:

* sriov_patches.zip
* ubuntu_kvm_multios_scripts.zip
  From release package ADL link:
  https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=757435&s=Newest

Setup Ubuntu host:

* Set the default download server to “Main server” in “Software & Updates”
  GUI
* Go to Applications and launch “Software & Updates”, and in “Ubuntu
  Software” tab, select Download from: “Main server”

.. note::
	SRIOV related content available under NDA

.. code-block:: bash

	# Reboot into the Ubuntu host image
        # Change directory
	$ cd ~

	# Please use these commands to update and upgrade the Ubuntu with the latest software packages.
	$ sudo apt -y update
	$ sudo apt -y upgrade

	# Reboot the system
	$ sudo reboot now

	# Copy the artifact
	$ cd <workspace>
	$ cp <source path>/sriov_patches.zip .
	$ cp <source path>/ubuntu_kvm_multios_scripts.zip .

	# Extract files
	$ unzip sriov_patches.zip
	$ unzip -jo ubuntu_kvm_multios_scripts.zip


	# This will install kernel and firmware, and update grub
        # Copy .deb package generated in Host kernel build steps above
    	# If prompted, answer y to go ahead with changes
	$ sudo ./sriov_setup_kernel.sh

	# After rebooting, check that the kernel is the installed version.
        $ uname -r
	5.15.71-lts2021-iotg

Setup the Host OS for SRIOV
****************************
Perform the setup for Ubuntu OS. Please unzip to ``<workspace>`` directory

.. code-block:: bash

	# If prompted, answer y to go ahead with changes
	$ sudo ./sriov_setup_ubuntu.sh

	# Check if Host OS is running in SR-IOV PF mode
	$ dmesg | grep SR-IOV
		i915 0000:00:02.0: Running in SR-IOV PF mode
	# Check Host OS GuC and HuC Firmware Version
	$ dmesg | grep GuC
		i915 0000:00:02.0: [drm] GuC firmware i915/tgl_guc_70.bin version 70.5.1
		i915 0000:00:02.0: [drm] GuC submission enabled
	$ dmesg | grep HuC
		i915 0000:00:02.0: [drm] HuC firmware i915/tgl_huc.bin version 7.9.3
		i915 0000:00:02.0: [drm] HuC authenticated

.. note::
	If need to run any reliability or benchmark test,
	please run the commands below to disable auto suspend and hibernate on Ubuntu host

.. code-block:: bash

	# Disable suspend and hibernate service
	$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

	# Reboot Ubuntu host
	$ sudo reboot now

Android Guest VM Setup
**********************
Follow the development environment set up instructions in
`<https://docs.01.org/celadon/getting-started/build-source.html#set-up-the-development-environment>`_ for |C| build host setup.

Users of Celadon-in-VM (CIV) release must ensure that Celadon platform host OS hardening measures are in place to ensure that the host OS could be treated as part of the secure computing base. This is essential to ensuring CIV security could be trusted in CIV operations.

.. code-block:: bash

	# Copy the artifact
	$ cp caas-releasefiles-userdebug.tar.gz <workspace>

	# Extract files
	$ cd <workspace>
	$ tar xzvf caas-releasefiles-userdebug.tar.gz

	# Prepare setup_host.sh
	$ chmod +x ./scripts/setup_host.sh
	# Update the host
	# If prompted, answer ‘Y’ for all options to go ahead with changes
	$ sudo -E ./scripts/setup_host.sh

Create Android VM Image
=======================

Create Android CIV image for running as VM in ADL target

.. code-block:: bash

	# Change directory
	$ cd <workspace>
	# Generate CIV disk image from caas-flashfiles.
	# The script and flashfiles have already been extracted from caas-releasefiles-userdebug.tar.gz
	# Wait for "Flashing is completed" msg from script.
	$ sudo -E ./scripts/start_flash_usb.sh caas-flashfiles-<xxxxx>.zip --display-off

Running Android 12
******************

This section describes the steps to run Android 12 VM on the ADL platform

* VM Launch
  Launch Celadon Android Guest VM

.. code-block:: bash

	# Launch the Android CIV Guest VM
	$ sudo vm-manager -b civ-sriov

Guest VM Configuration Options
******************************

Android 12 Guest VM Memory and Number of CPUs
=============================================

Edit the memory and vcpu sections of the configuration ini file at ``<workspace>/.intel/.civ/civ-sriov.ini.``

.. code-block:: bash

	# Enable USB Devices in Guest VM
	# [memory]
	size=4G

	# [vcpu]
	num=4G

.. note::
	A passthrough device option can only be used once, because a device can be passed through to only one guest VM at a time.
	The passthrough is defined in the configuration ini file.

Android 12 guest VM USB device passthrough
==========================================

.. code-block:: bash

	# Find the PCI ID of the USB device
	$ $ lspci -nn -D | grep USB
		0000:00:14.0 USB controller [0c03]: Intel Corporation Device [8086:7ae0] (rev 11)
		0000:00:14.1 USB controller [0c03]: Intel Corporation Device [8086:7ae1] (rev 11)
		0000:05:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 NHI [Maple Ridge 4C 2020] [8086:1137]
		0000:07:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 USB Controller [Maple Ridge 4C 2020] [8086:1138]

	# Edit the passthrough section of the configuration ini file at /home/<user>/.intel/.civ
	# [passthrough]
	# Specify the PCIe ID of the device for the passthrough to guest, separate them with comma
        $ passthrough_pci=0000:00:14.0,0000:00:14.1,0000:05:00.0,0000:07:00.0,



Enable PCIe Wi-Fi Adapter Device in Guest VM
============================================

This section describes steps to enable PCIe

.. code-block:: bash

	$ lspci -nn -D | grep Wi-Fi
	0000:02:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6 AX210/AX211/AX411 160MHz [8086:2725] (rev 1a)
	# Then edit the passthrough section of the configuration ini file at /home/<user>/.intel/.civ.

.. note::
	A passthrough device option can only be used once, because a device can be passthrough to only 1 guest VM at a time
	For Android 12 guest VM, find the PCI ID of the Wi-Fi device

Enable logging for Android 12 Guest VM
======================================

This section describes steps to enable debug logging

.. code-block:: bash

	# Edit the extra section of the configuration ini file at /home/<user>/.intel/.civ.
	[extra]
	cmd=-chardev socket,id=ch0,path=/tmp/civ1-console,server=on,wait=off,logfile=/tmp/civ1_serial.log -serial chardev:ch0

	[passthrough]
	#specified the PCI id here if you want to passthrough it to guest, separate them with comma
	passthrough_pci=0000:02:00.0

	# Connect to Android 12 Guest VM console for any debugging
	# Connect to Celadon guest console
	$ sudo socat unix-connect:/tmp/civ1-console stdio

Launch Guest VM on Single Display and Full Screen Mode
======================================================

Edit the extra section of the configuration ini file at /home/<user>/.intel/.civ

.. code-block:: bash

	# different according to the use cases.
	[extra]
	cmd=-full-screen

.. note::
	The amount of memory and cores allocated might be different according to
	each platform.

Shutdown VMs and System
=======================

Shutdown Android VM via Android ADB connection

.. code-block:: bash

	# Connect via ADB from remote machine via host machine IP
	$ adb connect xxx.xxx.xxx.xxx
	# shutdown Android
	$ adb reboot -p

Acronyms and terms
******************

* Stable Releases (IoT) - IOTG overlay on top of Celadon

* CIV - Celadon in Virtual Machine

* ADL: ALDER LAKE

* GVT-d : Intel® Graphics Virtualization Technology -g (Intel® GVT-g):
  virtual graphics processing unit (vGPU) (multiple VMs to one physical GPU)

* SR-IOV: Single Root IO Virtualization

Helpful hints / related documents
*********************************

* If you plan to use Celadon in a product, please replace all the test keys
  under ``device/intel/build/testkeys/`` with your product key
* The release of this project will be signed by test keys; it's only a
  reference for our customer and we are not responsible for this. Customers
  should use their own keys to sign their release images
* Build Celadon in VM  https://projectceladon.github.io/celadon-documentation/getting-started/build-source.html
