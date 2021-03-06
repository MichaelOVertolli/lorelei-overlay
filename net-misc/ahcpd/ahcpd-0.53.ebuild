# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="the Ad-Hoc Configuration Protocol"
HOMEPAGE="http://www.pps.jussieu.fr/~jch/software/ahcp/"
SRC_URI="http://www.pps.jussieu.fr/~jch/software/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_compile() {
	emake PREFIX=/usr "CDEBUGFLAGS=${CFLAGS}" all || die "build failed"
}

src_install(){
	emake install.minimal PREFIX=/usr "TARGET=${D}" || die "install failed"
	dodoc CHANGES README || die "dodoc failed"
	mv ${PN}.man ${PN}.8
	doman ${PN}.8 || die "doman failed"
}
