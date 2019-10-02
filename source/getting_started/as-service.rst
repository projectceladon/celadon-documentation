.. _run-as-service:

Run Project |C| on Intel® architectures
=======================================

The idea of **CaaS (Celadon as a Service)** is to run |C| as a service seamlessly on Intel Bare Metal systems, Virtual Machines, and Containers based on an unified software architecture. The architecture of CaaS is designed to fully compliant with the Google Android `CDD <https://source.android.com/compatibility/cdd>`_, and allows the scalability and extensibility for flexible customizations at the same time.

With CaaS, Android transitioned from a platform specific OS to a generic OS which provides leapfrog competition, accelerates workload consolidation, and drives high compute demands.

The following diagram shows the overall CaaS software architecture. The *Auto Adaptation Framework (AAF)* is the key component introduced to automatically detect and bind the kernel drivers, load the HAL modules and configurations for a variety of devices exposed on different Bare Metal systems and virtual platforms. Therefore, when you run Android on Bare Metals, VMs, and Containers, they are all served by a single image with an unified architecture.

.. figure:: images/caas-architecture.png
    :align: center

.. note::
   The CaaS is currently under early development. This is an early Pre-Production CaaS and |C| in Container (CIC) Release for evaluation and development purposes.

.. toctree::
   :maxdepth: 1

   on-bm
   on-vm
   on-container
