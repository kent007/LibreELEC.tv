# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="hypothesis"
PKG_VERSION="5.41.3"
PKG_SHA256="6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://pypi.org/project/hypothesis"
PKG_URL="https://files.pythonhosted.org/packages/dd/50/d2d2840249aa01371da9a0d55c03f42989a6f28ae7f9bf9cf0eeeffef63b/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python3:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp -rP $PKG_BUILD/src/$PKG_NAME $INSTALL/usr/lib
}
