.. _boot-civ-f2fs:

Boot CIV with Flash Friendly File System
########################################

:abbr:`Flash Friendly File System (F2FS)` is a file system specially created for
flash memory. The motive of it was to build a file system that takes
into account the characteristics of NAND flash memory-based storage, which is
widely used in computer systems ranging from mobile devices to servers.
Flexible IO tester benchmarking in |C| has shown that F2FS has
outperformed :program:`EXT4` in random read with 25% improvement and random write
with 11% improvement. |C| has the support to mount data partitions
with F2FS but :program:`EXT4` remains the default.

Steps to enable F2FS in the kernel
**********************************

1. The following kernel configs need to be enabled to configure F2FS in
   the kernel:

   .. code-block:: bash

      CONFIG_F2FS_FS=y
      CONFIG_F2FS_STAT_FS=y
      CONFIG_F2FS_FS_XATTR=y
      CONFIG_F2FS_FS_POSIX_ACL=y
      CONFIG_F2FS_FS_SECURITY=y

2. Execute the command shown below in an :command:`adb` shell during runtime to
   check if F2FS is enabled in the kernel:

   .. code-block:: bash

      $ cat /proc/filesystems | grep f2fs
              f2fs

Steps to enable F2FS in Celadon
*******************************

1. To enable F2FS explicitly, update the config file
   ``device/intel/project-celadon/$<lunch-target>/mixins.spec`` in the
   device config project as follows::

      [groups]

      ..

      disk-bus: auto

      boot-arch:
      project-celadon(uefi\_arch=x86\_64,fastboot=efi,ignore\_rsci=true,disable\_watchdog=true,watchdog\_parameters=10
      30,verity\_warning=false,txe\_bind\_root\_of\_trust=false,bootloader\_block\_size=4096,verity\_mode=false,disk\_encryption=false,file\_encryption=true,metadata\_encryption=true,fsverity=true,target=caas,ignore\_not\_applicable\_reset=true,self\_usb\_device\_mode\_protocol=true,usb\_storage=true,live\_boot=true,userdata\_checkpoint=false,data\_use\_f2fs=true)

   The following parameter has been added within the brackets in the previous
   configuration setting::

      data\_use\_f2fs : optional
      This flag defines whether the data partition needs to be mounted
      with F2FS.

      DEFAULT: false

2. Revert the patch shown below by updating the flashfiles mixin group
   ``device/intel/groups/flashfiles``::

    commit 2786ca9cf496d31743674c4273dda9d5ce9958ca
    Author: Tian Baofeng <baofeng.tian@intel.com>
    Date: Thu Aug 8 14:29:31 2019 +0800

       flashfiles: format data partition to f2fs filesystem

       After enabling F2FS filesystem in data partition, OS
       can not boot to UI due to userdata partition mounting failure
       with F2FS filesystem format.
       This patch changed flash json file configuration to make
       data partition being formatted to F2FS when flashfiles package
       being flashed.

       Change-Id: I24b4c6815d13e6ffed7d66a52e876306ae37fbbd
       Tracked-On: OAM-84632
       Signed-off-by: Tian, Baofeng <baofeng.tian@intel.com>
       Signed-off-by: Duan, YayongX <yayongx.duan@intel.com>

       Reviewed-on: 677387

After the mixin configuration is changed, run
the \ **mixin-update** script before re-building the image to apply the
changes to the project device configuration. Follow the instructions
in \ `Build Celadon From
Source <https://docs.01.org/celadon/getting-started/build-source.html#build-from-source>`__ Guide
to rebuild the |C| images.

.. code-block:: bash

  $ device/intel/mixins/mixin-update

Steps to verify F2FS boot in Celadon
************************************

1. After |C| has booted, run the command shown below in an :command:`adb` shell
   to check that the data partition has been mounted with F2FS.

   .. code-block:: bash

      $ mount | grep data

      /dev/block/dm-8 on /data type f2fs
      (rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix)

Storage block diagram in CIV
****************************

Figure 1 below shows the layers involved in virtualization of the
storage stack. It shows the component involved in each layer of the
storage virtualization stack. Broadly application layer holds on the
Android/Guest OS along with the backing HALs, filesystem and block
layers. QEMU provides the format and protocol layers, VFS & block layer
of the Host/Ubuntu OS interact with the real hardware.

.. figure:: images/boot-civ-f2fs-storage-block-diagram.png
   :width: 4.87500in
   :height: 4.73958in

   Figure 1: Storage block diagram