# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="cryptography"
PKG_VERSION="3.2.1"
PKG_SHA256="d3d5e10be0cf2a12214ddee45c6bd203dab435e3d83b4560c03066eda600bfe3"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://pypi.org/project/cryptography"
PKG_URL="https://files.pythonhosted.org/packages/94/5c/42de91c7fbdb817b2d9a4e64b067946eb38a4eb36c1a09c96c87a0f86a82/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python3:host"
PKG_DEPENDS_TARGET="cryptography:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

pre_makeinstall_host() {
  export LD_LIBRARY_PATH="$SYSROOT:$LD_LIBRARY_PATH"
}

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/python3.8
  cp -rP $PKG_BUILD/src/$PKG_NAME $INSTALL/usr/lib/python3.8

  cp $TOOLCHAIN/lib/python3.8/site-packages/cryptography-3.2.1-py3.8-linux-x86_64.egg/cryptography/hazmat/bindings/_openssl.abi3.so $INSTALL/usr/lib/python3.8/$PKG_NAME/hazmat/bindings
  cp $TOOLCHAIN/lib/python3.8/site-packages/cryptography-3.2.1-py3.8-linux-x86_64.egg/cryptography/hazmat/bindings/_padding.abi3.so $INSTALL/usr/lib/python3.8/$PKG_NAME/hazmat/bindings

  cp $TOOLCHAIN/lib/libffi.so.7 $INSTALL/usr/lib
}
