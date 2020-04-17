.. _release-naming-convention:

Release Naming Convention
#########################

|C| offers several types of release packages for different usages. Releases are numbered and tagged
according to the release timestamp, the exit criteria were met, and the Android dessert that the release
is based off. The naming convention of a |C| release tag is:

    .. code-block:: none

        [Type]_[Exit Code].[Year].[Quarter].[Work Week]_A[Android Dessert]

    * The *[Type]* field specifies the type of the release package:

        - ':command:`CIV`' denotes a release for running |C| in a VM.
        - ':command:`CIC`' denotes a release for running |C| in a Container.

    * The *[Exit Code]* field specifies the code of platform exit stage:

        - ':command:`00`' represents the release is going through the platform exit stage.
        - ':command:`01`' represents the release reaches the platform exit criteria.
        - ':command:`02`' and onward represent sustenancing releases. The number is increased each time a sustenancing package is released.

    * The *[Year]* field represents the exit criteria of the Year.
    * The *[Quarter]* field represents the exit criteria of the Quarter.
    * The *[Work Week]* field represents the exit criteria of the working week.
    * The *[Android Dessert]* field represents the version of Android dessert the release is based off.

    Examples:

    =======================   =======
    Release Tag               Comment
    -----------------------   -------
    CIV_00.19.04.51_A10       | represents an Android 10 based :abbr:`CIV (Celadon in VM)` release 
                              | which met the Q4 quarterly exit criteria in 2019 ww51
    CIC_01.20.01.12_A09       | represents an Android 9 based :abbr:`CIC (Celadon in Container)` release
                              | which met the platform exit criteria in 2020 ww12
    CELADON_02.20.04.51_A09   | represents the first |C| sustenancing release based on Android 9
                              | released on 2020 Q4 in ww51
    =======================   =======
