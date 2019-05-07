Making Android Host Debuggable - ADB for x86 Android Solutions
==============================================================

.. contents:: Contents
    :depth: 2
    :local:

Introduction
------------

Android Host ecosystem consists of new applications like Android Automotive,
or Chromebook or gateway systems running on NUC like box.  One of the main
challenge in these Android host solutions is the lack of USB Device mode as
most of x86 platforms are host systems.  To address this issue and to allow
a DUT with Debug Host x86 platforms provide an infrastructure that provides
a back to back connection using an USB Debug Class infra structure.

This blog provides and overview of the USB Debug Class infra (DbC) followed
by the steps to enable the feature on Celadon and seamlessly run ADB over a
USB Type-A port.

DBC Overview
------------

xDBC stands for the USB Debug capability provided extensible Host Controller
Interface. Universal Serial Bus is a host controlled Bus. Host Controller is
a hardware whose functionality is to manage USB bus and USB host ports. It is
responsible for initiating and managing all USB transfers. Extensible Host
Controller Interface (xHCI) is a register-level interface which provides a
mechanism by which the host controller (xHC) can communicate with the Operating
System of the host computer. In addition to exposing register interfaces essential
for proper functioning of the xHC it also supports many extended capabilities
which can optionally be implemented by xHC.

It includes Extended Power Management Capability, I/O Virtualization capability,
USB Legacy support capability among many others. USB Debug Capability is one of
the main extended capabilities supported by xHCI.

This functionality enables low-level system debug over USB. The xHCI debug
capabilities (xDBC) provides a means of connecting two systems where one system
is a Debug Host and the other is a Debug target. This is achieved through emulating
a debug device by using xDBC on the debug target. The debug device presented by the
debug target can be used by debug host for low level system debugging of target.

Github PR's link for enabling adb over DbC for Celadon KBL NUC
--------------------------------------------------------------

1) Kernel and adb changes:
   https://github.com/projectceladon/vendor-intel-utils/pull/291
2) Adding android property to switch between adb over DWC and DBC: 
   https://github.com/projectceladon/device-androidia-mixins/pull/274
3) Adding sepolicy to access DbC RAW device node:
   https://github.com/projectceladon/device-androidia/pull/416

Steps to enable ADB over DbC support in Host Machine
----------------------------------------------------

1. Need to edit below file, if there is no such file then create it. Make sure you
   have root access to write to this file.
   
   .. image:: images/edit_udev.png


2. Add below line in above file.
   
   .. image:: images/udev_rule.png


3. Either reboot the Host System, or run below command in super user to allow the
   changes to take effec.

   .. image:: images/trigger_udev.png


4. Rename or remove the usb_debug.ko driver in the Host System if available.

   .. image:: images/rename_driver.png


5. Unload usb_debug driver module if it's already loaded.

   .. image:: images/unload_driver.png


6. This you can check using below command.

   .. image:: images/list_driver.png


7. Default installed adb binary present in the Host System will not work for ADB
   over DbC, you will need to use adb binary available under below build directory.

   .. image:: images/adb_host_binary.png

Steps to enable ADB over DbC support in Cedalon KBL-NUC (Product Code: BLKNUC7iDNHE)
------------------------------------------------------------------------------------

1. Check the below android property value, default this have value dwc, which means normal 
   ADB over USB(DWC) will work.

   .. image:: images/getprop_dwc.png

2. If step 1 output is "dwc" then set it to "dbc".

   .. image:: images/setprop_dbc.png

3. Now restart the target system.

Connection between Host and Target Machine
------------------------------------------

Plug the debug Target to Host using USB Type-A to Type-A (3.0) SuperSpeed Debug cable
(Recommended: https://www.datapro.net/products/usb-3-0-super-speed-a-a-debugging-cable.html). 
USB 2.0 Type-A to Type-A cable will not work in this case.

At this point the target should have enumerated as a Debug Device on Host. This can be
confirmed as follow in Host Machine.

   .. image:: images/lsusb.png

$cat /sys/kernel/debug/usb/devices

   .. image:: images/sys_usb_devices.png
   
.. Note:: Speed should be 5000 (i.e. Spd=5000) and Driver should be usbfs (i.e. Driver=usbfs).

ADB Detection in Host Machine
-----------------------------

   .. image:: images/adb_devices.png

Steps to switch back to normal ADB over USB (DWC)
-------------------------------------------------

1. Check the below android property value.

   .. image:: images/getprop_dbc.png

2. If step 1 output is "dbc" then set it to "dwc".

   .. image:: images/setprop_dwc.png

3. Now restart the target system.

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

DBC CAP Blog : https://www.kernel.org/doc/html/v5.0/driver-api/usb/usb3-debug-port.html

XHCI Spec : https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
