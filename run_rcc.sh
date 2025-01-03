#!/bin/bash

QT_QML_SRC="hello.qml"
QT_QML_RC="hello.qrc"
QT_GENERATED_SRC="hello_qml.cc"
BAZEL_RULE="generate_qrc"

bazel build //:$BAZEL_RULE
cp $QT_QML_SRC bazel-bin
rcc bazel-bin/$QT_QML_RC -o qt_generated/$QT_GENERATED_SRC
