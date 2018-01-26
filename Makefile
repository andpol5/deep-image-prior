# The virtualenv requires bash.
SHELL = /bin/bash

BASEDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VENV := $(BASEDIR)pytorch/

install:
	sudo apt install -y python-pip python-dev python-virtualenv
	virtualenv pytorch
	. $(VENV)bin/activate &&pip install --upgrade pip
	. $(VENV)bin/activate &&pip install -r requirements.txt
	. $(VENV)bin/activate &&pip install http://download.pytorch.org/whl/cu80/torch-0.3.0.post4-cp27-cp27mu-linux_x86_64.whl
	. $(VENV)bin/activate &&pip install torchvision
