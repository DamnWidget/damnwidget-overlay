# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyinotify/pyinotify-0.9.1.ebuild,v 1.5 2011/02/12 18:23:48 armin76 Exp $

EAPI="3"
PYTHON_DEPEND="*:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4"

inherit distutils git bzr

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
	twisted-storm? ( dev-vcs/bzr )
	!twisted-storm? ( >=dev-python/storm-0.15 )
	qpy? ( dev-python/qpy )
"
DEPEND="${RDEPEND}"

src_install() {
	distutils_src_install
}
