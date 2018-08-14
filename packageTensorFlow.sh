#!/bin/bash
source common.sh

CURRENT_DIR=$PWD
cd $TF_HOME
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
mv /tmp/tensorflow_pkg/tensorflow-*.whl $CURRENT_DIR/

