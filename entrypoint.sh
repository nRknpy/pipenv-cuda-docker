#!/bin/bash

pipenv --venv > /dev/null || pipenv --python 3.11

if [[ -z "${VIRTUAL_ENV}" ]]; then
    pipenv shell
fi