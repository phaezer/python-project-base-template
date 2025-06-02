#!/bin/bash

# make sure poetry is installed
if ! command -v poetry &> /dev/null; then
    echo "poetry could not be found, please install it"
    exit 1
fi

# make sure virtualenv is installed
if ! command -v virtualenv &> /dev/null; then
    echo "virtualenv could not be found, please install it"
    exit 1
fi

# Create a virtual environment for the project using python 3.12
if [ ! -d "venv" ]; then
    virtualenv venv --python=python3.12
else
    echo "virtual environment already exists"
fi

# Activate the virtual environment
source venv/bin/activate

# install dependencies
poetry install

# install pre-commit hooks
pre-commit install
