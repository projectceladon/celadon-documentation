Thermal Daemon: Intel thermal solution for Celadon
==================================================

Introduction
------------
Thermal daemon(TD) is an opensource thermal solution provided by Intel.
`Thermal daemon github <https://github.com/intel/thermal_daemon>`_

Thermal daemon is a service that gets started at android filesystem bootup
and executes throughout the uptime of the system. It supports multiple
thermal policies such as active, passive and critical.

Users can configure thermal policies for a platform using the thermal-conf.xml.
This file can be found in /vendor/etc/thermal_daemon directory on the target. 

Thermal daemon relies on the thermal sensor temperature inputs (thermal sysfs interfaces
on the target) and based on which, it takes appropriate throttling/cooling actions
as defined in the thermal-conf.xml.

`Thermal daemon help <https://github.com/intel/thermal_daemon/blob/master/man/thermald.8>`_

`Thermal config file help <https://github.com/intel/thermal_daemon/blob/master/man/thermal-conf.xml.5>`_

Kernel drivers used by thermal-daemon solution on Celadon
---------------------------------------------------------
drivers/thermal/x86_pkg_temp_thermal.c - SOC package temperature driver
drivers/powercap/intel_rapl.c - RAPL package power limit driver

Thermal Daemon source path in Celadon
-------------------------------------
Thermal daemon sources - vendor/intel/external/project-celadon/thermal_daemon.
thermal-conf.xml - device/intel/project-celadon/common/thermal.

Enabled Thermal Policies
------------------------
KabyLake NUC
------------

+----------+-------------------+-----------------------------------------+
|          | x86_pkg_temp      |                                         |
| Policy   | Temperature Limit | Action                                  |
|          | (degree celsius)  |                                         |
+----------+-------------------+-----------------------------------------+
| Passive  | t < 85            | No Action                               |
+----------+-------------------+-----------------------------------------+
| Passive  | 85 < t < 95       | Reduce soc power limit 1                |
+----------+-------------------+-----------------------------------------+
| Passive  | 95 < t < 99       | Reduce soc power limit 1 further        |
+----------+-------------------+-----------------------------------------+
| Critical | t >= 99           | Shutdown the system                     |
+----------+-------------------+-----------------------------------------+



AppoloLake NUC
--------------
+----------+-------------------+-----------------------------------------+
|          | x86_pkg_temp      |                                         |
| Policy   | Temperature Limit | Action                                  |
|          | (degree celsius)  |                                         |
+----------+-------------------+-----------------------------------------+
| Passive  | t < 90            | No Action                               |
+----------+-------------------+-----------------------------------------+
| Passive  | 90 < t < 100      | Reduce soc power limit 1                |
+----------+-------------------+-----------------------------------------+
| Passive  | 100 < t < 104     | Reduce soc power limit further          |
+----------+-------------------+-----------------------------------------+
| Critical | t >= 104          | Shutdown the system                     |
+----------+-------------------+-----------------------------------------+

