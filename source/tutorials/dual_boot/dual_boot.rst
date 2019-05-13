.. _Dual_Boot:

Dual Boot:
==========

Some users want to install Windows and Anroid in one device, and can select boot which OS. We call this feature as 'Dual Boot'.

The better is install Windows and Android into two storages, each OS use one storage.

There are two methods to install:

1. Use general image to install:
  The general image does not support select which storage to install Android.

  So if want to use general image, you need to disable the storage for Windows at first, and enable it after install.

  You can use BIOS boot menu to select boot from which OS.

2. GRUB based image to install:
  You can also use the GRUB based image to install.

  Use the following command to build the GRUB based image:
    make SPARSE_IMG=true project_celadon-efi -j 10

    You can change the '-j 10' according your server CPU cores.

  Then you can flash this GRUB based image to a USB disk, and boot from this USB disk to install. When install, select which storage to install Android.

  After install Android and Windows, you can use BIOS boot menu to select boot from which OS, or you can modify the GRUB menu, add a Windows boot menu item.
