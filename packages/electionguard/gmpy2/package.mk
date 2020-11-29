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
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/python3.8
  cp -rP $PKG_BUILD $INSTALL/usr/lib/python3.8
  mv $INSTALL/usr/lib/python3.8/$PKG_NAME-$PKG_VERSION $INSTALL/usr/lib/python3.8/$PKG_NAME
}
