.. _enabling-sensors:

Enabling Sensors in Celadon
###########################


This tutorial explains about sensors usage in project |C|.

Sensors overview
****************

Sensors are integrated into platforms powered by Intel using Integrated
Sensor Hub (ISH). In the host OS, sensors are populated using the Linux
IIO subsystem. If a platform has support for sensors, we can find the
sensor devices in :file:`/sys/bus/iio/devices/`. Please refer to
https://docs.kernel.org/hid/intel-ish-hid.html for more information
about the ISH module.

Sensors support in CiV
**********************

CiV has support for sensors and uses the sensor mediation HAL to access
IIO-based sensor devices available on host OS. The current
implementation of the mediation HAL is based on Android Sensor HAL 2.0.
Figure 1 illustrates the block diagram of sensors implementation in CiV.

.. figure:: images/fig1-block-diagram-sensors.png
   :width: 6.50000in
   :height: 3.08056in

   Figure 1: Block diagram of sensors in CiV

To communicate with Host OS IIO sensor devices, the mediation HAL uses
the libiio library with a network back end. We require the libiio daemon
(:command:`iiod`) to be run on the host before launching CiV. The source code path
of the sensors HAL is :file:`vendor/intel/hardware/interfaces/sensors/2.0` and
the GitHub project reference is
https://github.com/projectceladon/vendor-hardware-interfaces/tree/master/sensors/2.0

Currently CiV has support for the following sensors:

* Accelerometer
* Gyroscope
* Magnetic field
* Light
* Gravity
* Rotation vector
* Geomagnetic rotation vector
* Orientation

Enabling sensors in CiV
***********************

By default, |C| has support for sensors. To enable sensors,
add sensors information in :file:`mixins.spec` as shown below:

.. code-block:: bash

   $device/intel/project-celadon/$(lunch_target)/mixins.spec

   sensors: mediation(enable_sensor_list=true)

The sepolicy configuration for the sensor mediation HAL is present in

.. code-block:: bash

   $device/intel/sepolicy/sensors/mediation/

Disabling sensors
*****************

To disable sensors in CiV, assign **false** to the **sensors** filed in
your lunch target’s :file:`mixins.spec`.

.. code-block:: bash

   $device/intel/project-celadon/$(lunch_target)/mixins. spec

   sensors: false

Run the following command to update mixin changes:

.. code-block:: bash

   $./device/intel/mixins/mixin-update

Starting the IIO daemon
***********************

Start the IIO daemon to provide access to sensors for CiV running as
Guest.

The IIO daemon is an open-source project developed by Analog Devices. To
start iio-daemon(iiod), we must build it from source code. Follow the
steps below to clone, build, and run iiod.

.. code-block:: bash

   git clone https://github.com/analogdevicesinc/libiio.git
   git checkout tags/v0.19 -b v0.19
   cd libiio
   mkdir build && cd build && cmake .. && make && sudo make install
   sudo iiod &

Confirm that iiod is running by running the following command:

.. code-block:: bash

   $ps -aux | grep -i iiod

Validating sensors in CiV
*************************

After following the steps to enable sensors, confirm that the sensors
are up and running in CiV by running the steps shown below.

Connect to CiV using adb and run ``$dumpsys sensorservice`` to check the
list of supported sensors and their data in Android. Figure 2 shows an
example of the output to verify sensors from the host OS.

.. figure:: images/fig2-verify-sensors-output.png
   :width: 5.54861in
   :height: 3.37600in

   Figure 2 Verify sensors example

Here is a snapshot of Accelerometer data in dumpsys output.

.. figure:: images/fig3-accelerometer-data-example.png
   :width: 5.62429in
   :height: 0.96532in

   Figure 3 Accelerometer data example

Figure 4 shows an example of the sensor data reading from the
third-party Sensors Toolbox Android app.

.. figure:: images/fig4-sensor-data-example.png
   :width: 5.24168in
   :height: 6.57226in

   Figure 4 Sensor data example
