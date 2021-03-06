# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="cffi"
PKG_VERSION="1.14.3"
PKG_SHA256="f92f789e4f9241cd262ad7a555ca2c648a98178a953af117ef7fad46aa1d5591"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://pypi.org/project/cffi"
PKG_URL="https://files.pythonhosted.org/packages/cb/ae/380e33d621ae301770358eb11a896a34c34f30db188847a561e8e39ee866/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="toolchain Python3:host"
PKG_DEPENDS_TARGET="cffi:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/python3.8
  cp -rP $PKG_BUILD/$PKG_NAME $INSTALL/usr/lib/python3.8
  cp -rP $TOOLCHAIN/lib/python3.8/site-packages/cffi-1.14.3-py3.8-linux-x86_64.egg/_cffi_backend.cpython-38-x86_64-linux-gnu.so $INSTALL/usr/lib/python3.8
}
