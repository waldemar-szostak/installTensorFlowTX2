#!/bin/bash

source common.sh

# Build Tensorflow
cd $TF_HOME
bazel build --linkopt='-lrt' -c opt --local_resources 3072,7.0,1.0 --verbose_failures --config=cuda //tensorflow/tools/pip_package:build_pip_package

