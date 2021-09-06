#!/bin/bash

# <output_dir>/webrtc に WebRTC ライブラリが配置される
# ダウンロードしたファイルは <source_dir>/ に配置される
if [ $# -lt 4 ]; then
  echo "$0 <webrtc_build_version> <package_name> <output_dir> <source_dir>"
  exit 1
fi

WEBRTC_BUILD_VERSION=$1
PACKAGE_NAME=$2
OUTPUT_DIR=$3
SOURCE_DIR=$4

set -ex

if [ ! -e $SOURCE_DIR/webrtc.${PACKAGE_NAME}.${WEBRTC_BUILD_VERSION}.tar.gz ]; then
  # https://github.com/shiguredo-webrtc-build/webrtc-build/actions/runs/1201140003
  curl -Lo $SOURCE_DIR/webrtc.${PACKAGE_NAME}.${WEBRTC_BUILD_VERSION}.tar.gz https://github.com/shiguredo-webrtc-build/webrtc-build/suites/3682956537/artifacts/89734655
fi

pushd $OUTPUT_DIR
  tar xf $SOURCE_DIR/webrtc.${PACKAGE_NAME}.${WEBRTC_BUILD_VERSION}.tar.gz
popd
