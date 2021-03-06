# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="psutil"
PKG_VERSION="5.7.3"
PKG_SHA256="af73f7bcebdc538eda9cc81d19db1db7bf26f103f91081d780bbacfcb620dee2"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://pypi.org/project/psutil"
PKG_URL="https://files.pythonhosted.org/packages/33/e0/82d459af36bda999f82c7ea86c67610591cf5556168f48fd6509e5fa154d/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="toolchain Python3:host setuptools:host"
PKG_DEPENDS_TARGET="psutil:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

make_host() {
  make build
}

makeinstall_host() {
  make install
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/python3.8
  cp -rP $TOOLCHAIN/lib/python3.8/site-packages/psutil-5.7.3-py3.8-linux-x86_64.egg/psutil $INSTALL/usr/lib/python3.8
  #mv $INSTALL/usr/lib/python3.8/$PKG_NAME-$PKG_VERSION $INSTALL/usr/lib/python3.8/$PKG_NAME
}
