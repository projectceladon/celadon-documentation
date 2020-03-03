.. _run-as-service:

Run Project |C| on Intel® architectures
=======================================

The following diagrams illustrate the overall |C| software architecture.
|C| is designed to be fully compliant with Google* Android* compatibility definitions,
ensuring affinity and security of applications running on the stack.
The *Auto Adaptation Framework* (**AAF**) is the key component that makes Celadon unique.
It automatically detects and binds system kernel drivers, and loads
the :abbr:`HAL (Hardware Abstraction Layer)` modules and configurations
for a variety of devices exposed on Intel platforms.
Therefore, whether running Android applications in virtual machines (VMs)
or containers, they are all served by a single Celadon image with a unified
architecture, accelerating development of broad workload consolidation
use cases from Edge to Cloud.

.. figure:: images/civ-cic-arch-combined.png
    :align: center

.. note::
   The :abbr:`CiV (Celadon in VM)` and :abbr:`CiC (Celadon in Container)`
   are currently under early development. This is an early Pre-
   Production CiV and CiC Release for evaluation and development purposes.

.. toctree::
   :maxdepth: 1

   on-vm
   on-container
