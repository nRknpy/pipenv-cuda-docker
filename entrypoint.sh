#!/bin/bash

echo $PYTHON_VERSION
pipenv --venv > /dev/null || { pyenv local $PYTHON_VERSION ; pipenv install --python $PYTHON_VERSION; }

if [[ -z "${VIRTUAL_ENV}" ]]; then
    pipenv shell
fi
