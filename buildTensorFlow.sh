#!/bin/bash

source common.sh

# Build Tensorflow
cd $TF_HOME
bazel build -c opt --local_resources 3072,4.0,1.0 --verbose_failures --config=cuda //tensorflow/tools/pip_package:build_pip_package

