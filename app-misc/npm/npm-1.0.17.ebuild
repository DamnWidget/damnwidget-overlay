# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="The Node.js package manager"
HOMEPAGE="https://github.com/isaacs/npm"
SRC_URI="https://github.com/isaacs/${PN}/tarball/v${PV} -> ${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=net-lib/nodejs-0.4"

src_compile() { :; }

src_install() {
	emake DESTDIR="${D}"/usr install || die "emake install failed"
}
