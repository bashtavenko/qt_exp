#!/bin/bash
# Run this if any QML files changes.

rcc -name combined combined.qrc -o qt_generated/combined_res.cc

