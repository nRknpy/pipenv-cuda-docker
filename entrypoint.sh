#!/bin/bash

pipenv --venv > /dev/null || pipenv install

if [[ -z "${VIRTUAL_ENV}" ]]; then
    pipenv shell
fi