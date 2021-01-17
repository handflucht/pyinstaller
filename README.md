# pyinstaller
Turns your python-app into a single binary which can be executed on its own using `pyinstaller` running in a container.

## Introduction
A multistage-build is used, the final image is a clean `ubuntu` with your binary added to the `bin`-folder.

## Usage
Lets assume the following directory structure:
```
 |---projects
     |---projectA
         |---main.py
         |---requirements.txt
```


The following steps will convert the `main.py` into a binary. This binary will also contain the dependencies of the `main.py` as define in the `requirements.txt`.

1. Clone this repo
   ```
    cd /projects
    git clone git@github.com:handflucht/pyinstaller.git
   ```

   This will lead to the following directory-structure:
   ```
    |---projects
        |---projectA
            |---main.py
            |---requirements.txt
        |---pyinstaller
            |---Dockerfile
    ```

2. Change into the dir where your python-code exists to have the correct context:
   ```
   cd /projects/projectA
   docker build --build-arg PYTHON_FILE=main.py -f ../pyinstaller/Dockerfile -t pyinstaller:latest .
   ```
   
3. Execute your binary:
   ```
   docker run --rm pyinstaller
   ```