.. _system-validation-test-strategy:

Test Strategy for |C|
#####################

|C| is an open source Android\* software reference stack for the Android
community. Celadon helps to bring ideas to life while developing on the
latest Android release and the latest Intel hardware platforms. The
following |NUC-attr| system has been used to validate regular |C| releases.

    * |NUC| Kit NUC10i7FNH <https://www.intel.in/content/www/in/en/products/boards-kits/nuc/kits/nuc10i7fnh.html>

Weekly validation phase
-----------------------

The weekly validation cycle includes system functional test execution,
compliance testing, and :abbr:`KPI (key performance indicators)` based on
the defined features of the quarterly program.

    * The test plan is created based on the features in the verify/closed
      state from the weekly release builds. Software criteria are defined
      at the start of the program, and execution is completed weekly on
      each domain until the defined software criteria are met.
    * The validation team maps and tracks all the test cases against the
      defined requirements.
    * The validation team shares the consolidated reports based on the
      request with details on software completion, requirement coverage,
      defects, and system validation results.

Scope of Android validation
---------------------------

Android validation is scoped for the following:

* The :abbr:`CiV (Celadon in Virtual Machine)` platform consists of

    * Comet Lake CiV Android 10

* Functional validation of all end-to-end defined features in JIRA\*

* Non-functional (compliance/performance) - based on customer requests:

        * Performance KPI list defined
        * Compliance testing
        * Stability testing

Out of scope for Android validation
-----------------------------------

* Hardware component and relevant features
* FuSA certification
* Pre-certification
* Documentation

Validation activities key flow
------------------------------

.. figure:: images/validation-activities-flow.png
    :align: center

Test suite and defect tracking
------------------------------

System functional testing is executed in a cumulative manner. The weekly
functional test suite is focused on features moved to the verify state and is
validated on weekly releases.

Defects reporting can be done by sending an email to:
celadon@lists.linuxfoundation.org