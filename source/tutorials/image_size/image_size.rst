.. _Image_Size:

Image Size:
===========

There are several partitions used by Android. And we use .img files to flash each partitions. And we also support a whole GPT image to flash the whole disk.

Some partition size is large, such as system partition, but some of them is empty, use SPARSE format image to save the image size.

Users maybe want to change the partitions size.

The default partition size is defined in following files:

1. device/intel/mixins/groups/boot-arch/project-celadon/gpt.ini

2. device/intel/mixins/groups/boot-arch/project-celadon/option.spec

3. device/intel/mixins/groups/vendor-partition/true/option.spec

4. device/intel/mixins/groups/config-partition/true/gpt.ini

5. device/intel/mixins/groups/factory-partition/true/gpt.ini


Users can modify the device/intel/project-celadon/[lunch_target]/mixins.spec to change some default setting.

Note:

1. if change the partition size, will cause the OTA update failed.

2. For the system partition size, please set at least 2560MB.
