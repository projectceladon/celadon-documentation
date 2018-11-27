.. _add-movidius-ncsdk:

Add Intel® Movidius |NN| SDK to |C|
#######################################

Overview
--------

This tutorial walks you through the general process of adding software packages to your |C| image. The Intel® Movidius |NN| Abstraction Layer (NN HAL) is added to the |C| image in order to provide hardware acceleration for `Android Neural Networks API (NNAPI) <https://developer.android.com/ndk/guides/neuralnetworks/index.html>`_ using `Intel Movidius Neural Compute Stick (NCS) <https://developer.movidius.com>`_.

The Android Neural Networks API is a new Android C API introduced in Android 8.1 to run the computation intensive operations required by most machine learning frameworks (e.g. `TensorFlow Lite <https://www.tensorflow.org/mobile/tflite>`_ and `Caffe <http://caffe.berkeleyvision.org/>`_) to build and train neural networks on Android platforms. Intel Movidius Neural Compute Stick is a fanless deep learning USB accessory powered by |Movidius| Vision Processing Unit (VPU), which enables rapid prototyping, validation, and deployment of Deep |NN| (DNN) inference applications on PC platforms. By integrating the |Movidius| |NN| HAL to Android neural networks runtime, machine learning frameworks running on Android will perform hardware-accelerated inference operations using |Movidius| NCS.

In this tutorial, you add the |Movidius| NC SDK to your |C| image and invoke a native app to communicate with the neural compute stick using NC API. A simple Android image classifier app based on TensorFlow Lite machine learning library is also provided to illustrate the performance boost using the new Android NNAPI.

Prerequisites
-------------

* |NUC| systems supported by |C|
* |Movidius| Neural Compute Stick
* A 64-bit Ubuntu 16.04 Linux development host to build |C| images

Reference the :ref:`build-from-source` section in the Getting Started Guide to set up the |C| source tree and the build environment.

Add |Movidius| NN HAL to the build
----------------------------------

Google has released the NNAPI support since Android 8.1, and it is  included in the |C| source tree. To add |Movidius| NN HAL to the build, clone the following GitHub repository under the *external* directory in the |C| source tree:

.. code-block:: bash

    $ cd <celadon_src>
    $ git clone https://github.com/intel/nn-hal.git external/nn-hal

Reference the README file in the `Intel Movidius Neural Networks HAL repository <https://github.com/intel/nn-hal/tree/master/Intel_movidius_nn_hal>`_ to download and integrate `Intel Movidius NCSDK <https://github.com/movidius/ncsdk>`_ inside the *nn-hal* source tree. Modify the source files in the NCSDK as specified in the README file prior the build.

.. code-block:: bash
    :emphasize-lines: 6-7

    $ pushd external/nn-hal/
    $ rm -rf vpu-hal2/
    $ cd Intel_movidius_nn_hal/libncs/
    $ tar zxvf <ncsdk_download_folder>/ncsdk-1.12.00.01.tar.gz
    ...
    Perform the required source code changes as described in
    https://github.com/intel/nn-hal/tree/master/Intel_movidius_nn_hal
    ...
    $ popd

Include **MvNCAPI.mvcmd**, **libncsdk**, and **ncs_test1_app** packages into the build by adding the following lines to the device makefile *device/intel/project-celadon/celadon/device.mk* . These packages represent the NC firmware, NC SDK library, and the testing app respectively.

.. code-block:: bash

    # Intel® Movidius Neural Networks HAL
    PRODUCT_PACKAGES += MvNCAPI.mvcmd libncsdk ncs_test1_app
    PRODUCT_PACKAGES += \
        android.hardware.neuralnetworks@1.0-vpudriver-impl \
        android.hardware.neuralnetworks@1.0-service-vpudriver

Follow the build instructions in the :ref:`get-started` Guide to rebuild the |C| installer images, and to flash the image onto your |NUC| system.

Communicate with |Movidius| NCS
-------------------------------

To quickly test the functionality of NCSDK, you must establish an *adb* session from the Ubuntu development host to the |NUC| system. This allows you to issue commands over *adb* sessions. Boot up the |NUC| system, configure the WiFi credentials with the Android *Settings* app, and get the assigned IP address from the `Settings->System->About tablet->Status page`.

.. figure:: images/settings-status.png
    :align: center

Install the Android *adb* tool on the Ubuntu development host if no *adb* executable is found. Enter the following commands to establish an *adb* session:

.. code-block:: bash

    $ sudo apt-get install -y adb
    ...
    $ adb kill-server
    $ adb connect 192.168.1.107 # the IP address of Intel NUC
    * daemon not running; starting now at tcp:5037
    * daemon started successfully
    connected to 192.168.1.107:5555

Once the `adb` session is connected, plug in the |Movidius| Neural Compute Stick to the |NUC|. Login to the system and launch the *ncs_test1_app* native app with root privilege. The app should  detect the presence of the NCS as shown in following screenshot.

.. code-block:: bash

    $ adb shell
    celadon:/ $ su
    celadon:/ # ncs_test1_app                                                      
    Hello NCS! Device opened normally.
    Goodbye NCS!  Device Closed normally.
    NCS device working.
    celadon:/ #

Simple image classifier using Android NNAPI
-------------------------------------------

An Android image classifier app is developed to demonstrate the advantage of using the new Android NNAPI. The following steps guide you through the build of the simple Android image classifier, assuming your Ubuntu development host has installed the Android Studio as documented in the `Android Studio installation guide <https://developer.android.com/studio/install>`_.

* Clone the source code of the Tensorflow Lite Image Classifier app:

.. code-block:: bash

    $ git clone https://github.com/vnsmurthysristi/TensorFlowLite_Apps.git

* Launch the Android Studio, click the **Configure** button at the bottom to launch the Android SDK Manager. Since the Android NNAPI has been introduced since Android 8.1, make sure the **Android 8.0 (Oreo) API 26** package has been installed.

.. figure:: images/android-studio.png
    :align: center

.. figure:: images/sdk-manager-android-26.png
    :align: center

* Back to the Android Studio welcome screen, open the Gradle project of the Tensorflow Lite Image Classifier app at the above download folder. The Android Studio will install the dependency packages on the first launch.

.. figure:: images/android-studio-tfl-app.png
    :align: center

* In the Android Studio project IDE, click the ``Run 'app'`` button on the toolbar to build the app, install the apk file to the |NUC| device and run from there. You can toggle the ``NN API ENABLE`` button to compare the performance difference of the image inference time with and without the Android NN-API.

.. figure:: images/screenshot-image-classifier.png
    :align: center
