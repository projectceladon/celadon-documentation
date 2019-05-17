Making Android Host Debuggable - ADB for x86 Android Solutions
==============================================================

Table of Contents
#################

.. contents::
    :depth: 2
    :local:

Introduction
------------

Android Host ecosystem consists of new applications like Android Automotive,
Chromebook, or gateway running on |NUC| like systems. A significant
challenge in these Android host solutions is the lack of USB Device mode as
most of x86 platforms are USB host systems. To address this issue, and to allow
a DUT with Debug Host x86 platforms provide an infrastructure that offers
a back-to-back connection using an USB Debug Class infra structure.
This blog provides an overview of the *USB Debug Class* infra (DbC), followed
by the steps to enable the feature on |C| and seamlessly run ``adb`` over a
USB Type-A port.

DBC Overview
------------

*xDBC* stands for the USB Debug capability, provided an extensible Host Controller
Interface. The Universal Serial Bus is a host controlled bus. Host Controller is
the hardware whose functionality is to manage USB bus and USB host ports. It is
responsible for initiating and managing all USB transfers. *Extensible Host
Controller Interface (xHCI)* is a register-level interface that provides a
mechanism that allows the host controller (xHC) to communicate with the Operating
System of the host computer. In addition to exposing register interfaces essential
for proper functioning of the xHC, xHCI supports many extended capabilities,
which can be optionally implemented by xHC.

It includes Extended Power Management Capability, I/O Virtualization capability,
USB Legacy support capability among many others. USB Debug Capability is one of
the main extended capabilities supported by xHCI.

This functionality enables low-level system debug over USB. The xHCI debug
capabilities (xDBC) provides a means of connecting two systems where one system
is a Debug Host and the other is a Debug target. This is achieved through emulating
a debug device by using xDBC on the debug target. The debug device presented by the
debug target can be used by debug host for low level system debugging of target.

GitHub PRs to enable adb over DbC for |C| KBL NUC
-------------------------------------------------

#. `Kernel and adb changes <https://github.com/projectceladon/vendor-intel-utils/pull/291>`_
#. `Adding android property to switch between adb over DWC and DBC <https://github.com/projectceladon/device-androidia-mixins/pull/274>`_
#. `Adding sepolicy to access DbC RAW device node <https://github.com/projectceladon/device-androidia/pull/416>`_

Steps to enable ADB over DbC support in Host Machine
----------------------------------------------------

#. Add the following permission to the udev rule */etc/udev/rules.d/51-android.rules* (create the file if it does not exist):

    .. code-block:: text

        #DBC
        SUBSYSTEM=="usb", ATTRS{idVendor}=="1d6b", ATTRS{idProduct}=="0010", MODE="0666", GROUP="plugdev", SYMLINK+="android%n"

#. Reboot the host system, or run the following commands with root permission to take effect:

    .. code-block:: bash

        root@intel:~# udevadm control --reload-rules
        root@intel:~# udevadm trigger

#. Rename or remove the kernel module *usb_debug.ko* in the host system if any:

    .. code-block:: bash

        root@intel:~# cd /lib/modules/$(uname -r)/kernel/drivers/usb/serial/ && mv usb_debug.ko usbdebug

#. Check if the *usb_debug* driver module is loaded to the kernel with the following command:

    .. code-block:: bash

        root@intel:~# lsmod | grep usb_debug

#. Unload the *usb_debug* driver module if it is loaded:

    .. code-block:: bash

        root@intel:~# rmmod usb_debug

#. The ``adb`` command installed by the Android SDK does not support ADB over DbC, you should use the ``adb`` command built from the |C| source tree. The ADB over DbC enabled ``adb`` command is avaiable in the *out/host/linux-x86/bin/* folder after the build.

Steps to enable ADB over DbC support on |NUC| BLKNUC7iDNHE system
-----------------------------------------------------------------

#. Check the Android property value *persist.vendor.sys.usb.adbover* with the following command. The default value is ``dwc``, represents normal ADB over USB (DWC).

    .. code-block:: bash

        root@intel:~# getprop persist.vendor.sys.usb.adbover
        dwc

#. Reset the property value to ``dbc``, then reboot the target system.

    .. code-block:: bash

        root@intel:~# setprop persist.vendor.sys.usb.adbover dbc

Connect the Target to the Host System
-------------------------------------

Plug the debug Target to the Host system using a `USB Type-A to Type-A (3.0) SuperSpeed Debug cable <https://www.datapro.net/products/usb-3-0-super-speed-a-a-debugging-cable.html>`_. 
A USB 2.0 Type-A to Type-A cable does not work in this case.

At this point the target should have enumerated as a Debug Device on the Host. This can be
confirmed with the following command:

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

.. Note:: **Speed** should be *5000* (i.e. Spd=5000) and **Driver** should be *usbfs* (i.e. Driver=usbfs) in the previous command output.

ADB Detection in Host Machine
-----------------------------

    .. code-block:: bash

        root@intel:/home/prabhatc/Desktop# ./adb devices
        List of devices attached
        * daemon not running. starting it now on port 5037 *
        * daemon started successfully *
        DW1724778700007 device

Steps to switch back to normal ADB over USB (DWC)
-------------------------------------------------

#. Check the Android property value *persist.vendor.sys.usb.adbover* with the following command.

    .. code-block:: bash

        root@intel:~# getprop persist.vendor.sys.usb.adbover
        dbc

#. Reset the property value to ``dwc``, then reboot the target system.

    .. code-block:: bash

        root@intel:~# setprop persist.vendor.sys.usb.adbover dwc

ADB over DbC throughput test result
-----------------------------------

- Achieved 28.0 MB/s (1073741824 bytes in 36.528s) for pulling 1GB file.
- Achieved 27.0 MB/s (1073741824 bytes in 37.860s) for pushing 1GB file.

Conclusion
----------

DbC is ideal choice for platforms which don't have USB device controller IP and
requires debugging support. If platform uses dedicated USB device controller for
just debugging support, it can be replaced with DbC. DbC is dependable debugging
solution which is critical for early platform bring up where there is limited BIOS
support etc.

References
----------

DBC CAP Blog
    https://www.kernel.org/doc/html/v5.0/driver-api/usb/usb3-debug-port.html

XHCI Spec
    https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
