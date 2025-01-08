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

The easiest way of setting up QT on Ubuntu with Bazel integration

1. ```
   sudo apt update
   sudo apt install qt6-base-dev qt6-tools-dev \
    qt6-tools-dev-tools qt6-base-examples \
    qtbase6-doc-html qt6-declarative-dev \
    qt6-declarative-dev-tools
   ``` 
2. `./setup_qt`
3. Adjust `copts` if needed

The other types of installing QT through online installer or through sources is problematic.
Qt must be installed under `/usr` and not under `/usr/local` or home directory the reason being is that
Bazel `copts` requires `\usr` directory (or maybe `opts`, I haven't tried that) and not home directory and even not `/usr/local`.
 
With this setup it is the simplest and the most straightforward way to integrate with Bazel.

## Integration QML with Bazel

Quick and dirty solution is to [run_rcc.sh](run_rcc.sh) before main binary which generates 
resource file stub. It requires qml file be a part of binary data. 

