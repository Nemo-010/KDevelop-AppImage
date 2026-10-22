#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    kdevelop          \
    kdevelop-php      \
    kdevelop-python   \
    libkomparediff2   \
    kate              \
    konsole           \
    purpose           \
    qt6-tools         \
    qt6-webengine     \
    qt6-5compat       \
    syntax-highlighting \
    breeze            \
    breeze-icons      \
    qt6ct             \
    kvantum           \
    lxqt-qtplugin     \
    gdb               \
    clang             \
    clang-libs        \
    python            \
    make              \
    ninja             \
    cmake             \
    git               \
    cppcheck          \
    clazy             \
    astyle            \
    heaptrack

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
# NOTE: llvm-libs-nano is deliberately NOT used here. It is still built
# against LLVM 22 (libLLVM.so.22.1) while clang-libs in the repos needs
# libLLVM.so.23.1, so mixing them breaks libclang and with it KDevelop's
# C++ language support.
get-debloated-pkgs --add-common --prefer-nano kiconthemes-mini ffmpeg-nano
