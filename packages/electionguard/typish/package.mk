# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="typish"
PKG_VERSION="1.9.1"
PKG_SHA256="d0f8e0dc2161fbe24fba50177e1beaa29d9b811d6374fdcc5af48dd4a5b135db"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/ramonhagenaars/typish"
PKG_URL="https://github.com/ramonhagenaars/typish/archive/v1.9.1.tar.gz"
PKG_DEPENDS_HOST="Python3:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp -rP $PKG_BUILD/$PKG_NAME $INSTALL/usr/lib
}
