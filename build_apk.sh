#!/bin/bash


GITHUB_USER=${1:-hernad}

ANDROID_PROJECT=H4-android
APK_DIR=/build/$GITHUB_USER/$ANDROID_PROJECT/vector/build/outputs/apk


mkdir /build/$GITHUB_USER
cd /build/$GITHUB_USER

git clone https://github.com/$GITHUB_USER/$ANDROID_PROJECT.git


cd $ANDROID_PROJECT
git checkout bringout -f
git pull
git log -1

./gradlew assembleDebug
ls $APK_DIR
cp -av $APK_DIR/* /apk

ls $APK_DIR
./gradlew assembleRelease
cp -av $APK_DIR/* /apk


