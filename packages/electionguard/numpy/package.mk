# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="numpy"
PKG_VERSION="1.19.4"
PKG_SHA256="fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
PKG_ARCH="any"
PKG_LICENSE="BSD-3c"
PKG_SITE="https://github.com/numpy/numpy"
PKG_URL="https://github.com/numpy/$PKG_NAME/releases/download/v$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python3:host"
PKG_LONGDESC="It's numpy and its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}
