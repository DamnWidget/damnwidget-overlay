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

src_install() {
      einfo "Copying shared data..."
      dodir /usr/share/backharddi-ng      
      cp "${S}/usr/share/backharddi-ng/*.filelist" "${D}/usr/share/backharddi-ng/" || die "Install failed!"
      cp "${S}/usr/share/backharddi-ng/grub" "${D}/usr/share/backharddi-ng/" || die "Install failed!"
      cp -R "${S}/usr/share/backharddi-ng/common/" "${D}/usr/share/backharddi-ng/" || die "Install failed!"
      cp -R "${S}/usr/share/backharddi-ng/isolinux/" "${D}/usr/share/backharddi-ng/" || die "Install failed!"
      cp -R "${S}/usr/share/backharddi-ng/syslinux/" "${D}/usr/share/backharddi-ng/" || die "Install failed!"
      
      dodir /usr/share/applications
      cp "${S}/usr/share/applications/*.desktop" "${D}/usr/share/applications/" || die "Install failed!"
      
      einfo "Creating the backharddi-ng python structure..."
      dodir /usr/share/backharddi-ng/python/src
      cp -R "${S}/usr/share/backharddi-ng/python/src/backhardding/" "${D}/usr/share/backharddi-ng/python/src/" || die "Install failed!"
      
      einfo "Copying documentation..."
      dodir /usr/share/doc/backharddi-ng
      cp "${S}/usr/share/doc/backharddi-ng/copyright" "${D}/usr/share/doc/backharddi-ng/" || die "Install failed!"
  
      einfo "Copying pixmaps..."
      dodir /usr/share/pixmaps
      cp "${S}/usr/share/pixmaps/*" "${D}/usr/share/pixmaps/" || die "Install failed!"

      einfo "Copying executable files..."
      cp "${S}/usr/bin/*" "${D}/usr/bin/" || die "Install failed!"

      dodir /var/lib/backharddi-ng
}

pkg_postinst() {
      elog "You will run grub-mkconfig to create Backharddi NG Grub entries"
      elog "Report bugs to oscar.campos@open-phoenix.com"
}