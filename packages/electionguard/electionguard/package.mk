# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="electionguard"
PKG_VERSION="3.0.0"
PKG_SHA256="e4b22f1e41f136319d4031b9d0b4d5a9dd7dd7ddf63292f88e3cc7e8ef4272c0"
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
