#!/usr/bin/env bash

# How to return current python version/build information?

python -c "import platform; print(platform.python_version())"
python -c "import platform; print(platform.python_version_tuple())"
python -c "import sys; print(sys.version)"
python -c "import sys; print(sys.version_info)"

python -c "print(__import__('platform').python_version())"
python -c "print(__import__('platform').python_version_tuple())"
python -c "print(__import__('sys').version)"
python -c "print(__import__('sys').version_info)"
