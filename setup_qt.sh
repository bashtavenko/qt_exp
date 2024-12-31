#!/bin/bash
# setup_qt.sh

QT_DIR="third_party/qt"

if [ ! -L "$QT_DIR/include" ] || [ ! -e "$QT_DIR/include" ]; then
    mkdir -p "$QT_DIR"
    ln -sf /usr/include/x86_64-linux-gnu/qt6/ "$QT_DIR/include"
    ln -sf /usr/lib/x86_64-linux-gnu/libQt6*.so "$QT_DIR/"
fi