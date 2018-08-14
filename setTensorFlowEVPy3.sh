#!/bin/bash

source common.sh

cd $TF_HOME

# TensorFlow couldn't find include file for some reason
# TensorFlow expects it in /usr/lib/aarch64-linux-gnu/include/cudnn.h
sudo mkdir /usr/lib/aarch64-linux-gnu/include/
sudo cp /usr/include/cudnn.h /usr/lib/aarch64-linux-gnu/include/cudnn.h

source ./configure
