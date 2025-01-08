#!/bin/bash

FILE_BASE="hello"
rcc ${FILE_BASE}.qrc -o qt_generated/${FILE_BASE}_res.cc
