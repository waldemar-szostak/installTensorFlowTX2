#!/bin/bash

source common.sh

# Install TensorFlow dependencies
# Install Java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

# Install other dependencies
sudo apt-get install zip unzip autoconf automake libtool curl zlib1g-dev maven -y

# Install Python 3.x
sudo apt-get install python3-numpy swig python3-dev python3-pip python3-wheel -y

# Install Bazel
# We use the release distribution so that we don't have to build protobuf

cd /tmp
wget --no-check-certificate https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-dist.zip
unzip bazel-$BAZEL_VERSION-dist.zip -d bazel-$BAZEL_VERSION-dist
sudo chmod -R ug+rwx bazel-$BAZEL_VERSION-dist

# git clone https://github.com/bazelbuild/bazel.git

cd bazel-$BAZEL_VERSION-dist
./compile.sh 

# In my case this directory was missing..
sudo mkdir /usr/local/bin &> /dev/null

sudo cp output/bazel /usr/local/bin/
