#!/usr/bin/env bash

# install prerequisites
export DEBIAN_FRONTEND=noninteractive
apt update && apt-get install --assume-yes build-essential libpng-dev zlib1g-dev curl pigz

# get the latest jpegoptim release link
JPEGOPTIMLATEST=$(curl -sL github.com/tjko/jpegoptim/releases | grep tar.gz | awk -F '["]' '{print $4}')

# go into /usr/local/src and remove previous jpegoptim folder/archive
cd /usr/local/src || exit 1
rm -rf jpegoptim*

# download and extract jpegoptim
curl -sL "$JPEGOPTIMLATEST" | tar -I pigz -xf -
cd jpegoptim-* || exit 1

# configure and compile jpegoptim
./configure --prefix=/usr
make -j "$(nproc)"
strip --strip
make install