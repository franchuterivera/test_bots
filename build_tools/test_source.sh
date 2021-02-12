#!/bin/bash

set -e
set -x

# Test the distribution on an isolated venv
# Directory structure is such that
# PWD=test_bots/test_bots/<repo>
cd ../../

python -m venv test_env
source test_env/bin/activate

python -m pip install pytest "numpy<=1.19"
python -m pip install test_bots/test_bots/dist/*.tar.gz

pytest test_bots/test_bots/tests/pyrfr_unit_test_binary_regression_forest_transformed_data.py
