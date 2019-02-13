.. _submit-patch:

Submit your patches
===================

|C| uses `GitHub Pull-Requests <https://help.github.com/articles/about-pull-requests/>`_ (PR) to submit and review code submissions. You are required to be aware of the software repository and branch in |C| source tree where your code is contirbuting before submitting any changes.

|C| GitHub Manifest Structure
-----------------------------

|C| source code consists of multiple repositories ("**projects**"), the manifest file *.repo/manifests/default.xml* contains the information where ("**remotes**") to fetch those repositories. It includes the following files to instruct the ``repo`` command how to compose the |C| source tree:

=============================  =============================================================
include/aosp_vanilla.xml       This is vanilla AOSP code base on refs/tags/android-9.0.0_r18
include/remove-android_ia.xml  The repositories to be removed from the AOSP code
include/bsp-celadon.xml        The BSP source code customized for |C|
=============================  =============================================================

Use the following command to get the *remote* where you are trying to upload code:

.. code-block:: bash

   $ git remote -v

The following table lists the *remote* aliases supported by |C|:

=========  ========================================
github     Good to go with github PR push process
aosp       Create a google_diff patch & in-parallel
           up-stream to aosp
kernelorg  Upstream to kernel.org
graphics   Upstream to graphics remote
intel      Upstream to intel remote
trusty-ia  Upstream to trusty-ia remote
=========  ========================================

You can further enter the following command to identify which branch the source head is pointing to:

.. code-block:: bash

   $ git remote show <remote-alias> | grep 'HEAD branch:'

|C| Branching Strategy
----------------------

There are *master branch* and *stable branch* for some of |C| repositories. Developers should make changes on the master branch, the CoE (Center of Excellence) lead of the repo will pull them from the master branch to the stable branch once it is stabilised. Please review the manifest include file *.repo/manifests/include/bsp-celadon.xml*, which tells the branch info that the project source code is branched off. For example, the source code of *art-extenstion* project and *trusty* projects are based on the stable branch and master branch respectively:

.. code-block:: bash

   ...
   <project name="vendor_intel_art-extension" path="vendor/intel/art-extension" remote="github" revision="stable"/>
   ...
   <project name="trusty_external_headers" path="trusty/external/headers" remote="trusty-ia" revision="master"/>
   <project name="trusty_external_lk" path="trusty/external/lk"  remote="trusty-ia" revision="master">
   ...

Submit Patches
--------------

Once you figured out the remote repo to fetch the original source code, and which branch the software is branched off, you can set up a local workspace by `cloning the source repository <https://help.github.com/articles/fork-a-repo>`_ on your computer. If you'd like to propose changes to any non-AOSP project repository, you need to `create a Pull Request <https://help.github.com/articles/creating-a-pull-request-from-a-fork>`_, and send the URL of the PR to the domain owners for review. You may revise and `update the submitted PRs <https://help.github.com/articles/changing-a-commit-message>`_ to address the review feedbacks from the domain owners if any.

It's recommended to create commit messages in the following format while submitting your code to |C|:

.. code-block:: none

   [CELADON] <One Line Summary>
   
   <Description>
   
   Tracked-On:
   Signed-off:

Submit AOSP Patches
~~~~~~~~~~~~~~~~~~~

Patches against AOSP project source code use different approach. Follow below steps to create your *google_diff* patch set if you need to make changes on any AOSP project.

#. Clone the AOSP project to your local workspace, make changes and create commit messages in the workspace.

#. Generate the patch set using the following command, where *n* is the number of commits added in the previous step.

   .. code-block:: none

      $ git format-patch HEAD~<n>

#. Copy the patch files generated in the previous step to the *vendor/intel/utils/android_p/google_diff/<target_product>/<aosp-repo>/* folder in the |C| source tree. You should maintain the patch number in sequence, and create the above folder if it doesn't exist.
