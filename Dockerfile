FROM python:3.9.1-slim-buster as pyinstaller
ARG PYTHON_FILE=my-script.py

RUN apt-get update \
 && apt-get install -qq -y binutils libc-bin wget xz-utils \
 && pip install pyinstaller

# Install upx for smaller binary
RUN wget -q -O /tmp/upx.tar.xz https://github.com/upx/upx/releases/download/v3.96/upx-3.96-i386_linux.tar.xz \
 && tar xvfJ /tmp/upx.tar.xz -C /tmp/ \
 && mv /tmp/*/upx /bin/ \
 && rm -rf /tmp/*

# Copy python-code and install requirements if file exists
WORKDIR /src
COPY ./ /src/
RUN if test -f "requirements.txt"; then pip install -r requirements.txt; fi

RUN pyinstaller --onefile $PYTHON_FILE



FROM ubuntu:latest
COPY --from=pyinstaller /src/dist/$PYTHON_FILE /bin/.

WORKDIR /
