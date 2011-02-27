# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4"

inherit distutils eutils

DESCRIPTION="Evoque - managed eval-based freeform templating"
HOMEPAGE="http://evoque.gizmojo.org/"
SRC_URI="http://gizmojo.org/dist/${P}.tar.gz"

LICENSE="Academic Free License version 3.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="qpy"

RDEPEND="
	qpy? ( dev-python/qpy )
"
DEPEND="${RDEPEND}"

src_install() {
	distutils_src_install
}
