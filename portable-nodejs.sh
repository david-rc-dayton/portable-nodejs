#!/usr/bin/env bash

################################################################################
# portable-nodejs - create portable node.js runtimes for win32                 #
# Copyright (c) 2016 David RC Dayton                                           #
################################################################################

set -e

if [ $# -eq 0 ]
then
    echo ""
    echo "NodeJS version not provided, e.g:"
    echo ""
    echo "    portable-nodejs 6.5.0"
    echo ""
    exit 1
fi

NODE_VERSION=${1}

TEMP=$(mktemp -d -u)
ARCHIVE=node-v${NODE_VERSION}-linux-x86.tar.gz
CHECKSUM=SHASUMS256.txt
FOLDER=$(basename ${ARCHIVE} .tar.gz)
BINARY=win-x86/node.exe
OUTPUT=nodejs-v${NODE_VERSION}-win32

function cleanup {
    echo "" && echo "Performing cleanup actions..."
    rm -rf ${TEMP}
    echo "" && echo "---- DONE ----" && echo ""
}
trap cleanup EXIT

echo "" && echo "Setting up build environment..."
mkdir -p ${TEMP}
chmod 700 ${TEMP}
cd ${TEMP}

echo "" && echo "Downloading SHA256 Checksums:"
curl "https://nodejs.org/dist/v${NODE_VERSION}/${CHECKSUM}" > ${CHECKSUM}

echo "" && echo "Downloading NodeJS archive: ${ARCHIVE}"
curl "https://nodejs.org/dist/v${NODE_VERSION}/${ARCHIVE}" > ${ARCHIVE}

echo "" && echo "Downloading NodeJS binary: ${BINARY}"
mkdir -p $(dirname ${BINARY})
curl "https://nodejs.org/dist/v${NODE_VERSION}/${BINARY}" > ${BINARY}

echo "" && echo "Checking file integrity..."
sha256sum -c --ignore ${CHECKSUM}

tar -xf ${ARCHIVE}
mv ${FOLDER} nodejs

echo "" && echo "Adjusting file structure..."
mv nodejs/lib/node_modules nodejs/
mv win-x86/node.exe nodejs/
cp nodejs/node_modules/npm/bin/npm nodejs/
cp nodejs/node_modules/npm/bin/npm.cmd nodejs/
rm -rf nodejs/bin nodejs/include nodejs/lib nodejs/share

echo "" && echo "Creating standalone archive: ${OUTPUT}.tar.gz"
cd - > /dev/null
tar -C ${TEMP} -c nodejs | gzip > ${OUTPUT}.tar.gz
gzip -lv ${OUTPUT}.tar.gz
gzip -tv ${OUTPUT}.tar.gz
