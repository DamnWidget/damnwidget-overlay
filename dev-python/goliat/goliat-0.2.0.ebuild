# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyinotify/pyinotify-0.9.1.ebuild,v 1.5 2011/02/12 18:23:48 armin76 Exp $

EAPI="3"
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit distutils eutils

DESCRIPTION="Goliat is a Web Applications Framework written in Python and
JavaScript licensed under the General Public License. Goliat uses Twisted,
ExtJS, Orbited, Evoque and Storm to build web applications. "
HOMEPAGE="http://goliat.open-phoenix.com"
SRC_URI="https://github.com/downloads/DamnWidget/goliat/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="twisted-storm qpy"

RDEPEND="
	>=dev-python/twisted-10.1.0
	>=net-misc/orbited-0.7
	>=dev-python/pyyaml-3.08
    >=dev-python/storm-0.16
	qpy? ( dev-python/evoque[qpy] )
	!qpy? ( dev-python/evoque )
"
DEPEND="${RDEPEND}"

src_prepare() {
	if use twisted-storm; then
		einfo "You are instaling Goliat with Twisted Storm integration"
		einfo "Goliat works great with Twisted Storm integration, but"
		einfo "twsited-integration branch seems pretty dead now"
		einfo "If you're unsure about this just hit Ctrl+C"
	fi

	distutils_src_prepare
	cp "${FILESDIR}/${P}-setup.py" "${WORKDIR}/${P}/setup.py"
}

src_install() {
	distutils_src_install
}
