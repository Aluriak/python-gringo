python-gringo
=============

Download, activate the virtualenv of your choice, then::

  python2 setup.py sdist
  pip2 install dist/gringo-*.tar.gz

Or, for python3::

  python3 setup.py sdist
  pip3 install dist/gringo-*.tar.gz

This solution includes the whole clingo source [1]_. It should be fairly simple
to swap in a new version, just be sure to set up build/release.py correctly.

.. [1] http://sourceforge.net/projects/potassco/files/clingo/4.5.0/
