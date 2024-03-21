.. _debug-android-host:

Making the Android Host Debuggable - ADB for x86 Android Solutions
##################################################################

This tutorial provides an overview of the :abbr:`DBC (USB Debug Class)`
infrastructure followed by the steps to enable the feature on |C| and
seamlessly run :command:`adb` over a USB Type-A port.


.. contents::
    :depth: 2
    :local:

Description
***********

The Android host ecosystem consists of new applications like Android
Automotive, Chromebook, or gateways running on |NUC|-like systems. A
significant challenge with these Android host solutions is the lack of USB
Device mode because most of x86 platforms are USB host systems. The DBC
addresses this issue and allows a :abbr:`DUT (Device Under Test)` with
debug host x86 platforms to provide an infrastructure that offers a
back-to-back connection using an USB Debug Class infrastructure.


DBC Overview
************

The :abbr:`xDBC (USB Debug Capability)` provides the :abbr:`xHCI (Extensible
Host Controller Interface)`. The universal serial bus is a host-controlled
bus. The Host Controller is the hardware that manages the USB bus and USB
host ports. It initiates and manages all USB transfers. The xHCI is a
register-level interface providing a mechanism that allows the
:abbr:`xHC (Host Controller)` to communicate with the operating system of the
host computer. In addition to exposing register interfaces that are essential
for the xHC to function properly, xHCI supports many extended capabilities,
which can be optionally implemented by xHC.

xHCI includes extended power management capability, I/O virtualization
capability, and USB legacy support capability, among many others. xDBC is one
of the main extended capabilities supported by xHCI.

This functionality enables low-level system debug over USB. The xHCI provides
a means of connecting a debug host and a debug target. This is achieved
by emulating a debug device by using xDBC on the debug target. The debug
device presented by the debug target can be used by the debug host for
low-level system debugging of the target.

GitHub PRs to enable adb over DbC for |C| KBL NUC
=================================================

#. `Kernel and adb changes <https://github.com/projectceladon/vendor-intel-utils/pull/291>`_
#. `Adding android property to switch between adb over DWC and DBC <https://github.com/projectceladon/device-androidia-mixins/pull/274>`_
#. `Adding sepolicy to access DbC RAW device node <https://github.com/projectceladon/device-androidia/pull/416>`_

Steps to enable ADB over DbC support in Host Machine
====================================================

#. Add the following permission to the udev rule
   :file:`/etc/udev/rules.d/51-android.rules` (create the file if it does
   not exist):

    .. code-block:: text

        #DBC
        SUBSYSTEM=="usb", ATTRS{idVendor}=="1d6b", ATTRS{idProduct}=="0010", MODE="0666", GROUP="plugdev", SYMLINK+="android%n"

#. Reboot the host system, or run the following commands with root
   permission to take effect:

    .. code-block:: bash

        root@intel:~# udevadm control --reload-rules
        root@intel:~# udevadm trigger

#. Rename or remove the kernel module :command:`usb_debug.ko` in the host
   system if any:

    .. code-block:: bash

        root@intel:~# cd /lib/modules/$(uname -r)/kernel/drivers/usb/serial/ && mv usb_debug.ko usbdebug

#. Check if the :command:`usb_debug` driver module is loaded to the kernel
   with the following command:

    .. code-block:: bash

        root@intel:~# lsmod | grep usb_debug

#. Unload the :command:`usb_debug` driver module if it is loaded:

    .. code-block:: bash

        root@intel:~# rmmod usb_debug

#. The :command:`adb` command installed by the Android SDK does not support
   ADB over DbC, you should use the :command:`adb` command built from the |C|
   source tree. The ADB over DbC-enabled :command:`adb` command is avaiable
   in the :file:`out/host/linux-x86/bin/` folder after the build.

Steps to enable ADB over DbC support on |NUC| BLKNUC7iDNHE system
=================================================================

#. Check the Android property value
   :envvar:`persist.vendor.sys.usb.adbover` with the following command. The
   default value is :envvar:`dwc`, which represents normal ADB over USB (DWC).

    .. code-block:: bash

        root@intel:~# getprop persist.vendor.sys.usb.adbover
        dwc

#. Reset the property value to :envvar:`dbc`, then reboot the target system.

    .. code-block:: bash

        root@intel:~# setprop persist.vendor.sys.usb.adbover dbc

Connect the Target to the Host System
=====================================

Plug the debug Target into the Host system using a `USB Type-A to Type-A (3.0)
SuperSpeed Debug cable <https://www.datapro.net/products/usb-3-0-super-speed-
-a-debugging-cable.html>`_.
A USB 2.0 Type-A to Type-A cable does not work in this case.

At this point the target should have enumerated as a Debug Device on the
Host. This can be confirmed with the following command:

    .. code-block:: bash

        root@intel:~# lsusb -t
        /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/10p, 5000M
            |__ Port 4: Dev 31, If 0, Class=Diagnostic, Driver=usbfs, 5000M

        root@intel:~# cat /sys/kernel/debug/usb/devices
        T:  Bus=02 Lev=01 Prnt=01 Port=03 Cnt=01 Dev#= 31 Spd=5000 MxCh= 0
        D:  Ver= 3.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
        P:  Vendor=1d6b ProdID=0010 Rev= 0.10
        S:  Manufacturer=Linux Foundation
        S:  Product=Linux USB Debug Target
        S:  SerialNumber=DW1724778700007
        C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=  0mA
        I:* If#= 0 Alt= 0 #EPs= 2 Cls=dc(unk. ) Sub=02 Prot=01 Driver=usbfs
        E:  Ad=01(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
        E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms

.. Note:: :envvar:`Speed` should be *5000* (i.e. :envvar:`Spd=5000`) and
   :envvar:`Driver` should be *usbfs* (i.e. :envvar:`Driver=usbfs`) in the
   previous command output.

ADB detection in Host Machine
=============================

    .. code-block:: bash

        root@intel:/home/prabhatc/Desktop# ./adb devices
        List of devices attached
        * daemon not running. starting it now on port 5037 *
        * daemon started successfully *
        DW1724778700007 device

Steps to switch back to normal ADB over USB (DWC)
=================================================

#. Check the Android property value :envvar:`persist.vendor.sys.usb.adbover`
   with the following command.

    .. code-block:: bash

        root@intel:~# getprop persist.vendor.sys.usb.adbover
        dbc

#. Reset the property value to :envvar:`dwc`, then reboot the target system.

    .. code-block:: bash

        root@intel:~# setprop persist.vendor.sys.usb.adbover dwc

ADB over DbC throughput test result
-----------------------------------

- Achieved 28.0 MB/s (1073741824 bytes in 36.528s) for pulling 1GB file.
- Achieved 27.0 MB/s (1073741824 bytes in 37.860s) for pushing 1GB file.

Conclusion
**********

DbC is an ideal choice for platforms that don't have a USB device controller IP
and require debugging support. If a platform uses a dedicated USB device
controller for just debugging support, it can be replaced with DbC. DbC is
a dependable debugging solution, which is critical for early platform bring-
up where there is limited BIOS support etc.

References
**********

DBC CAP Blog

    https://www.kernel.org/doc/html/v5.0/driver-api/usb/usb3-debug-port.html

XHCI Spec

    https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
