# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils eutils python

DESCRIPTION="A 3D multiple robot simulator with dynamics."
HOMEPAGE="http://playerstage.sourceforge.net/index.php?src=gazebo"
SRC_URI="mirror://sourceforge/playerstage/gazebo-${PV}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="
	virtual/opengl
	virtual/glut
	>=dev-games/ode-0.039
	>=sci-electronics/player-2.0
	dev-libs/libxml2
	>=x11-libs/fltk-1.1:1.1
	zlib? ( sys-libs/zlib )
	python? ( dev-lang/python )
	3ds? ( media-libs/lib3ds )
	proj? ( sci-libs/proj )
	gdal? ( sci-libs/gdal )
	ogre? ( dev-games/ogre )
	bullet? ( sci-physics/bullet )"

DEPEND="${RDEPEND}
	media-libs/freeimage
	>=dev-libs/boost-1.35.0-r1
	>=dev-util/pkgconfig-0.9.0
	python? ( dev-lang/swig )"

IUSE_MODELS="models_avatarheli models_blimp models_clodbuster models_carchassis
		models_factory models_garmingps models_groundplane models_lightsource
		models_monocam models_observercam models_pioneer2at models_pioneer2dx
		models_pioneer2gripper models_peoplebot models_segwayrmp models_shrimp
		models_sicklms200 models_simplesolid models_skydome models_sonyvid30
		models_canonvcc4 models_stereohead models_truthwidget models_wheelchair
		models_b21r models_atrv models_bandit models_road models_terrain"

IUSE="bullet ogre python wxwindows 3ds proj gdal zlib $IUSE_MODELS"
