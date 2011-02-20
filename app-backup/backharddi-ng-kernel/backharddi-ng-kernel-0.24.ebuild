# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/desktopcouch/desktopcouch-0.6.4.ebuild,v 1.3 2011/01/08 16:35:16 arfrever Exp $

EAPI="3"

inherit eutils multilib

DESCRIPTION="Linux Kernel for Backharddi NG"
HOMEPAGE="https://launchpad.net/backharddi-ng"
SRC_URI="https://launchpad.net/~pedro-pena/+archive/backharddi-ng/+files/${PN}-i386_${PV}_all.deb"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""   

src_unpack() {
    if [ "${A}" != "" ]; then
	unpack ${A}
	unpack './data.tar.gz'	
    fi
}

src_install() {    
    cp -R "${S}/boot" "${D}/" || die "Install failed!"
    
    dodir /usr/share/doc/backharddi-ng-kernel-i386/
    cp -R "${S}/usr/share/doc/backharddi-ng-kernel-i386" "${D}/usr/share/doc/" || die "Install failed!"
}