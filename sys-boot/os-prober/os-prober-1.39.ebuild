# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-boot/os-prober/os-prober-1.39.ebuild,v 1.1 2010/07/26 11:00:51 lxnay Exp $

EAPI="2"

inherit eutils multilib toolchain-funcs

DESCRIPTION="Utility to detect other OSs on a set of drives"
HOMEPAGE="http://packages.debian.org/source/sid/os-prober"
SRC_URI="mirror://debian/pool/main/${PN::1}/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

src_prepare() {
	sed -i -e "s:/lib/udev:/$(get_libdir)/udev:g" common.sh || die "sed failed on common.sh"
	find "${S}" -type f -exec sed -i -e "s:/usr/lib/:/usr/libexec/:g" {} + || die "failed on find and sed lib->libexec"
	sed -i -e "s:/lib/ld\*\.so\*:/lib*/ld*.so*:g" os-probes/mounted/common/90linux-distro  || die "sed failed on 90linux-distro"

	# Just use the default rules provided by GNU Make
	rm Makefile
}

src_compile() {
	tc-export CC
	emake newns || die "emake failed"
}

src_install() {
	dobin os-prober linux-boot-prober || die "dobin failed"

	exeinto /usr/libexec/os-prober
	doexe newns || die "doexe newns failed"

	insinto /usr/share/os-prober
	doins common.sh || die "doins common.sh failed"

	keepdir /var/lib/os-prober

	local debarch=${ARCH%-*} dir

	case ${debarch} in
		amd64)		debarch=x86 ;;
		ppc|ppc64)	debarch=powerpc ;;
	esac

	for dir in os-probes{,/mounted,/init} linux-boot-probes{,/mounted}; do
		exeinto /usr/libexec/$dir
		doexe $dir/common/* || die "doexe failed in $dir/common"
		if [[ -d $dir/$debarch ]]; then
			doexe $dir/$debarch/* || die "doexe failed in $dir/$debarch"
		fi
	done

	if use amd64 || use x86; then
		exeinto /usr/libexec/os-probes/mounted
		doexe os-probes/mounted/powerpc/20macosx || die "doexe failed on 20macosx"
	fi

	dodoc README TODO debian/changelog || die "dodoc failed"
}

pkg_postinst() {
	elog "If you intend for os-prober to detect versions of Windows installed on"
	elog "NTFS-formatted partitions, your system must be capable of reading the"
	elog "NTFS filesystem. One way to do this is by installing sys-fs/ntfs3g"
}
