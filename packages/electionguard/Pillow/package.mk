# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="Pillow"
PKG_VERSION="8.0.1"
PKG_SHA256="11c5c6e9b02c9dac08af04f093eb5a2f84857df70a7d4a6a6ad461aca803fb9e"
PKG_LICENSE="HBND"
PKG_SITE="https://pypi.org/project/Pillow"
PKG_URL="https://files.pythonhosted.org/packages/2b/06/93bf1626ef36815010e971a5ce90f49919d84ab5d2fa310329f843a74bc1/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="Python3:host"
PKG_LONGDESC="The Python Imaging Library adds image processing capabilities to your Python interpreter."
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  python3 setup.py install --prefix=$TOOLCHAIN
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/python3.8
  cp -rP $PKG_BUILD $INSTALL/usr/lib/python3.8
}
