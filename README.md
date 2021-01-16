# pyinstaller
Turns your python-app into a single binary which can be executed on its own using `pyinstaller` running in a container.

## Introduction
A multistage-build is used, the final image is a clean `ubuntu` with your binary added to the `bin`-folder.

## Usage
1. Clone this repo

2. Change into the dir where your python-code exists to have the correct context:
   ```
   docker build --build-arg PYTHON_FILE=your-python-file.py -t my-python
   ```
   
3. Execute your binary:
   ```
   docker run --rm my-python
   ```