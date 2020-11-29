# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="Cython"
PKG_VERSION="0.29.21"
PKG_SHA256="e57acb89bd55943c8d8bf813763d20b9099cc7165c0f16b707631a7654be9cad"
PKG_ARCH="any"
PKG_LICENSE="Apache"
PKG_SITE="https://pypi.org/project/Cython"
PKG_URL="https://files.pythonhosted.org/packages/6c/9f/f501ba9d178aeb1f5bf7da1ad5619b207c90ac235d9859961c11829d0160/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="toolchain gcc Python3:host"
PKG_LONGDESC="Its used by electionguard"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}
