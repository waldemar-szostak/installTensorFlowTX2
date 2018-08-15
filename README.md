# installTensorFlowTX2

Install TensorFlow v1.9 on NVIDIA Jetson TX2 Development Kit

It is assumed that your Jetson TX2 is flashed with JetPack 3.2.1 which installed:
* L4T 28.2.1 an Ubuntu 16.04 64-bit variant (aarch64)
* CUDA 9.0
* cuDNN 7.0.5

Moreover, I adjusted my scripts to work with my workspace containing:
- 'tensorflow' directory: a clone of my TensorFlow repository: https://github.com/waldemar-szostak/tensorflow (basically it contains any patches needed for the platform) with the branch v1.9 already checked out,
- a clone of this repository.

### Pre-built installation

If you are only interested in installing Tensorflow on the TX2, pre-built wheel files are available here: https://github.com/jetsonhacks/installTensorFlowJetsonTX
See that website also if you want to build TF from source for Python 2.

If you are interested in building from source for Python 3, read on.

### Preparation
Before installing TensorFlow, a swap file should be created (minimum of 8GB recommended). The Jetson TX2 does not have enough physical memory to compile TensorFlow. The swap file may be located on the internal eMMC, and may be removed after the build.

There is a convenience script for building a swap file. To build a 8GB swapfile on the eMMC in the home directory:

$ ./createSwapfile.sh -d ~/ -s 8

After TensorFlow has finished building, the swap file is no longer needed and may be removed.


These scripts support Python 3.
TensorFlow should be built in the following order:

#### installPrerequisitesPy3.sh
Installs Java and other dependencies needed. Also builds Bazel and copies it into /usr/local/bin/ .

#### setTensorFlowEVPy3.sh
Sets up the TensorFlow environment variables. This script will ask for the default python library path. There are many settings to chose from, the script picks the usual suspects. It uses Python 3.

## Build TensorFlow
Once the prerequisites have been installed and the environment configured, it is time to build TensorFlow itself.

#### buildTensorFlow.sh
Builds TensorFlow.

#### packageTensorFlow.sh
Once TensorFlow has finished building, this script may be used to create a 'wheel' file, a package for installing with Python. The wheel file will be in the $HOME directory.

#### Install wheel file
For Python 3.X

$ pip3 install $HOME/<em>wheel file</em> 


### Notes
See the original repository by JetsonHacks for Python 2 support.

This TensorFlow installation procedure was derived from these discussion threads: 

<ul>
<li>https://github.com/tensorflow/tensorflow/issues/851</li>
<li>http://stackoverflow.com/questions/39783919/tensorflow-on-nvidia-tx1/</li>
<li>https://devtalk.nvidia.com/default/topic/1000717/tensorflow-on-jetson-tx2/</li>
<li>https://github.com/tensorflow/tensorflow/issues/9697</li>
</ul>

## License
MIT License

Copyright (c) 2017 Jetsonhacks

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
