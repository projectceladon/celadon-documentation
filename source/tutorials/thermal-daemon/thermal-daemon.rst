.. _thermal-daemon:

Thermal Daemon: Intel thermal solution for |C|
==============================================

Introduction
------------

`Thermal Daemon (TD) <https://github.com/intel/thermal_daemon>`_ is an open source thermal solution provided by Intel. It is a service that starts at the Android filesystem boot up and executes throughout the uptime of the system. It supports multiple thermal policies such as active, passive, and critical. Users can configure thermal policies for a platform using *thermal-conf.xml* in the */vendor/etc/thermal_daemon* directory on the target.

Thermal daemon relies on the thermal sensor temperature inputs in Linux thermal sysfs interfaces */sys/class/thermal*, and based on that, it takes appropriate throttling/cooling actions as defined in the *thermal-conf.xml*. Reference the man pages for the `Thermal daemon details <https://github.com/intel/thermal_daemon/blob/master/man/thermald.8>`_, and the `thermal-conf.xml configuration file options <https://github.com/intel/thermal_daemon/blob/master/man/thermal-conf.xml.5>`_.

Kernel drivers used by Thermal Daemon solution on |C|
-----------------------------------------------------

Thermal Daemon looks for thermal sensors and thermal cooling drivers in the Linux kernel. The following kernel drivers are used on Celadon:

+---------------------------------------+--------------------------------+------------------------------+
|Thermal driver                         | Description                    | Supported Platforms          |
+=======================================+================================+==============================+
|drivers/thermal/x86_pkg_temp_thermal.c | SOC package temperature driver |KabyLake NUC, AppoloLake NUC  | 
+---------------------------------------+--------------------------------+------------------------------+
|drivers/powercap/intel_rapl.c          | RAPL package power limit driver|KabyLake NUC, AppoloLake NUC  |
+---------------------------------------+--------------------------------+------------------------------+

Thermal Daemon source path in |C|
---------------------------------

======================================================  ===================================
*vendor/intel/external/project-celadon/thermal_daemon*  Thermal Daemon sources
*device/intel/project-celadon/common/thermal*           thermal-conf.xml configuration file
======================================================  ===================================

Platform Thermal Management
------------------------

KabyLake NUC
~~~~~~~~~~~~

- Platform Thermal Parameters

================ =========================
Tjmax 	         100 (degree celsisus)
Thermal Zone     x86_pkg_temp
Cooling device   soc power limit 1
================ =========================

- Thermal Management Policy

+----------+-------------------+-----------------------------------------+
|          | x86_pkg_temp      |                                         |
| Policy   | Temperature Limit | Action                                  |
|          | (degree celsius)  |                                         |
+==========+===================+=========================================+
| Passive  | t < 85            | No Action                               |
+----------+-------------------+-----------------------------------------+
| Passive  | 85 < t < 95       | Reduce soc power limit 1                |
+----------+-------------------+-----------------------------------------+
| Passive  | 95 < t < 99       | Reduce soc power limit 1 further        |
+----------+-------------------+-----------------------------------------+
| Critical | t >= 99           | Shutdown the system                     |
+----------+-------------------+-----------------------------------------+

AppoloLake NUC
~~~~~~~~~~~~~~

- Platform Thermal Parameters

================ =========================
Tjmax 	         105 (degree celsisus)
Thermal Zone     x86_pkg_temp
Cooling device   soc power limit 1
================ =========================

- Thermal Management Policy
+----------+-------------------+-----------------------------------------+
|          | x86_pkg_temp      |                                         |
| Policy   | Temperature Limit | Action                                  |
|          | (degree celsius)  |                                         |
+==========+===================+=========================================+
| Passive  | t < 90            | No Action                               |
+----------+-------------------+-----------------------------------------+
| Passive  | 90 < t < 100      | Reduce soc power limit 1                |
+----------+-------------------+-----------------------------------------+
| Passive  | 100 < t < 104     | Reduce soc power limit further          |
+----------+-------------------+-----------------------------------------+
| Critical | t >= 104          | Shutdown the system                     |
+----------+-------------------+-----------------------------------------+
