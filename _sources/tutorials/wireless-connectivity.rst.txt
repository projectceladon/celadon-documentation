.. _wireless-connectivity:

Wireless Connectivity in Celadon
################################

This section explains the connectivity module of Celadon, which contains
details about Bluetooth and Wi-Fi wireless technologies and usage in
Celadon.

Connectivity module interaction is different depending on the Celadon
use case such as bare metal, CiV Linux desktop applications to provide
Android application support, or Celadon in VM. With CiV, the guest
Android instance takes complete control of the host Bluetooth/Wi-Fi
hardware, which is known to be the passthrough solution for CiV. This
section explains the Bluetooth/Wi-Fi bare metal solution and the CiV
solution, with passthrough mode.

Celadon guide for Bluetooth
***************************

This section explains Bluetooth usage in Celadon.

Bluetooth overview
==================

Bluetooth is wireless communication technology that has existed since
the early 2000s. Using this, we can transmit data over distances ranging
from 10-100 meters. It has many applications in real world scenarios,
such as music streaming (A2DP), call audio streaming (HFP), and object
exchange (OBEX).

In Android, Bluetooth support is implemented in Android frameworks and
the Linux Kernel. The framework contains the Fluoride stack. The Linux
kernel has the core protocol implementations of RFCOMM, BNEP, HCI, and
SCO.

For releases of Android, from T onwards, Bluetooth has been moved from
the mainline and is delivered as an apex package. It also introduces
implementations of various LE audio profiles specific to unicast support
only.

Bluetooth usage in CiV
======================

.. figure:: images/cs005-images/cs005-f1-bt-android.png
   :width: 4.04167in
   :height: 4.33224in

Figure 1: Bluetooth Android Stack and Host Interaction Architecture

Bluetooth support has been integrated into recent Intel Wi-Fi chips. In
ADL, the Network Interface Card (NIC) used is AX211, which has an
integrated Bluetooth driver and supports Bluetooth Version 5.3. In Tiger
Lake and Alder Lake NUCs, Bluetooth is loaded as a USB interface.

Celadon (Android) runs on top of the host OS (Ubuntu). The host kernel
loads Bluetooth as a USB interface (hci0). Android cannot use this
interface directly as the host has loaded it and using it. So, Android
Bluetooth will not work. Figure 1 explains the Celadon in VM architecture
with respect to Bluetooth.

Enabling Bluetooth in CiV
*************************

To make Bluetooth work in Android, we need to manually bring down the
Bluetooth USB interface (hci0) and then passthrough the hci0 interface
to the guest (Android). Here we need to additionally passthrough the
network controller with Bluetooth integrated inside it. Follow the steps
below to passthrough the interfaces to guest.

#. Execute this command on the host:

   .. code-block:: bash

      #> lspci

#. Record the PCI address of the network controller and USB controller.

   .. code-block:: bash

      0000:00:14.0 USB controller: Intel Corporation Device 51ed (rev 01)
      0000:00:14.2 RAM memory: Intel Corporation Device 51ef (rev 01)
      0000:00:14.3 Network controller: Intel Corporation Device 51f0 (rev 01)

#. Add these PCI addresses in :file:`~/.intel/.civ/civ-1.ini`, under
   the passthrough section.

   .. code-block:: bash

      [passthrough]
      #specified the PCI id here if you want to passthrough it to guest, separate them with comma
      passthrough_pci=0000:00:14.3,0000:00:14.0


#. Check the Bluetooth USB interface name; in our example, it is hci0.

   .. figure:: images/cs005-images/cs005-ex3.png
      :width: 4.32996in
      :height: 2.37500in

#. Set the Bluetooth USB interface (hci0) interface down on host.

   .. figure:: images/cs005-images/cs005-ex4.png
      :width: 4.35417in
      :height: 1.62630in


#. Launch CiV using vm-manager.

   .. code-block:: bash

      #> sudo vm-manager -b civ-1

You can see Bluetooth is turned on in Android (CiV).

Debugging tips
**************

If audio over Bluetooth (A2DP) is not working, follow the steps below
to make it work.

#. Record the audio controller PCI address.

   .. figure:: images/cs005-images/cs005-ex5.png
      :width: 6.50000in
      :height: 0.20625in


#. Add it in :file:`~/.intel/.civ/civ-1.ini`, under passthrough section.

   .. figure:: images/cs005-images/cs005-ex6.png
      :width: 6.50000in
      :height: 0.45903in


#. Launch CiV using vm-manager

   .. code-block:: bash

      #> sudo vm-manager -b civ-1

Check this link for efficient debugging.
https://source.android.com/docs/core/connect/bluetooth/verifying_debugging

Celadon guide for Wi-Fi
***********************

This section introduces the basics of Wi-Fi architecture in Android and
its usage in Celadon in BM and VM.

.. figure:: images/cs005-images/cs005-f2-android-wi-fi-arch.png
   :width: 6.30888in
   :height: 5.00877in

Figure 2: Android Wi-Fi architecture

Figure 2 details the Wi-Fi architectural flow in the Android stack and
is taken from
https://source.android.com/docs/core/connect/wifi-overview. The same
architectural flow is used in Celadon, whereas the “vendor
implementations and driver” and “Interfaces” layers vary from vendor to
vendor. A major part of the Wi-Fi stack implementation resides in the
kernel. The wpa-supplicant and hostapd modules in userspace manage the
stack usage through various netlink commands via nl80211 socket. Figure
2 depicts the control flow.

The complete guest-to-host communication for interacting with the phyX
interface over PCi passthrough mode is shown in the Figure 2. From the
Wi-Fi HAL layer, communication passes to the Wi-Fi drivers via
wpa\_supplicant and hostapd through the nl80211 net-link socket, as
shown in Figure 3.

.. figure:: images/cs005-images/cs005-f3-comm-passes.png
   :width: 4.46667in
   :height: 6.46667in

Figure 3: Communication passes to the Wi-Fi drivers

As soon as the vm-manager detects it, Wi-Fi is set to passthrough. The
virtio client on the guest kernel communicates to the KVM running on the
host kernel to set the control passthrough via VFIO PCI to the physical
interface.

Wi-Fi enablement in CiV
=======================

The PCI passthrough information is retrieved from the vm-manager .ini
file placed under :file:`*~/.intel/.civ/<vm-name>.ini*`. In this .ini
file, the PCi addresses mentioned under ``pci_passthrough`` are considered
to be passthrough technologies to the host (unless they are of same iommu
group).

Get PCI address of Wi-Fi
------------------------

Run the :command:`lspci` command shown below to request the verbose output
of all the devices connected over the PCI bus.

.. code-block:: bash

   $lspci -vvxxx

From the output of the :command:`lspci` command, parse the PCI ID that
connects to the Network Controller. In this example, it is “0000:00:14.3”
that runs the kernel module. :envvar:`iwlwifi` is the Intel driver for Wi-Fi.

.. figure:: images/cs005-images/cs005-ex7.png
   :width: 5.68333in
   :height: 1.50903in


Now edit the .ini file located in the ``pci_passthrough`` section, and add
the entry shown above to set Wi-Fi as PCI passthrough. In the example
shown below, the passthrough option is added for both Bluetooth and
Wi-Fi.

.. figure:: images/cs005-images/cs005-ex8.png
   :width: 5.71667in
   :height: 0.51181in

Save the file. Then launch the vm-manager by executing the command
below.

.. code-block:: bash

   sudo vm-manager -b <vm-name>

Debugging tips
--------------

If Wi-Fi does not come up after adding the correct PCI passthrough
option, use the tips below to debug your configuration.

- The passthrough options provided could be within the same iommu
  group. To prevent this, check the host prior to adding the PCI
  passthrough option in the .ini file. Check the `dmesg` output on the
  host with the filter shown below to check the iommu group.

  .. code-block:: bash

     $ dmesg | grep “IOMMU”

  .. figure:: images/cs005-images/cs005-ex9.png
     :width: 4.65000in
     :height: 3.08311in

  In the sample output, devices in the same iommu group can’t be made
  passthrough together.

- Firmware load failure. To check if the problem is being caused by a
  firmware download failure, run :command:`dmesg | grep iwl` to filter the
  dmesg and check the below log for firmware download
  status.

  .. figure:: images/cs005-images/cs005-ex10.png
     :width: 5.25000in
     :height: 0.20136in

- In case the expected firmware version download fails, it should fall
  back to the default firmware version and successfully load the
  firmware.

- In case the firmware load itself fails, it won’t proceed for driver
  initialization and the phy interface will not be generated. If the
  issue still persists, download the correct firmware from the git
  repo:

  https://kernel.googlesource.com/pub/scm/linux/kernel/git/firmware/linux-firmware

- To get detailed Wi-Fi driver information, use the commands shown
  below:

  - :command:`lspci` with –v or -kkk option

  - :command:`iwconfig` (to check the iwd daemon configuration)

  - :command:`lshw -C network` (check the NIC ownership)

  - :command:`iw list` for driver and controller supported features


