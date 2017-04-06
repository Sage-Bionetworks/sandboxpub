#!/usr/bin/env bash

# Script is from https://github.com/fastlane/fastlane/issues/3188
#
#
# Original credit to @izqui

set -x
set -eou

pushd "$TMPDIR"

sudo security delete-certificate -c "Apple Worldwide Developer Relations Certification Authority" /Library/Keychains/System.keychain
curl -O -L http://developer.apple.com/certificationauthority/AppleWWDRCA.cer
sudo security import AppleWWDRCA.cer -k /Library/Keychains/System.keychain -A
sudo security import AppleWWDRCA.cer -k ~/Library/Keychains/login.keychain -A

popd
