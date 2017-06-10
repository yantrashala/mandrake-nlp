#!bin/bash

cd /app/docs
pip install sphinx
pip install sphinx_rtd_theme
make html
cd /app
