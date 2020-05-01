.. _software-debug-tips:

Software Debugging Tips on |C|
##############################

In addition the useful tools and techniques documented in the `Debugging Native Android Platform Code <https://source.android.com/devices/tech/debug>`_ section on the AOSP website, this article provides additional information to facilitate the software debugging on |C| devices.

Debugging using gdb
===================

GNU Debugger (*gdb*) is the most popular debugger for debug C/C++ programs on UNIX systems. You could follow below procedures to tap into a running program, and exercise control over the program to stop execution at a certain point, step through the program one line at a time, and examine variables when problems occur.

#. If your development host does not have *gdb* installed, enter the following commands to install *gdb* tool on your Ubuntu development workstation:

    .. code-block:: bash

        $ sudo apt-get update
        $ sudo apt-get install gdb

#. A `celadon_gdb.sh <https://raw.githubusercontent.com/projectceladon/celadon-documentation/master/blob/celadon_gdb.sh>`_ script is developed to establish a connection from the local *gdb* program to the *gdbserver* program running on the |C| target device. Since the debugging process requires the program symbol tables and some shared libraries in the |C| build tree, you need to download and save the script in the top-most |C| source directory before initializing the build variables and selecting the |C| build target.

    .. code-block:: bash

        $ cd celadon
        $ curl -O https://raw.githubusercontent.com/projectceladon/celadon-documentation/master/blob/celadon_gdb.sh
        $ chmod +x celadon_gdb.sh
        $ source build/envsetup.sh
        $ lunch celadon-userdebug

#. Reference the :ref:`build-from-source` section in the Getting Started Guide to build the |C| installer image.

#. After booting up the |NUC|, set up an *adb* connection from the development host to the |NUC| over Ethernet with the following commands prior the debugging process:

    .. code-block:: none

        $ adb kill-server
        # Replace the following IP addresses with yours
        $ adb connect 192.168.1.107
        * daemon not running. starting it now on port 5037 *
        * daemon started successfully *
        connected to 192.168.1.107:5555

#. Restart the *adb* daemon in privileged mode and re-connects to the |NUC|:

    .. code-block:: none

        $ adb root
        restarting adbd as root
        $ adb connect 192.168.1.107
        * daemon not running. starting it now on port 5037 *
        * daemon started successfully *
        connected to 192.168.1.107:5555

#. Let's say you want to debug the wireless supplicant daemon *wpa_supplicant*, you can invoke the **celadon_gdb.sh** script with the following command to tap into the running *WPA_supplicant* daemon, and start debugging the program.

    .. code-block:: none

        $ ./celadon_gdb.sh  wpa_supplicant
        3207
        Attached; pid = 3207
        Listening on port 6000
        
        GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
        Copyright (C) 2016 Free Software Foundation, Inc.
        License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
        This is free software: you are free to change and redistribute it.
        There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
        and "show warranty" for details.
        This GDB was configured as "x86_64-linux-gnu".
        Type "show configuration" for configuration details.
        For bug reporting instructions, please see:
        <http://www.gnu.org/software/gdb/bugs/>.
        Find the GDB manual and other documentation resources online at:
        <http://www.gnu.org/software/gdb/documentation/>.
        For help, type "help".
        Type "apropos word" to search for commands related to "word".
        Remote debugging from host 127.0.0.1
        /usr/local/google/buildbot/src/android/master-ndk/toolchain/gdb/gdb-7.11/gdb/gdbserver/regcache.c:264: A problem internal to GDBserver has been detected.
