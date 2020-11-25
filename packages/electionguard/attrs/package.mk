# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="attrs"
PKG_VERSION="20.3.0"
PKG_SHA256="832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://pypi.org/project/attrs"
PKG_URL="https://files.pythonhosted.org/packages/f0/cb/80a4a274df7da7b8baf083249b0890a0579374c3d74b5ac0ee9291f912dc/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python3:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/python3.8
  cp -rP $PKG_BUILD $INSTALL/usr/lib/python3.8
}
