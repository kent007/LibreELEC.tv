# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jsons"
PKG_VERSION="1.3.0"
PKG_SHA256="78cba10cc53c6ae39922a085532e5c7db491c9f61339690bb91fe95922761a00"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/ramonhagenaars/jsons"
PKG_URL="https://github.com/ramonhagenaars/jsons/archive/v1.3.0.tar.gz"
PKG_DEPENDS_HOST="Python3:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/python3.8
  cp -rP $PKG_BUILD/$PKG_NAME $INSTALL/usr/lib/python3.8
}
