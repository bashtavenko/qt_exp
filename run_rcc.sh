#!/bin/bash

FILE_BASE="hello_quickview"
rcc ${FILE_BASE}.qrc -o qt_generated/${FILE_BASE}_res.cc
