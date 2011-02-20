DamnWidget Gentoo Overlay
=========================

This is my overlay for Gentoo ~amd64 and ~x86

Those package are tested only in my machines, use at your own risk.

HOWTO Install
-------------

To install DamnWidget Gentoo Overlay (to install Backharddi NG on Gentoo for example) you will
create a new layman XML repo file and add it to your: 
	/etc/layman/layman.cfg 

### Layman's XML repo file:

	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE repositories SYSTEM "/dtd/repositories.dtd">
	<repositories xmlns="" version="1.0">
	  <repo quality="experimental" status="unofficial">
	      <name><![CDATA[DamnWidget]]></name>
	      <description><![CDATA[collection of ebuilds by DamnWidget]]></description>
	      <homepage>http://entropia-sistemica.blogspot.com/</homepage>
	      <owner>
	        <email>damnwidget@gmail.com</email>
	      </owner>
	      <source type="git">git://github.com/DamnWidget/damnwidget-overlay.git</source>
	      <feed>https://github.com/DamnWidget/damnwidget-overlay/commits/master.atom</feed>
	  </repo>
	</repositories>

Then you can install the DamnWidget overlay just using:
	$ layman -L
	$ layman -a DamnWidget

Overlays
--------

1. sys-boot/os-prober
2. net-misc/tucan
3. net-misc/udpcast-20100130 (required by Backharddi NG)
4. dev-python/ipaddr (required by Backharddi NG)
5. dev-python/netifaces (required by Backharddi NG)
6. dev-python/stompservice (required by BAckharddi NG)
7. app-backup/backharddi-ng-kernel
8. app-backup/backharddi-ng

Is this overlay supported by Gentoo?
------------------------------------

No at all, use it at your own risk.

Where can I send reports?
-------------------------
Just here.

