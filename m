From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] smartpqi: initial submit of smartpqi man page
Date: Thu, 19 Oct 2017 17:36:01 -0400
Message-ID: <20171019213558.aelneujzgyucrye3@crack.deadbeast.net>
References: <150833943926.13185.7883447908516236321.stgit@brunhilda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ib22imrxppc5wyes"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <150833943926.13185.7883447908516236321.stgit@brunhilda>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org, john.hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org, Kevin.Barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org, bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org, scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org, Justin.Lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org, scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--ib22imrxppc5wyes
Content-Type: multipart/mixed; boundary="6l7apffsed3efefb"
Content-Disposition: inline


--6l7apffsed3efefb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2017-10-18T10:10:39-0500, Don Brace wrote:
> This patch contains the initial submission of the
> smartpqi man page.

Hi Don,

Please find attached my recommended changes.

I made many changes, most of them formatting-related.

01. Removed string definition that was never used[1].
02. Set up the title heading per man-pages(7).
03. Used SY/OP/YS macros to lay out the synopsis.  This solves alignment
    issues more pleasantly than nf/fi requests, and puts literal syntax
    elements in bold.
04. Used tagged paragraphs instead of un-tagged paragraphs combined with
    relative-indent macros.
05. Documented boolean values more explicitly (in synopsis as well).
06. Tightened language; "This option" is implied by context.
07. Wordsmithed an imperative-sounding phrase to a descriptive one
    regarding the heartbeat.
08. Put the lockup_action action table into a real table.
09. Retitled section "CONFIGURATION DETAILS" to just "CONFIGURATION" per
    man-pages(7).
10. Marked up driver names, file names[2], and controller attribute
    references in italics.
11. Added line breaks to ends of sentences so troff will apply
    inter-sentence spacing appropriately.
12. Put subsection titles into sentence-case[2] per man-pages(7).
13. hot plugging -> hot-plugging[3]
14. "e.g." implies "etc.", so both are not necessary.
15. Convert examples to use indentation and EX/EE macros per
    man-pages(7).
16. In examples, put user input in bold per man-pages(7).
17. Explain b:c:t:l notation, since it is not used literally in
    filespecs.
18. "read-write" -> "read/write"[3]
19. Added cross-reference to cciss(4) man page.
20. Reformatted SEE ALSO section.
21. Deleted AUTHORS section as it is "strongly deprecated" per
    man-pages(7).

There are some issues I was unsure about; I left them in comments:

To configure Microsemi Smart Family controllers, please refer to the
controller's User Guide documentation.
=2E\" Does this manual have a title?  Is it freely available online?
=2E\" Does it have a stable URL?  Can this information be moved to the SEE
=2E\" ALSO section?

=2E\" What is "ioaccel"?  This string appears nowhere in man-pages HEAD.

=2E\" This example line is too wide for an 80-column TTY.
=2EB cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_enabled

=2ESS Supported \f[BI]ioctl\fP\/() operations
=2E\" Does this subsection belong here, under .SH FILES ?

And here's one more I just thought of (forest, trees...).

Is "SmartPQI" the correct casing when referring to the product rather
than the kernel module?

I checked the output on 80- and 191-column terminals and with a
PostScript viewer.

[1] And which doesn't "work everywhere", anyway, for instance on EBCDIC
systems.  IIRC, the groff guys discourage defining a string escape this
way.
[2] I don't know of another term for this.  "In subsection ("SS")
    headings, capitalize the first word in the heading, but otherwise
    use lowercase, except where English usage (e.g., proper nouns) or
    programming language requirements (e.g., identifier names) dictate
    otherwise."
[3] MTK: Is this a candidate for the "Preferred terms" subsection of
    man-pages(7)?

--=20
Regards,
Branden

--6l7apffsed3efefb
Content-Type: application/x-troff-man
Content-Disposition: attachment; filename="smartpqi_branden.man"
Content-Transfer-Encoding: quoted-printable

=2E\" Copyright (C) 2016-2017, Microsemi Corporation=0A.\" Copyright (C) 20=
16, PMC-Sierra, Inc.=0A.\" Written by Kevin Barnett <kevin.barnett@microsem=
i.com>=0A.\"=0A.\" %%%LICENSE_START(GPLv2_ONELINE)=0A.\" Licensed under GNU=
 General Public License version 2 (GPLv2)=0A.\" %%%LICENSE_END=0A.TH SMARTP=
QI 4 2017-10-19 "Linux" "Linux Programmer's Manual"=0A.SH NAME=0Asmartpqi \=
- Microsemi Smart Family SCSI driver=0A.SH SYNOPSIS=0A.SY "modprobe smartpq=
i"=0A.RB [ disable_device_id_wildcards=3D { 0 | 1 }]=0A.RB [ disable_heartb=
eat=3D { 0 | 1 }]=0A.RB [ disable_ctrl_shutdown=3D { 0 | 1 }]=0A.RB [ locku=
p_action=3D { none | reboot | panic }]=0A.YS=0A.SH DESCRIPTION=0A.B smartpq=
i=0Ais a SCSI driver for Microsemi Smart Family controllers.=0A.SH OPTIONS=
=0A.TP=0A.BR disable_device_id_wildcards=3D { 0 | 1 }=0ADisables support fo=
r device ID wildcards.=0AThe default value is 0.=0A.TP=0A.BR disable_heartb=
eat=3D { 0 | 1 }=0ADisables support for the controller's heartbeat check.=
=0AThis parameter is used for debugging purposes.=0AThe default value is 0,=
 leaving the controller's heartbeat check active.=0A.TP=0A.BR disable_ctrl_=
shutdown=3D { 0 | 1 }=0ADisables support for shutting down the controller i=
n the=0Aevent of a controller lockup.=0AThe default value is 0.=0A.TP=0A.BR=
 lockup_action=3D { none | reboot | panic }=0ASpecifies the action the driv=
er takes when a controller=0Alockup is detected.=0AThe default action is=0A=
=2EBR none .=0A.TS=0Al l=0A---=0Al l.=0Aparameter	action=0A\fBnone\fP	take =
controller offline only=0A\fBreboot\fP	reboot the system=0A\fBpanic\fP	pani=
c the system=0A.TE=0A.SH CONFIGURATION=0ATo configure Microsemi Smart Famil=
y controllers, please refer to the=0Acontroller's User Guide documentation.=
=0A.\" Does this manual have a title?  Is it freely available online?=0A.\"=
 Does it have a stable URL?  Can this information be moved to the SEE=0A.\"=
 ALSO section?=0A.RE=0A.SH FILES=0A.SS Device nodes=0ALogical drives are ac=
cessed via the SCSI disk driver=0A.RI ( sd ),=0Atape drives via the SCSI ta=
pe driver=0A.RI ( st ),=0Aand the RAID controller via the SCSI generic driv=
er=0A.RI ( sg ),=0Awith device nodes named=0A.IR /dev/sd *,=0A.IR /dev/st *=
,=0Aand=0A.IR /dev/sg *,=0Arespectively.=0A.SS SmartPQI-specific host attri=
bute files in \f[BI]/sys\fP=0A.TP=0A.IR /sys/class/scsi_host/host * /rescan=
=0AThe host=0A.I rescan=0Aattribute is a write-only attribute.=0AWriting to=
 this attribute will cause the driver to scan for new,=0Achanged, or remove=
d devices (e.g., hot-plugged tape drives, or newly=0Aconfigured or deleted =
logical drives) and notify the SCSI mid-layer of=0Aany changes detected.=0A=
Normally this action is triggered automatically by configuration=0Achanges,=
 so the user should not normally have to write to this file.=0ADoing so may=
 be useful when hot-plugging devices like tape drives, or=0Aentire storage =
boxes containing pre-configured logical drives.=0A.TP=0A.IR /sys/class/scsi=
_host/host * /version=0AThe host=0A.I version=0Aattribute is a read-only at=
tribute.=0AThis attribute contains the driver version and the controller fi=
rmware=0Aversion.=0A.IP=0AFor example:=0A.in +4n=0A.EX=0A$ \c=0A.B cat /sys=
/class/scsi_host/host1/version=0Adriver: 1.1.2\-126=0Afirmware: 1.29\-112=
=0A.EE=0A.in=0A.TP=0A.IR /sys/class/scsi_host/host * /lockup_action=0AThe h=
ost=0A.I lockup_action=0Aattribute is a read/write attribute.=0AThis attrib=
ute will cause the driver to perform a specific action in the=0Aunlikely ev=
ent that a controller lockup has been detected.=0ASee=0A.BR OPTIONS=0Aabove=
=0Afor an explanation of the=0A.I lockup_action=0Avalues.=0A.SS SmartPQI-sp=
ecific disk attribute files in \f[BI]/sys\fP=0AIn the file specifications b=
elow,=0A.I c=0Astands for the number of the appropriate SCSI controller,=0A=
=2EI b=0Athe bus number,=0A.I t=0Athe target number, and=0A.I l=0Athe logic=
al unit number (LUN).=0A.TP=0A.IR /sys/class/scsi_disk/ c : b : t : l /devi=
ce/raid_level=0AThe=0A.I raid_level=0Aattribute is read-only.=0AThis attrib=
ute contains the RAID level of each logical drive.=0A.IP=0AFor example:=0A.=
in +4n=0A.EX=0A$ \c=0A.B cat /sys/class/scsi_disk/4:0:0:0/device/raid_level=
=0ARAID 0=0A.EE=0A.in=0A.TP=0A.IR /sys/class/scsi_disk/c : b : t : l/device=
/sas_address=0AThe=0A.I sas_address=0Aattribute is read-only.=0AThis attrib=
ute contains the unique identifier of the disk.=0A.IP=0AFor example:=0A.in =
+4n=0A.EX=0A$ \c=0A.B cat /sys/class/scsi_disk/1:0:3:0/device/sas_address=
=0A0x5001173d028543a2=0A.EE=0A.in=0A.TP=0A.IR /sys/class/scsi_disk/c : b : =
t : l/device/ssd_smart_path_enabled=0AThe=0A.I ssd_smart_path_enabled=0Aatt=
ribute is read-only.=0A.\" What is "ioaccel"?  This string appears nowhere =
in man-pages HEAD.=0AThis attribute is for ioaccel-enabled volumes.=0AConta=
ins 1 if ioaccel is enabled for the volume and 0 otherwise.=0A.IP=0AFor exa=
mple:=0A.in +4n=0A.EX=0A$ \c=0A.\" This example line is too wide for an 80-=
column TTY.=0A.B cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_ena=
bled=0A0=0A.EE=0A.in=0A.SS Supported \f[BI]ioctl\fP\/() operations=0A.\" Do=
es this subsection belong here, under .SH FILES ?=0AFor compatibility with =
applications written for the=0A.BR cciss (4)=0Aand=0A.BR hpsa (4)=0Adrivers=
, many, but not all of the=0A.IR ioctl s=0Asupported by the=0A.B hpsa=0Adri=
ver are also supported by the=0A.B smartpqi=0Adriver.=0AThe data structures=
 used by these=0A.IR ioctl s=0Aare described in the Linux kernel source fil=
e=0A.IR include/linux/cciss_ioctl.h .=0A.TP=0A.BR CCISS_DEREGDISK ,\c=0A.BR=
 CCISS_REGNEWDISK ,\c=0A.B CCISS_REGNEWD=0AThe above three=0A.IR ioctl s=0A=
all do exactly the same thing, which is to cause the driver to re-scan=0Afo=
r new devices.=0AThis does exactly the same thing as writing to the=0A.BR s=
martpqi -specific=0Ahost=0A.I rescan=0Aattribute.=0A.TP=0A.B CCISS_GETPCIIN=
FO=0AReturns the PCI domain, bus, device and function and "board ID" (PCI=
=0Asubsystem ID).=0A.TP=0A.B CCISS_GETDRIVVER=0AReturns the driver version =
in four bytes, encoded as:=0A.EX=0A(major_version << 28) | (minor_version <=
< 24) | (release << 16) | revision=0A.EE=0A.TP=0A.B CCISS_PASSTHRU=0AAllows=
 BMIC and CISS commands to be passed through to the controller.=0A.SH SEE A=
LSO=0A.BR cciss (4),=0A.BR hpsa (4),=0A.BR sd (4),=0A.BR st (4)=0A.PP=0A.I =
Documentation/ABI/testing/sysfs\-bus\-pci\-devices\-cciss=0Ain the Linux ke=
rnel source tree.=0A
--6l7apffsed3efefb
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="smartpqi.diff"

--- smartpqi.4	2017-10-19 15:40:10.044996618 -0400
+++ smartpqi_branden.man	2017-10-19 17:20:45.658894362 -0400
@@ -5,191 +5,220 @@
 .\" %%%LICENSE_START(GPLv2_ONELINE)
 .\" Licensed under GNU General Public License version 2 (GPLv2)
 .\" %%%LICENSE_END
-.\"
-.\" shorthand for double quote that works everywhere.
-.ds q \N'34'
-.TH SMARTPQI 4 "smartpqi"
+.TH SMARTPQI 4 2017-10-19 "Linux" "Linux Programmer's Manual"
 .SH NAME
 smartpqi \- Microsemi Smart Family SCSI driver
 .SH SYNOPSIS
-.nf
-modprobe smartpqi [ disable_device_id_wildcards=1 ] [ disable_heartbeat=1 ] [ disable_ctrl_shutdown=1 ] [ lockup_action=none | reboot | panic ]
-.fi
+.SY "modprobe smartpqi"
+.RB [ disable_device_id_wildcards= { 0 | 1 }]
+.RB [ disable_heartbeat= { 0 | 1 }]
+.RB [ disable_ctrl_shutdown= { 0 | 1 }]
+.RB [ lockup_action= { none | reboot | panic }]
+.YS
 .SH DESCRIPTION
 .B smartpqi
 is a SCSI driver for Microsemi Smart Family controllers.
 .SH OPTIONS
-.PP
-disable_device_id_wildcards=1
-.RS 4
-This option disables support for device ID wildcards.
+.TP
+.BR disable_device_id_wildcards= { 0 | 1 }
+Disables support for device ID wildcards.
 The default value is 0.
-.RE
-.PP
-disable_heartbeat=1
-.RS 4
-This option disables support for the controller's heartbeat check. This parameter is used for debug purposes.
-The default value is 0, do not disable the heartbeat check.
-.RE
-.PP
-disable_ctrl_shutdown=1
-.RS 4
-This option disables support for shutting down the controller in the event of a controller lockup.
+.TP
+.BR disable_heartbeat= { 0 | 1 }
+Disables support for the controller's heartbeat check.
+This parameter is used for debugging purposes.
+The default value is 0, leaving the controller's heartbeat check active.
+.TP
+.BR disable_ctrl_shutdown= { 0 | 1 }
+Disables support for shutting down the controller in the
+event of a controller lockup.
 The default value is 0.
-.RE
-.PP
-lockup_action=none | reboot | panic
-.RS 4
-This option specifies the action the driver takes when a controller lockup is detected.
-The default action is none.
-.PP
-.RE
-.RS 4
-.nf
-parameter          action
----------          ----------------------------
-.br
-none               take controller offline only
-.br
-reboot             reboot the system
-.br
-panic              panic the system
-.fi
-.RE
-.SH CONFIGURATION DETAILS
-To configure Microsemi Smart Family controllers, please refer to the controller's User Guide documentation.
+.TP
+.BR lockup_action= { none | reboot | panic }
+Specifies the action the driver takes when a controller
+lockup is detected.
+The default action is
+.BR none .
+.TS
+l l
+---
+l l.
+parameter	action
+\fBnone\fP	take controller offline only
+\fBreboot\fP	reboot the system
+\fBpanic\fP	panic the system
+.TE
+.SH CONFIGURATION
+To configure Microsemi Smart Family controllers, please refer to the
+controller's User Guide documentation.
+.\" Does this manual have a title?  Is it freely available online?
+.\" Does it have a stable URL?  Can this information be moved to the SEE
+.\" ALSO section?
 .RE
 .SH FILES
-.SS DEVICE NODES
-Logical drives are accessed via the SCSI disk driver (sd),
-tape drives via the SCSI tape driver (st), and
-the RAID controller via the SCSI generic driver (sg), with
-device nodes named /dev/sd*, /dev/st*, and /dev/sg*, respectively.
-.SS SMARTPQI SPECIFIC HOST ATTRIBUTE FILES IN /sys
-
-.PP
-.I /sys/class/scsi_host/host*/rescan
-.RS 4
-The host "rescan" attribute is a write-only attribute.  Writing to
-this attribute will cause the driver to scan for new, changed, or
-removed devices (e.g. hot-plugged tape drives, or newly configured
-or deleted logical drives, etc.) and notify the SCSI mid-layer of
-any changes detected.  Normally this is triggered automatically by
-configuration changes, so the user should not normally have to use
-this. It may be useful when hot plugging devices like tape drives,
-or entire storage boxes containing pre-configured logical drives.
-.RE
-.PP
-.I /sys/class/scsi_host/host*/version
-.RS 4
-The host "version" attribute is a read-only attribute. This attribute
-contains the driver version and the controller firmware version.
-.nf
-.PP
+.SS Device nodes
+Logical drives are accessed via the SCSI disk driver
+.RI ( sd ),
+tape drives via the SCSI tape driver
+.RI ( st ),
+and the RAID controller via the SCSI generic driver
+.RI ( sg ),
+with device nodes named
+.IR /dev/sd *,
+.IR /dev/st *,
+and
+.IR /dev/sg *,
+respectively.
+.SS SmartPQI-specific host attribute files in \f[BI]/sys\fP
+.TP
+.IR /sys/class/scsi_host/host * /rescan
+The host
+.I rescan
+attribute is a write-only attribute.
+Writing to this attribute will cause the driver to scan for new,
+changed, or removed devices (e.g., hot-plugged tape drives, or newly
+configured or deleted logical drives) and notify the SCSI mid-layer of
+any changes detected.
+Normally this action is triggered automatically by configuration
+changes, so the user should not normally have to write to this file.
+Doing so may be useful when hot-plugging devices like tape drives, or
+entire storage boxes containing pre-configured logical drives.
+.TP
+.IR /sys/class/scsi_host/host * /version
+The host
+.I version
+attribute is a read-only attribute.
+This attribute contains the driver version and the controller firmware
+version.
+.IP
 For example:
-.RS 4
-
-cat /sys/class/scsi_host/host1/version
-driver: 1.1.2-126
-firmware: 1.29-112
-.RE
-.fi
-.RE
-.PP
-.I /sys/class/scsi_host/host*/lockup_action
-.RS 4
-The host "lockup_action" attribute is a read-write attribute. This attribute
-will cause the driver to perform a specific action in the unlikely event that
-a controller lockup has been detected. See
-.B OPTIONS
-section for an explanation
-of the lockup_action values.
-.RE
-
-.SS SMARTPQI SPECIFIC DISK ATTRIBUTE FILES IN /sys
-.PP
-.I /sys/class/scsi_disk/c:b:t:l/device/raid_level
-.RS 4
-The "raid_level" attribute is read-only.
+.in +4n
+.EX
+$ \c
+.B cat /sys/class/scsi_host/host1/version
+driver: 1.1.2\-126
+firmware: 1.29\-112
+.EE
+.in
+.TP
+.IR /sys/class/scsi_host/host * /lockup_action
+The host
+.I lockup_action
+attribute is a read/write attribute.
+This attribute will cause the driver to perform a specific action in the
+unlikely event that a controller lockup has been detected.
+See
+.BR OPTIONS
+above
+for an explanation of the
+.I lockup_action
+values.
+.SS SmartPQI-specific disk attribute files in \f[BI]/sys\fP
+In the file specifications below,
+.I c
+stands for the number of the appropriate SCSI controller,
+.I b
+the bus number,
+.I t
+the target number, and
+.I l
+the logical unit number (LUN).
+.TP
+.IR /sys/class/scsi_disk/ c : b : t : l /device/raid_level
+The
+.I raid_level
+attribute is read-only.
 This attribute contains the RAID level of each logical drive.
-.P
-.nf
+.IP
 For example:
-.RS 4
-cat /sys/class/scsi_disk/4:0:0:0/device/raid_level
+.in +4n
+.EX
+$ \c
+.B cat /sys/class/scsi_disk/4:0:0:0/device/raid_level
 RAID 0
-.RE
-.fi
-.RE
-.PP
-.I /sys/class/scsi_disk/c:b:t:l/device/sas_address
-.RS 4
-The "sas_address" attribute is read-only.
+.EE
+.in
+.TP
+.IR /sys/class/scsi_disk/c : b : t : l/device/sas_address
+The
+.I sas_address
+attribute is read-only.
 This attribute contains the unique identifier of the disk.
-.P
-.nf
+.IP
 For example:
-.RS 4
-cat /sys/class/scsi_disk/1:0:3:0/device/sas_address
+.in +4n
+.EX
+$ \c
+.B cat /sys/class/scsi_disk/1:0:3:0/device/sas_address
 0x5001173d028543a2
-.RE
-.fi
-.RE
-.PP
-.I /sys/class/scsi_disk/c:b:t:l/device/ssd_smart_path_enabled
-.RS 4
-The "ssd_smart_path_enabled" attribute is read-only.
-This attribute is for ioaccel enabled volumes.
-Contains 1 if ioaccel is enabled for the volume, 0 otherwise.
-.P
-.nf
+.EE
+.in
+.TP
+.IR /sys/class/scsi_disk/c : b : t : l/device/ssd_smart_path_enabled
+The
+.I ssd_smart_path_enabled
+attribute is read-only.
+.\" What is "ioaccel"?  This string appears nowhere in man-pages HEAD.
+This attribute is for ioaccel-enabled volumes.
+Contains 1 if ioaccel is enabled for the volume and 0 otherwise.
+.IP
 For example:
-.RS 4
-cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_enabled
+.in +4n
+.EX
+$ \c
+.\" This example line is too wide for an 80-column TTY.
+.B cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_enabled
 0
-.RE
-.fi
-.RE
-.SH SUPPORTED IOCTLS
-For compatibility with applications written for the hpsa driver, many, but
-not all of the ioctls supported by the hpsa driver are also supported by the
-smartpqi driver.  The data structures used by these are described in
-include/linux/cciss_ioctl.h
-.PP
-CCISS_DEREGDISK,
-CCISS_REGNEWDISK,
-and CCISS_REGNEWD
-.RS 4
-The above three ioctls all do exactly the same thing, which is to cause the driver
-to rescan for new devices.  This does exactly the same thing as writing to the
-smartpqi specific host "rescan" attribute.
-.RE
-.PP
-CCISS_GETPCIINFO
-.RS 4
-Returns PCI domain, bus, device and function and "board ID" (PCI subsystem ID).
-.RE
-.PP
-CCISS_GETDRIVVER
-.RS 4
-Returns driver version in four bytes encoded as:
+.EE
+.in
+.SS Supported \f[BI]ioctl\fP\/() operations
+.\" Does this subsection belong here, under .SH FILES ?
+For compatibility with applications written for the
+.BR cciss (4)
+and
+.BR hpsa (4)
+drivers, many, but not all of the
+.IR ioctl s
+supported by the
+.B hpsa
+driver are also supported by the
+.B smartpqi
+driver.
+The data structures used by these
+.IR ioctl s
+are described in the Linux kernel source file
+.IR include/linux/cciss_ioctl.h .
+.TP
+.BR CCISS_DEREGDISK ,\c
+.BR CCISS_REGNEWDISK ,\c
+.B CCISS_REGNEWD
+The above three
+.IR ioctl s
+all do exactly the same thing, which is to cause the driver to re-scan
+for new devices.
+This does exactly the same thing as writing to the
+.BR smartpqi -specific
+host
+.I rescan
+attribute.
+.TP
+.B CCISS_GETPCIINFO
+Returns the PCI domain, bus, device and function and "board ID" (PCI
+subsystem ID).
+.TP
+.B CCISS_GETDRIVVER
+Returns the driver version in four bytes, encoded as:
+.EX
 (major_version << 28) | (minor_version << 24) | (release << 16) | revision
-.RE
+.EE
+.TP
+.B CCISS_PASSTHRU
+Allows BMIC and CISS commands to be passed through to the controller.
+.SH SEE ALSO
+.BR cciss (4),
+.BR hpsa (4),
+.BR sd (4),
+.BR st (4)
 .PP
-CCISS_PASSTHRU
-.RS 4
-Allows "BMIC" and "CISS" commands to be passed through to the controller.
-.RE
-.SH "SEE ALSO"
-hpsa(4), sd(4), st(4), and from the linux kernel source tree:
-.br
-Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
-
-.SH AUTHORS
-smartpqi was written by Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
-.br
-.nf
-This man page was written by Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org> and
-.br
-Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
-.fi
+.I Documentation/ABI/testing/sysfs\-bus\-pci\-devices\-cciss
+in the Linux kernel source tree.

--6l7apffsed3efefb--

--ib22imrxppc5wyes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnpGrYACgkQ0Z6cfXEm
bc5TeA//S5HFsMcS4VUWw04d6eLsyjRJ6vR+XBOSQVNb9ou3dBDB8k8fKKXfQyRa
Fgh0ed+gPsMHvLAQkdndwtK4JEeFl51u452VUihnLT4axyWjykDnp2XOrqy3WOPB
RBFzoeynks9UNjM7mG+1FeOgEshmuAihdltWX1+JAypmTHFJ31LlJGT0mjYN2TGq
KbdlPKlACcFeIhyYeSMXkCCVVKsN5HbtnQ6TIIx9jREAKPyclKavhvXoZe72rupn
o/DYamEGjrSEDXElv3JTFwv4vSJLG4HMw6GqFsEJaBQLZLibDXiGC6UFTXJuWj2T
4S9rg/aVM/4lHeTFiYj0j4a6HBIIG2I12w86ViMyyNb+RVs2OuR3RjITwGc3RPBn
bQhg5rXbGTLiFdjpYo17tbumcMoIZFdLyP0kFfLixG0eRy394NKwySpbXP8FlscH
lhzjr7AOsBnGFZssldutk0aKrU1972Nc5Fyl7ZpPYkpyxu2otHnIbuZFf9bIYPhg
hoWZXD0lU4wSVw0cNBGkDPMfv0Dm52ULD43AERcuhhENBz/6OmaKyGuI1J2mRwnH
v0/6xk7o0h/KpWMcvPynkHIjcQ2115LD104YCiT1bzq3yupfeAYnU11sEA5gJ187
AMmXClUdu/jsEQiObNHq89MrVvZDXZKtmoJiPjA1uvqhz3SJHP0=
=gvT6
-----END PGP SIGNATURE-----

--ib22imrxppc5wyes--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
