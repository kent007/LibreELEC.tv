# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="numpy"
PKG_VERSION="1.19.4"
PKG_SHA256="141ec3a3300ab89c7f2b0775289954d193cc8edb621ea05f99db9cb181530512"
PKG_ARCH="any"
PKG_LICENSE="BSD-3c"
PKG_SITE="https://pypi.org/project/numpy"
PKG_URL="https://files.pythonhosted.org/packages/c5/63/a48648ebc57711348420670bb074998f79828291f68aebfff1642be212ec/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_HOST="Python3:host Cython:host"
PKG_LONGDESC="It's numpy and its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp -rP $PKG_BUILD/$PKG_NAME $INSTALL/usr/lib
}
