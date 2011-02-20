# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/desktopcouch/desktopcouch-0.6.4.ebuild,v 1.3 2011/01/08 16:35:16 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"

inherit distutils eutils multilib

DESCRIPTION="Next Generation Hard Disk Backup based on Debian Installer"
HOMEPAGE="https://launchpad.net/backharddi-ng"
SRC_URI="https://launchpad.net/~pedro-pena/+archive/${PN}/+files/${PN}_${PV}.tar.gz"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gtk kde"

DEPEND=""
RDEPEND="sys-apps/sed
    sys-apps/grep
    sys-apps/util-linux
    sys-apps/findutils
    sys-apps/memtest86+
    sys-apps/hal
    sys-boot/syslinux
    sys-fs/e2fsprogs
    sys-fs/lvm2
    app-cdr/cdrtools
    app-cdr/dvd+rw-tools    
    dev-python/twisted
    dev-python/twisted-conch
    dev-python/dbus-python
    dev-python/simplejson
    dev-python/ipaddr
    dev-python/netifaces
    net-dns/dnsmasq
    net-misc/sshpass
    gnome-extra/zenity"    

pkg_setup() {
    python_set_active_version 2
    python_pkg_setup
}

src_install() {
    python_convert_shebangs -r 2 "bin/"

    distutils_src_install

    exeinto "/usr/$(get_libdir)/${PN}"
    doexe "bin/desktopcouch-stop"
    doexe "bin/desktopcouch-service"
    doexe "bin/desktopcouch-get-port"

    if use doc; then
        insinto "/usr/share/doc/${PF}/api"
        doins "desktopcouch/records/doc/records.txt"
        doins "desktopcouch/records/doc/field_registry.txt"
        doins "desktopcouch/contacts/schema.txt"

        doman "docs/man/desktopcouch-pair.1"
    fi
}
