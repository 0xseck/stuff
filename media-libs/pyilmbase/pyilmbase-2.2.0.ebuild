# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/pyilmbase/pyilmbase-2.2.0.ebuild,v 0.1 2014/12/05 16:41:48 brothermechanic Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1 autotools-multilib flag-o-matic

MY_P="oiio"
MY_PV="Release-${PV}dev"

DESCRIPTION="Python bindings for the IlmBase"
HOMEPAGE="http://openexr.com/"
SRC_URI="http://download.savannah.gnu.org/releases/openexr/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

RDEPEND="dev-lang/python
	dev-libs/boost[python]
	media-libs/openexr
	media-libs/ilmbase
	dev-python/numpy
	dev-libs/boost-numpy
	"
DEPEND="${RDEPEND}"

#S="${WORKDIR}/${P}"

src_prepare() {
	epatch "${FILESDIR}"/boost-python.patch
}