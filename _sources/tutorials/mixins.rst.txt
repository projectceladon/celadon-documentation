.. _mixins:

Mixins
######

Overview
********

Traditionally, Android\* has been designed to have a unique *lunch* target
for each enabled device, and each lunch target has a product source code
directory associated with it. To enable Android on a variety of Intel x86-
based boards across many CPU types at once, any given device needs to be
tuned for specific peripherals and software features. With completely
independent lunch targets and product directories, a great deal of
configuration data was copied and pasted among build targets spread across
many configuration file types. In addition, any changes to the configuration
data must be propagated to those copies in the product directories, which
significantly increases the maintenance cost. To mitigate the effort, |C|
introduces a multiple-inheritance system to generate product-definition
features based on a **mixin** model.

Mixins are placed in groups; each group represents a functional area
on the system, such as audio, Wi-Fi\*, or boot parameters among other
features and characteristics. Thus, configuration directives for functional
areas are grouped together and can be reused. Each group provides radio-
button-like selection options among features, and a product must choose at
least one option for each group. A script
:file:`device/intel/mixins/mixin-update` then updates all the build targets
with this data whenever it's changed.

Usage
*****

Mixin groups
============

Each mixin group represents a functional area of the system that has
multiple radio button options from which to select for a particular product.
Some groups may be simple :command:`true`/:command:`false` selections.
A typical example is the option to integrate
:abbr:`GMS (Google\* Mobile Services)`. Many mixin groups offer a variety of
selections, such as the :command:`cpu-arch` mixin group, which instructs the
system to gather configuration data relevant to the particular SoC and to
generate the configuration for the target product.

Each mixin group has a subdirectory in the base mixin directory at
:file:`device/intel/mixins/groups/`. The path to the base mixin directory is
specified in :file:`mixins.spec` in each product directory:

.. code-block:: bash

    $ ls device/intel/mixins/groups/
    aaf                         boot-arch         debug-coredump      debug-usb-config    ethernet           gptbuild      memtrack           pstore            touch             vndk
    abota-fw                    bugreport         debug-crashlogd     debugfs             evs                graphics      midi               public-libraries  treble            wlan
    acpi-partition              camera-ext        debug-dvc_desc      default-drm         factory-partition  hdcpd         navigationbar      rfkill            trusty
    acpio-partition             codec2            debug-kernel        device-specific     factory-scripts    health        net                sepolicy          usb
    allow-missing-dependencies  codecs            debug-lmdump        device-type         filesystem_config  houdini       neuralnetworks     serialport        usb-audio-init
    art-config                  config-partition  debug-log-watch     dexpreopt           firmware           intel_prop    odm-partition      slot-ab           usb-gadget
    atrace                      cpu-arch          debug-npk           disk-bus            firststage-mount   kernel        ota-upgrade        storage           usb-init
    audio                       cpuset            debug-phonedoctor   disk-encryption     flashfiles         lights        power              suspend           usb-otg-switch
    avb                         dalvik-heap       debug-tools         display-density     fota               load_modules  product-partition  swap              variants
    bluetooth                   dbc               debug-unresponsive  dynamic-partitions  googleservice      media         psdapp             thermal           vendor-partition

mixins.spec
===========

A mixin spec file is a text file that describes the product configurations.
Every |C| build target that uses mixins should have a :file:`mixins.spec`
file in their product board configuration directories. Instead of manually
modifying feature settings in the product makefiles, the product
customization and peripherals tuning are done by editing the
:file:`mixins.spec` file.

If there are updates or changes to any mixin configuration files, you should
re-run the :file:`mixin-update` script from the root of the |C| Android
source tree. The script searches all files named :file:`mixins.spec` under
the :file:`device/intel/` directory and generates the makefiles
(e.g. :file:`AndroidBoard.mk`, :file:`BoardConfig.mk`, :file:`device.mk`,
:file:`init.rc`, etc.) required for building Android in individual product
directories.

option.spec
===========

The :file:`option.spec` file, if it is present in an option subdirectory of
a mixin group, specifies metadata for that option of a particular group.
This file is used to set arguments to a default value if the value is not
provided in :file:`mixins.spec`. For example, a ':command:`efi`' option is
available for the ':command:`boot-arch`' mixin group:

.. code-block:: bash

    $ ls device/intel/mixins/groups/boot-arch/efi:
    AndroidBoard.mk  fstab    init.rc           option.spec
    BoardConfig.mk   gpt.ini  init.recovery.rc  product.mk

The configuration fragments such as :file:`AndroidBoard.mk` and
:file:`BoardConfig.mk` included in the previous option directory are applied
to the product configuration files if the option ':command:`efi`' is
specified in the product mixin spec file :file:`mixins.spec`:

.. code-block:: bash

    ...
    boot-arch: efi(uefi_arch=x86_64,fastboot=efi,acpi_permissive=true)
    ...

files.spec
==========

The :file:`files.spec` file is used to specify additional files that will be
copied to :file:`device/intel/<lunch-target>/extra_files/<mixin-group>/`
before building |C| images. This configuration file should be placed in an
option subdirectory of a group. The files listed in :file:`files.spec` will be copied into the target product repo if this group is selected.
For example, the :file:`mixins.spec` of the :abbr:`CiV (Celadon in VM)`
lunch target specifies the :command:`project-celadon` option for the
:command:`boot-arch` group. As a result, the UEFI firmware startup file
:file:`startup.nsh` listed in :file:`files.spec` is copied to the CiV source
repository after running the
:file:`device/intel/mixins/mixin-update` script:

.. code-block:: bash

    $ cat device/intel/project-celadon/caas/mixins.spec
    ...
    [groups]
    ...
    boot-arch: project-celadon(uefi_arch=x86_64,fastboot=efi,ignore_rsci=true,disable_watchdog=true,...)
    ...

    $ cat device/intel/mixins/groups/boot-arch/project-celadon/files.spec
    ...
    [extrafiles]
    update_ifwi_ab.sh: "ifwi update script running in postinstall"
    startup.nsh: "Auto installer start"
    ...

mixinfo.spec
=============

The :file:`mixinfo.spec` file is an optional file in a mixin group
directory, which defines metadata for a particular group. It is currently
used to manage dependencies between mixin groups. For example:

.. code-block:: bash

    $ cat device/intel/mixins/groups/debug-phonedoctor/mixinfo.spec
    [mixinfo]
    deps = debug-crashlogd

Running a mixin update ensures the mixin group '*debug-crashlogd*' is
included before processing the '*debug-phonedoctor*' group.
