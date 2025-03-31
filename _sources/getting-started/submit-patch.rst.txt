.. _submit-patch:

Submit your patches
===================

|C| uses `GitHub Pull-Requests <https://help.github.com/articles/about-pull-requests/>`_ (PR) to submit and review code submissions. You are required to be aware of the software repository and branch in the |C| source tree where your code is contibuted before submitting any changes.

|C| GitHub Manifest Structure
-----------------------------

|C| source code consists of multiple repositories (i.e. "**projects**"), the manifest file *.repo/manifests/default.xml* contains the information needed (i.e. "**remotes**") to fetch those repositories. It includes the following files to instruct the ``repo`` command to compose the |C| source tree:

.. list-table::
   :widths: 5 10


   * - include/aosp_vanilla.xml
     - This is vanilla AOSP code based on
       `refs/tags/android-10.0.0_rN` for CiV builds
   * - include/remove-android_ia.xml
     - The repositories to be removed from the AOSP code
   * - include/bsp-celadon.xml
     - The BSP source code customized for |C|

To get the **remote** in order to upload code, use the following command:

.. code-block:: bash

   $ git remote -v

The following table lists the *remote* aliases supported by |C|:

=========  ========================================
github     Good-to-go with the GitHub PR push process
aosp       Create a google_diff patch & in-parallel
           up-stream to aosp
kernelorg  Upstream to kernel.org
graphics   Upstream to graphics remote
intel      Upstream to intel remote
trusty-ia  Upstream to trusty-ia remote
=========  ========================================

Further, you can enter the following commands to identify which branch the source head points to:

.. code-block:: bash

   $ git remote show <remote-alias> | grep 'HEAD branch:'

|C| Branching Strategy
----------------------

There is a *master branch* and *stable branch* for some of |C| repositories. Make developer changes on the master branch. The CoE (i.e. Center of Excellence) lead of the repo pulls them from the master branch to the stable branch once it is stabilized. Please review the manifest include file *.repo/manifests/include/bsp-celadon.xml*, which tells the branch info that the project source code is branched off. For example, the source code of the *art-extenstion* project and *trusty* projects are based on the stable branch and master branch respectively:

.. code-block:: bash

   ...
   <project name="vendor_intel_art-extension" path="vendor/intel/art-extension" remote="github" revision="stable"/>
   ...
   <project name="trusty_external_headers" path="trusty/external/headers" remote="trusty-ia" revision="master"/>
   <project name="trusty_external_lk" path="trusty/external/lk"  remote="trusty-ia" revision="master">
   ...

Submit Patches
--------------

Once you determine which remote repository to fetch the original source code from and which branch the software has branched off of, you can set up a local workspace. Do this by `cloning the source repository <https://help.github.com/articles/fork-a-repo>`_ on your computer. If you would like to propose changes to any non-AOSP project repository, `create a Pull Request <https://help.github.com/articles/creating-a-pull-request-from-a-fork>`_, and send the URL of the PR to the domain owners for review. You may revise and `update the submitted PRs <https://help.github.com/articles/changing-a-commit-message>`_ to address any review feedback from the domain owners.

We recommend you create commit messages in the following format when you submit your code to |C|:

.. code-block:: none

   [CELADON] <One Line Summary>

   <Description>

   Tracked-On:
   Signed-off:

Submit AOSP Patches
~~~~~~~~~~~~~~~~~~~

Patches against the AOSP project source code use a different approach. Complete the following steps to create your *google_diff* patch set to make any changes on an AOSP project.

#. Clone the AOSP project to your local workspace. Make your changes and create your commit messages in the workspace.

#. Generate the patch set using the following command, where *n* is the number of commits added in the previous step.

   .. code-block:: none

      $ git format-patch HEAD~<n>

#. Copy the patch files generated in the previous step to the *vendor/intel/utils/aosp_diff/* folder in the |C| source tree according to the following guidelines. Maintain the patch number in sequence and create the previous folder if it does not exist.

    * If the patch file is to make changes to the following areas in the common AOSP code (i.e. applicable to all hardware and no product dependency), move the patch file to the 'vendor/intel/utils/aosp_diff/**preliminary**/' folder.

        #. Patches for CTS/VTS
        #. Patches for AOSP build
        #. Patches for AOSP major feature enabling
        #. Patches proposed by COE for upstream

    * Otherwise, move the patch file to the 'vendor/intel/utils/aosp_diff/**<target_product>**/' folder.
