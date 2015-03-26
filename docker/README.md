# Docker for FEniCS

We currently offer 3 versions:

* `stable`: This is recommended for most users. It contains the current
  stable FEniCS binaries from official PPA. The download size is 2.4G.
* `git`: This is for users looking for bleeding edge features. It
  contains the FEniCS binaries built from git source on a weekly basis. The
  download size is 2.6G for the first time and 1.0G for subsequent updates.
* `dev`: This is for developers of FEniCS or users who want to study or
  modify the source code of FEniCS. This can also serve as a way to get the
  git version with a smaller download size. It contains all the
  dependencies and a script to build FEniCS. The download size is 1.7G.

`stable` is the default choice. To choose other version, edit the beginning
of the script `fenics` and change `VERSION=stable`.

To use fenics, simply execute `./fenics`. The GUI is enabled by default. To
run CLI-only, pass the "-c" option.
