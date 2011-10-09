# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/atk/atk-1.32.0.ebuild,v 1.3 2011/01/29 16:32:15 grobian Exp $

EAPI="4"
GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="GTK+ & GNOME Accessibility Toolkit"
HOMEPAGE="http://projects.gnome.org/accessibility/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"  # due to copy-bump
IUSE="doc +introspection nls"

RDEPEND="dev-libs/glib:2
	introspection? ( >=dev-libs/gobject-introspection-0.6.7 )"
DEPEND="${RDEPEND}
	>=dev-lang/perl-5
	dev-util/pkgconfig
	doc? ( >=dev-util/gtk-doc-1.13 )
	nls? ( sys-devel/gettext )"

pkg_setup() {
	G2CONF="${G2CONF} $(use_enable introspection)"
	DOCS="AUTHORS ChangeLog NEWS README"
}

src_prepare() {
	gnome2_src_prepare

	if ! use test; then
		# don't waste time building tests (bug #226353)
		sed 's/^\(SUBDIRS =.*\)tests\(.*\)$/\1\2/' -i Makefile.am Makefile.in \
			|| die "sed failed"
	fi

	# Remove DEPRECATED flags
	sed -e '/-D[A-Z_]*DISABLE_DEPRECATED/d' -i atk/Makefile.am atk/Makefile.in \
		tests/Makefile.am tests/Makefile.in || die "sed 2 failed"
}
