.. _thermal-mediation:

Thermal Mediation in Celadon
############################

What is a thermal daemon?
*************************

A thermal daemon is used to prevent platforms from overheating. Thermal
daemons monitor the CPU temperature and corrects conditions using
available cooling methods. By default, the thermal daemon monitors the
CPU temperature using available CPU digital temperature sensors and
maintains the CPU temperature, before hardware takes aggressive
correction action.

The thermal daemon looks for thermal sensors and thermal cooling drivers
in the Linux thermal sysfs
(`/sys/class/thermal <file:///\\sys\class\thermal>`__) and builds a list
of sensors and cooling drivers. Each of the thermal sensors can
optionally be bound to a cooling driver by the in-kernel drivers. In
this case, the Linux kernel thermal core can directly take actions based
on the temperature trip points for each sensor and associated cooling
device. For example, trip temperature X in a sensor can be associated
with cooling driver Y. When the sensor temperature equals X, the cooling
driver Y is activated.

Why is the thermal mediation solution required?
***********************************************

In a virtual environment, guests do not have direct access to read
temperature values from the host machine. To address this issue, the
thermal mediation solution was developed.

The architectural diagram of thermal mediation is shown in Figure 1:

.. figure:: images/cs004-thermal-mediation-architecture.png
   :width: 6.10877in
   :height: 4.16146in

   Figure 1: Thermal Mediation Architecture

- **thermal HAL-VirtIO VSOCK client.** The thermal HAL-VirtIO VSOCK
  client is a customized version of the thermal HAL. It helps
  connect, read, and transfer thermal values to the Android framework
  from the **thermal VirtIO VSOCK utility** running on the host.

- **thermal VirtIO VSOCK utility.** The thermal VirtIO VSOCK utility
  helps read values from the thermal zone and transfer to the
  **thermal HAL-VirtIO VSOCK client.**

- **thermald configuration XML.** The thermal daemon allows you to
  change this relationship or add a new one via a thermal
  configuration file (:file:`thermal-conf.xml`)

  .. note::
     For more details on thermal configuration XML, refer to
     `thermal-conf.xml <https://manpages.ubuntu.com/manpages/bionic/man5/thermal-conf.xml.5.html>`__

How to enable thermal mediation for an Android guest?
*****************************************************

To use thermal mediation, configure the :file:`.ini` file of the guest.

-  **Path.**

   :file:`<home path>/.intel/.civ/<guest ini file>`

-  **Configuration.**

   .. code-block:: bash

    [mediation]

    thermal_med =<path of thermsys>

    ex: thermal_med=/home/intel/civ/scripts/thermsys

Validating thermal values in CIV
********************************

To validate the thermal values in CIV, use this command:

.. code-block:: bash

   adb shell dumpsys thermalservice

.. figure:: images/cs004-results-adb-shell-dumpsys.png
   :width: 5.00000in
   :height: 3.20833in

Thermal Support in Platform BIOS
********************************

In PC-like platforms, the HW is booted initially with BIOS FW. BIOS
FW boots and loads the OS for user operations. The BIOS in modern
PCs is implemented using UEFI (unified extensible firmware
interface) and supports ACPI (advanced configuration and power
interface). ACPI passes all the system information to the OS by
means of ACPI tables. The ACPI specification are at
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/index.html

ACPI defines interfaces that allow OSPM to be proactive in its
system cooling policies. With operating system power management
(OSPM) in control of the operating environment, cooling decisions
can be made based on the system’s application load, the user’s
preference towards performance or energy conservation, and thermal
heuristics. Graceful shutdown of devices or the entire system at
critical heat levels also becomes possible. 

It supports thermal zones, cooling policies, fan devices, and
thermal objects for managing the system. **Please ensure that the
platform UEFI/BIOS supports the following thermal objects and
interfaces**:

Fan Devices:
`https://uefi.org/htmlspecs/ACPI\_Spec\_6\_4\_html/11\_Thermal\_Management/fan-device.html <https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/11_Thermal_Management/fan-device.html%20>`__

Thermal Objects:
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/11_Thermal_Management/thermal-objects.html

Detailed examples of implementation is provided here:
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/11_Thermal_Management/thermal-zone-examples.html
