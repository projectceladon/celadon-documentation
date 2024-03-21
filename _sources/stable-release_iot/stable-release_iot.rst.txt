.. _stable-celadon-iot:

Stable Releases IoT
###################

Stable Releases (IoT) is an Internet of Things (IoT) overlay on top of |C|. The
Stable Releases (IoT) release provides users with an extensive set of features on
Android 11: Comet Lake (CML), Tiger Lake (TGL), and Elkhart Lake (EHL) platforms with a single Baseline/Image
Android 12: Alder Lake (ADL) platforms with a single Baseline/Image

Stable Releases (IoT) empowers the community to utilize 100% compliance on the
supported platforms with continuous updates with ASBs.

.. list-table:: Celadon_IoT Platforms
    :header-rows: 1

    * - Platform
      - Ubuntu Host
      - Host kernel
      - Guest Kernel
      - Android Dessert
      - Virtualization Technology
    * - Comet Lake (CML) NUC
      - 20.04 LTS (Focal Fossa)
      - 5.4.209
      - 5.4.224
      - 11
      - GVT-d
    * - Elkhart Lake (EHL) CRB
      - 20.04 LTS (Focal Fossa)
      - 5.4.209
      - 5.4.224
      - 11
      - GVT-d
    * - Tiger Lake (TGL) RVP
      - 20.04 LTS (Focal Fossa)
      - 5.4.209
      - 5.4.224
      - 11
      - GVT-d
    * - Alder Lake S/P/PS/N (ADL-S/P/PS/N) RVP
      - 22.04 LTS (Jammy Jellyfish)
      - 5.15.85
      - 5.10.145
      - 12
      - SR-IOV

.. toctree::
   :maxdepth: 2

   android-12
   android-11
