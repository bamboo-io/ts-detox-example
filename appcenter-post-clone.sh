#!/usr/bin/env bash
# 
# Software versions to install:-
APPLESIMUTILS_VERSION=0.5.22
#NODE_VERSION=8.11.3

echo "Environment Variables' Values:-"
echo "APPCENTER_SOURCE_DIRECTORY = $APPCENTER_SOURCE_DIRECTORY"
echo "APPCENTER_OUTPUT_DIRECTORY = $APPCENTER_OUTPUT_DIRECTORY"
echo "APPCENTER_TRIGGER = $APPCENTER_TRIGGER"
echo
echo "APPCENTER_XCODE_PROJECT = $APPCENTER_XCODE_PROJECT"
echo "APPCENTER_XCODE_SCHEME = $APPCENTER_XCODE_SCHEME"
echo "APPCENTER_ANDROID_VARIANT = $APPCENTER_ANDROID_VARIANT"
echo "APPCENTER_ANDROID_MODULE = $APPCENTER_ANDROID_MODULE"

echo "APPCENTER_REACTNATIVE_PACKAGE = $APPCENTER_REACTNATIVE_PACKAGE"
echo "--------------------------------------------------------------"
set | grep APPCENTER
echo "--------------------------------------------------------------"

if [ "$MOBILE_OS" == "ios" ]; then
  echo "Installing applesimutils..."
  mkdir simutils
  cd simutils
  curl https://raw.githubusercontent.com/wix/homebrew-brew/master/AppleSimulatorUtils-${APPLESIMUTILS_VERSION}.tar.gz -o applesimutils.tar.gz
  tar xzvf applesimutils.tar.gz
  sh buildForBrew.sh .
  cd ..
  export PATH=$PATH:./simutils/build/Build/Products/Release
fi

echo "Installing correct node version..."
export HOMEBREW_NO_AUTO_UPDATE=1
brew uninstall node@6
brew install node@8
brew link node@8 --force --overwrite

echo "Display version of Node.js installed by brew"
node --version

echo "Installing dependencies for the App..."
yarn install

echo "Installing dependencies for detox tests..."
ls -lh e2/
cd e2e
npm install

echo "Building the project for Detox tests..."
yarn build:${MOBILE_OS:-ios}

echo "Executing Detox tests..."
yarn test:${MOBILE_OS:-ios}:ci

