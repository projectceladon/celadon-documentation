.. _release-naming-convention:

Release Naming Convention
#########################

|C| offers several types of release packages for different usages. Releases
are numbered and tagged according to the release timestamp, the exit
criteria were met, and the Android\* dessert on which the release is based.
The naming convention of a |C| release tag is:

    .. code-block:: none

        [Type]_[Milestone].[Year].[Quarter].[Serial Number]_A[Android Dessert]

    * The *[Type]* field specifies the type of the release package:

        - ':command:`CIV`' denotes a release for running |C| in a VM.

    * The *[Milestone]* field specifies the code of platform exit stage:

    .. list-table::
        :widths: 30 50 50
        :header-rows: 1

        * - Milestone
          - Quality
          - Purpose
        * - 00
          - Intermediate to Alpha
          - Evaluation/Development
        * - 01
          - Beta
          - Evaluation/Development
        * - 02
          - PV
          - Production
        * - 03
          - Sustenance (ASB/Bug Fixes)
          - Maintenance for production customer
    
    * The *[Year]* field represents the Year when the agreed quality
      criteria were met.
    * The *[Quarter]* field represents the Quarter when the agreed quality
      criteria were met.
    * The *[Serial Number]* field represents the Build increments.
    * The *[Android Dessert]* field represents the version of Android
      dessert on which the release is based.

    Examples:

    =======================   =======
    Release Tag               Comment
    -----------------------   -------
    CIV_00.19.04.51_A10       | represents an Android 10 based :abbr:`CIV (Celadon in VM)` release
                              | which met the agreed quality criteria in 2019 Q4
    CELADON_02.20.04.51_A09   | represents the first |C| sustenance release based on Android 9
                              | released on 2020 Q4 
    =======================   =======
