# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gmpy2"
PKG_VERSION="2.0.8"
PKG_SHA256="dd233e3288b90f21b0bb384bcc7a7e73557bb112ccf0032ad52aa614eb373d3f"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://pypi.org/project/gmpy2"
PKG_URL="https://files.pythonhosted.org/packages/90/f4/9a2e384b325b69bc5827b9a6510a8fb4a51698c915c06a3f25a86458892a/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_HOST="Python3:host gmp:host mpfr:host mpc:host"
PKG_DEPENDS_TARGET="gmpy2:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

#pre_makeinstall_host() {
#  cp -rP $TOOLCHAIN/. $PKG_BUILD
#  export LD_LIBRARY_PATH="$TOOLCHAIN/x86_64-libreelec-linux-gnu/sysroot:$LD_LIBRARY_PATH"
#}

makeinstall_host() {
  python3 setup.py install --static=$TOOLCHAIN --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/python3.8
  #cp -rP $PKG_BUILD $INSTALL/usr/lib/python3.8
  #mv $INSTALL/usr/lib/python3.8/$PKG_NAME-$PKG_VERSION $INSTALL/usr/lib/python3.8/$PKG_NAME
  cp -rP $TOOLCHAIN/lib/python3.8/site-packages/gmpy2.cpython-38-x86_64-linux-gnu.so $INSTALL/usr/lib/python3.8
}
