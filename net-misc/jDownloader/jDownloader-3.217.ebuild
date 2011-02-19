# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P=${P/-/_}

DESCRIPTION='JDownloader ist ein plattformunabhängiges, in Java geschriebenes
Opensourceprojekt. Das Programm vereinfacht das Herunterladen von Dateien von
sogenannten One-Click-Hostern wie Rapidshare.com oder Megaupload.com sowohl für
Freeuser als auch für Premiumkunden. Dabei stehen Features wie
"Multistreamdownload", "Bilderkennung", "Automatisches entpacken" uvm. zur
Verfügung. JDownloader ist natürlich völlig kostenlos.Zusätzlich werden viele
bekannte "Linkverschlüsselungsseiten" unterstützt um das Einfügen von
Downloadlinks komfortabler zu machen.JDownloader kann CCF, RSDF, und das neue
DLC Format importieren.'
HOMEPAGE="http://jdownloader.org"
SRC_URI="${PN/j/J}_v${PV}.zip"

DOWNLOAD_URL="http://jdownloader.org"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-1.5"

src_install() {
	insinto /opt/${PN}
	doins -r ${PN/j/J}/*
	fowners nobody:users -R /opt/${PN}
	fperms g+rwX -R /opt/${PN}
	exeinto /opt/bin/
	doexe ${FILESDIR}/jDownloader
}
