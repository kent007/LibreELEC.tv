# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="electionguard"
PKG_VERSION="1.0.0"
PKG_SHA256="455579c528d5990207e2225d3ff13e6e07f1579fba774b1f26f0a4c0551c0217"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/tausiftt5238/cs5204_election_guard"
PKG_URL="https://github.com/tausiftt5238/cs5204_election_guard/releases/download/$PKG_VERSION/$PKG_NAME.tar.gz"
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
