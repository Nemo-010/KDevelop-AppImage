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

mkdir -p ./AppDir/share/applications
cp /usr/share/applications/org.kde.kate.desktop    ./AppDir/share/applications
cp /usr/share/applications/org.kde.konsole.desktop ./AppDir/share/applications

quick-sharun --make-appimage

quick-sharun --simple-test ./dist/*.AppImage
