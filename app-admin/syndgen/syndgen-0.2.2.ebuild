# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit distutils

DESCRIPTION="A distant Gentoo synchronizer helper"
HOMEPAGE="http://tuna.lyua.org/syndgen/"
SRC_URI="http://tuna.lyua.org/downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="net-misc/rsync net-misc/openssh app-portage/gentoolkit"

PYTHON_MODNAME="syndgen"

src_install() 
{
    cd ${S}
    distutils_src_install

    doman doc/syndgen.1
}