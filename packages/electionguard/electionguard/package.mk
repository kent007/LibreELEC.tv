# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="electionguard"
PKG_VERSION="2.0.0"
PKG_SHA256="ca755da180a5af0ceedb802fc023a07eb2dda08debf8ace507e9e383b549d288"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/tausiftt5238/cs5204_election_guard"
PKG_URL="https://github.com/tausiftt5238/cs5204_election_guard/releases/download/v$PKG_VERSION/$PKG_NAME.tar.gz"
PKG_DEPENDS_HOST="Python3:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -rP $PKG_BUILD $INSTALL/usr/bin
  mv $INSTALL/usr/bin/$PKG_NAME-$PKG_VERSION $INSTALL/usr/bin/$PKG_NAME
}
