# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"

inherit eutils multilib

DESCRIPTION="Next Generation Hard Disk Backup based on Debian Installer"
HOMEPAGE="https://launchpad.net/backharddi-ng"
SRC_URI="https://launchpad.net/~pedro-pena/+archive/${PN}/+files/${PN}_${PV}_all.deb"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-boot/grub-1.98"
RDEPEND="${DEPEND}
    sys-apps/sed
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
    dev-lang/python:2.6
    dev-python/twisted
    dev-python/twisted-conch
    dev-python/dbus-python
    dev-python/simplejson
    dev-python/ipaddr
    dev-python/netifaces
    dev-python/morbid    
    dev-python/stomper
    dev-python/stompservice
    net-dns/dnsmasq
    net-misc/sshpass
    >=net-misc/udpcast-20100130
    net-misc/orbited
    gnome-extra/zenity
    app-backup/backharddi-ng-kernel"    

src_unpack() {
    if [ "${A}" != "" ];then
	unpack ${A}
	unpack './data.tar.gz'
    fi
}

#src_install() {    
    
#}
