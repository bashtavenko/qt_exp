# qt_exp
Bootstrapping QT into Bazel

## TLDR
1. Install QT if it does not exist.
2. Run `setup_qt.sh`
3. `bazel build //...`

## Hermetic on not
Integrating a moderate size repo with CMake or makefile is relatively easy - [example](https://github.com/bashtavenko/sudoku/blob/main/BUILD.bazel#L18).
QT is quite different. It has multiple submodules and configuration. For configuration and build
is still needs certain dependencies on the machine. 

I do not know how a full hermetic QT build in Bazel would even work. But if it does then
the build would take considerable time. But even if such a build succeeds, there is a need for 
QT goodies on the local machine, and so what's the point of hermetic build?

## Self-hermetic
Given an existing QT installation on local machine, it is just a matter of setup symlinks to include and shared libraries.
To make symlinking before build ended up tricky. Bazel `genrule` wants to list all include files and not just a directory.
There are other multiple ways other than `genrule` but it quickly became convoluted. 
