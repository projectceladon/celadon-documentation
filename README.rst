Documentation Build Instructions
################################

The documentation for the Celadon Project should be written in
:abbr:`ReStructuredText (ReST)` AKA ``.rst``, which makes it easy to build
parsable, command-line readable, indexed, and search-friendly documentation
and APIs with `Sphinx`_.

.. _requirements:

Requirements
============

To build documentation with Sphinx, ensure your system has these
prerequisites:

* `GNU make`_
* `Python`_
* `PIP`_
* `Sphinx`_

The instructions for installing these varies according to OS. On a basic out-
of-the-box Ubuntu\*-like OS (which usually has Python\* installed by
default), check your python version using commands similar to the following:

.. code-block:: console

   $ sudo apt-get install python-pip
   $ sudo pip install -U sphinx sphinx-autobuild



.. code-block:: console

   $ python -c 'print __import__("sphinx").__version__'
     1.3.1

Cloning the documentation repository
====================================

After confirming that Sphinx and Python are installed, clone the Gitlab
repository to your local machine:


.. code-block:: console

   $ git clone https://github.com/projectceladon/projectceladon-documentation.git

Run make
========

First, :command:`cd` to the :file:`source/` directory that contains your
``.rst`` files.
Then run :command:`make html` or the doc format of your choice.

.. code-block:: console

   $ make html
   >
   sphinx-build -b html -d _build/doctrees   . _build/html
   Running Sphinx v1.3.1
   making output directory...
   .
   .
   .
   build succeeded, 0 warnings.

   Build finished. The HTML pages are in _build/html.

Open one of the .html pages in a web browser to view the rendered
documentation.

For tips on how to contribute documentation formatted in the .rst style
needed to integrate beautifully on the Celadon website, please see
 `reStructuredText Primer`_.



.. _Sphinx: http://sphinx-doc.org/
.. _GNU make: https://www.gnu.org/software/make/
.. _Python: https://www.python.org/
.. _PIP: https://pypi.python.org/pypi/pip/
.. _reStructuredText Primer: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html
