# Copyright 2010-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils

DESCRIPTION="An end-user Qt4 GUI for the cpp-ethereum crypto-currency"
HOMEPAGE="https://www.ethereum.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/ethereum/webthree-umbrella.git"
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT ISC GPL-3 LGPL-2.1 public-domain || ( CC-BY-SA-3.0 LGPL-2.1 )"
SLOT="0"
KEYWORDS=""
IUSE="$IUSE qt5"

RDEPEND="
	qt5? (
		>=dev-qt/qtbase-5.6.0
		>=dev-qt/qtquick1-5.6.0
		>=dev-qt/qtquickcontrols-5.6.0
		>=dev-qt/qtgraphicaleffects-5.6.0
		>=dev-qt/qtdeclarative-5.6.0
		>=dev-qt/qtwebkit-5.6.0
                >=dev-qt/qtwebengine-5.6.0
	)
	>=dev-libs/boost-1.56.0[threads(+)]
	>=dev-libs/crypto++-5.6.2
	net-libs/miniupnpc
        net-libs/libmicrohttpd
        net-misc/curl
	dev-libs/gmp
        dev-libs/jsoncpp
        dev-libs/leveldb
        dev-libs/libedit
        dev-libs/ocl-icd
	dev-cpp/libjson-rpc-cpp
	dev-util/scons
	dev-util/google-perftools
        >=sys-devel/llvm-3.7.1-r1
        sys-libs/ncurses
	sys-libs/readline
	app-arch/snappy"

DEPEND="${RDEPEND}"

src_configure() {
        local mycmakeargs=(
				-DCMAKE_BUILD_TYPE=Release
				-DHEADLESS=1
        )

		#use qt5 || mycmakeargs="${mycmakeargs} -DHEADLESS=1"
        cmake-utils_src_configure
}