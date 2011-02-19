# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="2"

inherit eutils

MY_PN=${PN/j/J}

DESCRIPTION="JDownloader is a Java download tool. It simplifies downloading files from One-Click-Hosters like Rapidshare.com or Megaupload.com"
HOMEPAGE="http://www.jdownloader.org/"
SRC_URI="${MY_PN}_${PV}_2.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="fetch"

DEPEND="app-arch/unzip"

RDEPEND="${DEPEND}
	virtual/jre"

S="${WORKDIR}/${MY_PN} ${PV}"

src_install() {
	insinto /opt/${PN}
	doins JDownloader.jar jdupdate.jar outdated.dat
	cp -R downloads jd libs plugins tmp ${D}/opt/${PN}
	dobin ${FILESDIR}/jDownloader
	newicon jd/img/logo/jd_logo_54_54_trans.png ${PN}.png
	make_desktop_entry ${PN}
}
