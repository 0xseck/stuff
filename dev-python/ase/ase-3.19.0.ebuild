# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_5 python3_6 python3_7)

inherit distutils-r1 flag-o-matic

DESCRIPTION="Set of tools and Python modules for setting up, manipulating, running, visualizing and analyzing atomistic simulations"
HOMEPAGE="http://wiki.fysik.dtu.dk/ase"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples test"
PYTHON_REQ_USE="tk"

RDEPEND="${PYTHON_DEPS}
	dev-python/numpy
	sci-libs/scipy
	dev-python/matplotlib
	dev-python/psycopg
	"
#psycopg2-binary
DEPEND="dev-python/setuptools"

python_compile() {
	distutils-r1_python_compile
}

python_compile_all() {
	use doc && setup.py build
}

python_test() {
	setup.py test
}

python_install_all() {
	distutils-r1_python_install_all
}
