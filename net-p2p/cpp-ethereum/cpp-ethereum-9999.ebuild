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
		=dev-qt/qtconcurrent-5.6.0
		=dev-qt/qtcore-5.6.0
		=dev-qt/qtdbus-5.6.0
		=dev-qt/qtgui-5.6.0-r1
		=dev-qt/qtnetwork-5.6.0
		=dev-qt/qtopengl-5.6.0
		=dev-qt/qtprintsupport-5.6.0
		=dev-qt/qtsql-5.6.0
		=dev-qt/qttest-5.6.0
		=dev-qt/qtwidgets-5.6.0
		=dev-qt/qtxml-5.6.0
		=dev-qt/qtquick1-5.6.0
		=dev-qt/qtquickcontrols-5.6.0
		=dev-qt/qtgraphicaleffects-5.6.0
		=dev-qt/qtdeclarative-5.6.0
		=dev-qt/qtwebkit-5.6.0
                =dev-qt/qtwebengine-5.6.0
	)
	>=dev-libs/boost-1.56.0[threads(+)]
	>=dev-libs/crypto++-5.6.2
	net-libs/miniupnpc
        net-libs/libmicrohttpd
        net-misc/curl
	dev-libs/argtable
	dev-libs/gmp
        dev-libs/jsoncpp
        dev-libs/leveldb
        dev-libs/libedit
        dev-libs/ocl-icd
	>=dev-lang/v8-3.15
	dev-lang/yasm
	dev-cpp/libjson-rpc-cpp
	dev-util/scons
	dev-util/google-perftools
	dev-util/cmake
	dev-vcs/git
        =sys-devel/llvm-3.7.1-r2
	sys-devel/automake
	sys-devel/autoconf
	sys-devel/gcc
	sys-devel/libtool
	=sys-devel/clang-3.7.1-r100
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