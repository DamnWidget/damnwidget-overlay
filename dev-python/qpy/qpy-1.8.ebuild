# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4"

inherit distutils eutils

DESCRIPTION="Qpy provides a convenient mechanism for generating safely-quoted
xml from python code. It does this by implementing a quote-no-more string data
type and a slightly modified python compiler."
HOMEPAGE="http://www.mems-exchange.org/software/qpy/"
SRC_URI="http://www.mems-exchange.org/software/qpy/${P}.tar.gz"

LICENSE="CNRI Open Source License"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	distutils_src_install
}
