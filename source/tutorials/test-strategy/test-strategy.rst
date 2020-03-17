.. _system-validation-test-strategy:

Test strategy for |C|
#####################

|C| is an open source Android* software reference stack for the Android community
to bring ideas to life while developing on the latest Android release and the latest
Intel hardware platforms. The following |NUC| system has been used to validate regular |C| releases.

    * |NUC| Kit `NUC7i5DNHE <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc7i5dnhe.html>`_
      with `0065 <https://downloadcenter.intel.com/downloads/eula/28885/BIOS-Update-DNKBLi5v-86A-?httpDown=https://downloadmirror.intel.com/28885/eng/DNi50065.bio>`_
      BIOS firmware

Weekly Validation Phase
-----------------------

The weekly validation cycle includes system functional test execution, compliance
testing, and :abbr:`KPI (Key Performance Indicators)` based on the defined features of the
quarterly program.

    * The test plan is created based on the features in the verify/closed state from
      the weekly release builds. Software criteria are defined at the start of the program,
      and execution is completed weekly on each domain until the defined software criteria are met.
    * The validation team maps & tracks all the test cases against the defined requirements.
    * The Validation team will share the consolidated results based on the ask with details
      on software completion, requirement coverage, defects and system validation results.

Android Validation In-Scope
---------------------------

Android validation is scoped for the following:

* :abbr:`CiC (Celadon in Container)` and :abbr:`CiV (Celadon in Virtual Machine)` platforms consist of

    * Kaby Lake CiC and Comet Lake CiC Pie
    * Kaby Lake CiV Android 10

* Functional validation of all end to end defined features in JIRA

* Non Functional (Compliance/Performance) - based on customer requests

        * Performance KPIs list defined
        * Compliance testing

Android Validation Out-Scope
----------------------------

* All unit, white-box, and pre-integration testing is owned by the function
  domain owners. Domain owners must guarantee component
  level qualification such as Kernel,
  Debug & Trace, USB, WIFI, and Bluetooth.
* Hardware component and relevant features
* FuSA Certification
* Pre-Certification
* Documentation

Validation Activity Flow
-----------------------------

.. figure:: images/validation-activates-key-flow.png
    :align: center

Test Suite and Defect Tracking
------------------------------

System functional testing is executed in a cumulative manner. The weekly functional
test suite is focused on features moved to verify state and is validated on weekly releases.

* Coverage for all the features defined. Validation is conducted on internal builds
  and issues reported are synced to external JIRA.

.. figure:: images/jira-bridge.png
    :align: center
