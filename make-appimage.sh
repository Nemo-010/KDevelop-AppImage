#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q kdevelop | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://invent.kde.org/kdevelop/kdevelop/-/raw/master/app/icons/256-apps-kdevelop.png?ref_type=heads
export DESKTOP=/usr/share/applications/org.kde.kdevelop.desktop
export STARTUPWMCLASS=kdevelop
export USE_HOST_DRIVERS_EXPERIMENTAL=1
export DEPLOY_KF=1

# kdevelop-python links libpython and gdb is built with python support
export DEPLOY_PYTHON=1

quick-sharun \
  /usr/bin/kdevelop \
  /usr/bin/kate \
  /usr/bin/konsole \
  /usr/bin/gdb \
  /usr/bin/lldb \
  /usr/bin/lldb-server \
  /usr/bin/lldb-mi \
  /usr/lib/liblldb.so* \
  /usr/bin/git \
  /usr/bin/cmake \
  /usr/bin/ctest \
  /usr/bin/ninja \
  /usr/bin/make \
  /usr/bin/cppcheck \
  /usr/bin/clazy-standalone \
  /usr/bin/astyle \
  /usr/bin/heaptrack \
  /usr/bin/heaptrack_gui \
  /usr/bin/clangd \
  /usr/bin/clang-tidy \
  /usr/bin/clang-format \
  /usr/lib/heaptrack \
  /usr/lib/clang \
  /usr/lib/kf6 \
  /usr/lib/libkdevphp* \
  /usr/lib/libkdevpython* \
  /usr/lib/libkomparediff2* \
  /usr/lib/libclang.so* \
  /usr/lib/libclang-cpp.so* \
  /usr/lib/libLLVM-*.so* \
  /usr/lib/libLLVM.so* \
  /usr/lib/qt6/plugins/kdevplatform \
  /usr/lib/qt6/plugins/konsoleplugins \
  /usr/lib/qt6/plugins/styles \
  /usr/lib/qt6/plugins/kstyle_config \
  /usr/lib/qt6/plugins/kiconthemes6 \
  /usr/share/kdevappwizard \
  /usr/share/kdevcodegen \
  /usr/share/kdevcodeutils \
  /usr/share/kdevfiletemplates \
  /usr/share/kdevgdb \
  /usr/share/kdevlldb \
  /usr/share/kdevmanpage \
  /usr/share/kdevplatform \
  /usr/share/kdevclangsupport \
  /usr/share/kdevelop \
  /usr/share/kdevphpsupport \
  /usr/share/kdevpythonsupport \
  /usr/share/kateproject \
  /usr/share/katexmltools \
  /usr/share/color-schemes \
  /usr/share/icons/breeze \
  /usr/share/icons/breeze-dark \
  /usr/share/kstyle \
  /usr/share/kglobalaccel \
  /usr/share/org.kde.syntax-highlighting \
  /usr/share/qt6/resources

# quick-sharun auto-deploys the whole Qt qml dir, which drags in the
# QtQuick3D/SpatialAudio module that comes with qt6-multimedia. Nothing in
# KDevelop imports QtQuick3D, and the plugin's library is not bundled
# either, so the module can never load: drop it.
rm -rf ./AppDir/lib/qt6/qml/QtQuick3D

# gdb's own hook, kept out of ADD_HOOKS since that is for quick-sharun's
# bundled hooks only
mkdir -p ./AppDir/bin
cp ./gdb-python.hook ./AppDir/bin

mkdir -p ./AppDir/share/applications
cp /usr/share/applications/org.kde.kate.desktop    ./AppDir/share/applications
cp /usr/share/applications/org.kde.konsole.desktop ./AppDir/share/applications

quick-sharun --make-appimage

quick-sharun --simple-test ./dist/*.AppImage
