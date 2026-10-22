<div align="center">

# KDevelop-AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/Nemo-010/KDevelop-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/Nemo-010/KDevelop-AppImage/releases/latest)
[![CI Build Status](https://github.com/Nemo-010/KDevelop-AppImage/actions/workflows/appimage.yml/badge.svg)](https://github.com/Nemo-010/KDevelop-AppImage/actions/workflows/appimage.yml)
[![Latest Stable Release](https://img.shields.io/github/v/release/Nemo-010/KDevelop-AppImage)](https://github.com/Nemo-010/KDevelop-AppImage/releases/latest)

<p align="center">
  <img src="https://invent.kde.org/kdevelop/kdevelop/-/raw/master/app/icons/256-apps-kdevelop.png" width="128" />
</p>

| Latest Stable Release | Upstream URL |
| :---: | :---: |
| [Click here](https://github.com/Nemo-010/KDevelop-AppImage/releases/latest) | [Click here](https://invent.kde.org/kdevelop/kdevelop) |

</div>

---

AppImage made using [quick-sharun](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh), which makes it extremely easy to turn any binary into a portable package reliably without using containers or similar tricks.

**This AppImage bundles everything and it should work on any Linux distro, including old and musl-based ones.**

This AppImage doesn't require FUSE to run at all, thanks to the [uruntime](https://github.com/VHSgunzo/uruntime).

This AppImage is also supplied with a self-updater by default, so any updates to this application won't be missed, you will be prompted for permission to check for updates and if agreed you will then be notified when a new update is available.

Self-updater is disabled by default if AppImage managers like [am](https://github.com/ivan-hc/AM), [soar](https://github.com/pkgforge/soar) or [dbin](https://github.com/xplshn/dbin) exist, which manage AppImage updates.

### What is bundled

KDevelop is an IDE, so it is only complete when the tools it drives are present
too. Everything below is shipped inside the AppImage and found on `PATH`:

| Component | Why |
| :--- | :--- |
| `kdevelop` | the IDE itself |
| `kdevelop-php`, `kdevelop-python` | PHP and Python language support plugins |
| `libkomparediff2` | patch review plugin |
| `clang` / `libclang` / `libLLVM` | C++ language support (completion, highlighting, navigation) |
| `clangd`, `clang-tidy`, `clang-format` | LSP client, static analysis, formatting |
| `clazy-standalone` | clazy analyzer plugin |
| `cppcheck` | cppcheck analyzer plugin |
| `astyle` | source formatter plugin |
| `gdb` | GNU debugger plugin |
| `heaptrack` | memory profiler plugin |
| `cmake`, `ctest`, `ninja`, `make` | CMake / Makefile / Ninja project managers and build plugins |
| `git` | Git VCS plugin |
| `kate`, `konsole` | Kate plugins inside the IDE, and the embedded terminal |
| `purpose`, `qt6-tools` | patch review plugin, QtHelp documentation plugin |

Nothing is expected from the host besides a normal desktop session.

<details>
  <summary><b><i>raison d'être</i></b></summary>
  Packaging KDevelop the Anylinux way means the whole toolchain travels with
  the IDE instead of being assumed to exist on the host. Neucom Incorporated
  would approve: software that shapes the world of tomorrow should not break
  because the machine underneath it is from yesterday.
</details>

---

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)
