.. _trusty-enabling:

How to Enable or Disable Trusty for Debugging
#############################################

`Trusty <https://01.org/trusty-ia>`_ is a mandatory component since Android Oreo dessert onwards. It provides the hardware-backed security services such as the keymaster, gatekeeper, crypto, and so forth. These services are required for applications such as data storage encryption.

How to enable Trusty
====================

Project |C| supports Trusty. To enable Trusty explicitly, update the config file :file:`device/intel/project-celadon/$<lunch-target>/mixins.spec` in the device config project '*device-androidia*' as follows:

.. code-block:: none
    :emphasize-lines: 6

    ..
    [groups]
    device-specific: celadon
    treble: true
    ..
    trusty: true(ref_target=$<target name>)

The following parameters are valid options within the brackets in the previous configuration setting:

* :makevar:`ref_target` : ``mandatory``

    This option defines the reference target device.

    For project |C|, it can be any of the following values:

        *project-celadon_apl* : For IVI usage running on Intel Apollo Lake family

        *project-celadon_kbl* : For IVI usage running on Intel Kaby Lake Core processor

        *project-celadon_64* : For tablet usage running on for Commercial Kaby Lake and Apollo Lake NUCs

* :makevar:`enable_hw_sec` : ``optional``

    This flag indicates the Trusty feature is backed by hardware or software. By setting this option to *true*, the security services are provided by the Trusty, or the software-backed security services are used.

    Default: *true*

* :makevar:`enable_storage_proxyd` : ``optional``

    This flag defines whether the storge proxy daemon service is started or not. At present, this flag must be set to true when Trusty is enabled.

    Default: *true*

* :makevar:`keymaster_version` : ``optional``

    This option specifies the keymaster HAL version is used, it can be 1 or 2. Note, keymaster 3.0 uses the HAL version 2.

    Default: *2*

.. Important::
    Those optional parameters are primarily used for debugging purposes during the development.
    Users should not set any of the parameters explicitly unless the impact is clearly understood.

After the mixin configuration is changed, the user must run the :command:`mixin-update` script before re-building the image in order to apply the changes to the project device configuration. Follow the instructions in :ref:`build-from-source` Guide to rebuild the |C| images.

.. code-block:: none

    $ device/intel/mixins/mixin-update

How to disable Trusty
=====================

It is common practice to disable the Trusty temporarily for ease of debugging
while you bring up a new platform, or migrate to the new Android dessert.
To disable, set the '**trusty**' option to *false* in the mixins config file
:file:`mixins.spec` of the device config project, and update the mixins configurations
with the :command:`device/intel/mixins/mixin-update` script. Then, the Trusty is disabled after rebuilding the |C| image.

.. code-block:: none
    :emphasize-lines: 6

    ..
    [groups]
    device-specific: celadon
    treble: true
    ..
    trusty: false
