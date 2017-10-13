#!/bin/bash

set -x
set -e

XTENSA_BUILD="xtensa-esp32-elf-linux64"

# Install dependencies
apt-get update
apt-get install -y --no-install-recommends build-essential libncurses-dev flex bison gperf python python-serial

# Prepare file locations
mkdir -p /opt/esp
cd /opt/esp

# Download esp-idf
git clone --recursive https://github.com/espressif/esp-idf.git

# Download xtensa build tools (Change with new version)
URL="$(grep "htt.*${XTENSA_BUILD}.*\.tar\.gz" esp-idf/docs/get-started/linux-setup.rst | tr -d " \t")"

wget -O xtensa.tar.gz $URL
tar -xzf xtensa.tar.gz
rm xtensa.tar.gz

# Setup file owners
chown -R project.project /opt/esp

# Copy runtime files
cp -frv /build/files/* / | true

# Setup environment
echo 'export PATH="$PATH:/opt/esp/xtensa-esp32-elf/bin"' >> /home/project/.bashrc
echo 'export IDF_PATH="/opt/esp/esp-idf"' >> /home/project/.bashrc

# Allow project user to use /dev/tty.USB devices
usermod -a -G dialout project

# Clean up APT when done.
source /usr/local/build_scripts/cleanup_apt.sh

