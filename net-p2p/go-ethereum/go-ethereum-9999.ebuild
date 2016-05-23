# Copyright 2010-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils

DESCRIPTION="Geth client for go-ethereum"
HOMEPAGE="https://www.ethereum.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/ethereum/go-ethereum.git"
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT ISC GPL-3 LGPL-2.1 public-domain || ( CC-BY-SA-3.0 LGPL-2.1 )"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-lang/go"
DEPEND="${RDEPEND}"


src_install() {
        emake DESTDIR="${D}" install
}