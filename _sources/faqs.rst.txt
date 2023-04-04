.. _faqs:

Frequently Asked Questions
##########################

:Q:
    What is the new Project |C| release?
:A:
    The new Project |C| release refers to the source code that makes up
    the September 2019 Project |C| Release (**20-Sept-2019**), and each
    release since. While Project |C| had long supported Android* on bare
    metal deployments using Intel® Architecture, there was no support for
    virtualized deployments of Android on Intel architecture. The |C|
    community filled that gap with the September 2019 release, which allows
    one Android image to be deployed across Virtual Machines (VM) on
    Intel® architectures. |C| source code can be used across a variety of
    Intel hardware, including
    `Intel® NUC Kit NUC6CAYH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_.
    Please check out :ref:`release-notes` for all the latest detailed release features.

:Q:
    Why might developers and independent software vendors want to use |C|
    in VM?
:A:
    The new Project |C| packaging still only takes one step to install,
    and in addition to gaining VM and container support for Android on
    Intel® Architecture, developers and
    :abbr:`ISVs (Independent Software Vendors)` will continue
    experiencing:

        * Open platform enabling helping developers speed time to market
          across a variety of infrastructures
        * Compliance with the Android Compatibility Test Suite (CTS),
          as well as
          `additional test suites <https://01.org/projectceladon/documentation/tutorials/test-strategy>`_
          on leading platforms and configurations
        * Functionality across a
          :ref:`variety of Intel hardware <run-as-service>`,
          including `Intel® NUC Kit NUC6CAYH <https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc6cayh.html>`_
        * Rich vertical solution configurations allowing for ease of
          scalability and extensibility across market segments


    .. list-table::
        :header-rows: 1

        * -
          - Celadon in VM
        * - | Operating
            | System
          - | Virtualized Celadon deployments include Celadon running
            | as a guest operating system in a virtual machine, in a
            | virtualized environment.
        * - | Security
            | & Isolation
          - | Running Celadon in a virtualized environment provides a
            | stronger separation between guest VMs and host VM, leading
            | to superior component isolation  vs containerized deployments.
        * - | Resource
            | Consumption
            | & Density
          - | Virtualized Celadon deployments run at moderate densities;
            | less than containerized deployments, but more than bare
            | metal deployments.

:Q:
    Can |C| still be run on bare metal?
:A:
    Intel supports VM and Container configurations for |C|. Users can potentially
    take the opensource |C| project and run in different configurations including
    Native.

    .. note::
        Users should be aware that test suites provided by Google may not
        pass with 100% scoring if deploying |C| on bare metal systems.
        While |C| in VM deployments are supported by `Google Mobile Services (GMS)
        <https://www.android.com/gms/>`_, Celadon on bare metal does not have
        GMS support. Dedicated use cases like retail, client, education and
        gaming do not need GMS. If there is a need for GMS while running
        |C| on bare metal, direct communication with Google will be necessary.

:Q:
    What are some example use cases and workload/applications that benefit from the new Celadon releases?
:A:
    `Digital Signage <https://01.org/projectceladon/digital-signage-solutions-android-intel-architectures>`_
    and Secure Payment solutions are ideal for virtualized deployments, due
    to the high security and scalability virtualized deployments provide.
    With Celadon in VM, however, developers and ISVs can continue utilizing
    Intel® hardware acceleration while having the flexibility to customize
    to the latest Android applications.

    Overall, virtualized and containerized workloads are pervasive.
    Customers demand support for each workload deployment type -
    particularly for Android workloads. The latest Celadon release allows
    developers and ISV's to consolidate workloads under one image, leading
    to boundless opportunities to provide broad market support.

:Q:
    Where can I learn more about Celadon in VM or Celadon in Containers?
:A:
    There are many ways users can learn more, starting with accessing
    release notes and `software <https://github.com/projectCeladon>`_.
    Users can learn more by subscribing to the
    `Project Celadon mailing list <https://lists.linuxfoundation.org/mailman/listinfo/celadon>`_.
    Mailing list subscribers are kept up to date on the latest Celadon
    releases, updates and tools. Subscribers are also invited to Project
    Celadon focused events, like our monthly
    `Technical Community Meetings <https://01.org/projectceladon/community#technical-community-meetings>`_, which provide a space for
    discussion around Celadon technical topics.

:Q:
    **What license(s) does |C| use?**
:A:
    |C| consists of permissive and copyleft licenses such as BSD, MIT,
    Apache and GPL licenses. Use, reproduction and distribution of
    components of |C| licensed under an open source software license are
    governed solely by the terms of that open source software license.
    Please refer and comply to the open source software license found in the
    source code files or repositories. Certain licenses such as Google
    Mobile Services or Widevine are not included in |C|.

:Q:
    **What Android desserts are supported in Celadon?**
:A:
    The latest Android dessert is supported as soon as Google publicly
    releases the dessert. Please see the :ref:`release-notes` for the latest
    supported desserts.

:Q:
    **Will the latest Celadon work on older hardware that was previously
    supported?**
:A:
    |C| supports a variety of reference platforms, in addition to being
    device independent. Developers have the option to use an older manifest
    file to build an image for previously supported hardware, but |C|'s main
    focus is enabling on the latest Intel platforms. As such, support on
    older platforms may be limited.

:Q:
    **How could I start adding software components to my own |C| build?**
:A:
    |C| follows the same practice as Android for adding software components
    to the build.

:Q:
    **I would like to contribute. Would Intel accept my contributions?**
:A:
    Yes, we welcome contributions! Since Intel is responsible for the
    product management and core stack of |C|, what ultimately is accepted is
    at the maintainers' discretion. We will determine if it's a good fit,
    then contributions will go through a review and verification process to
    maintain quality.
