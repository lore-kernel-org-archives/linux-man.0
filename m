From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] smartpqi: initial submit of smartpqi man page
Date: Tue, 14 Nov 2017 08:11:50 +0100
Message-ID: <CAKgNAkiPn1aiBBwDOdds-WBbQY+NAfnh6QXhp9hBTU_3hhOBKQ@mail.gmail.com>
References: <150833943926.13185.7883447908516236321.stgit@brunhilda>
 <20171019213558.aelneujzgyucrye3@crack.deadbeast.net> <4993A297653ECB4581FA5C3C31323D196721BE80@avsrvexchmbx2.microsemi.net>
 <588a2c6e-f01c-f1e8-9fd0-cdcd414dc973@gmail.com> <20171101013656.urhyeq7h2ccclxzu@crack.deadbeast.net>
 <4993A297653ECB4581FA5C3C31323D19698EAC78@avsrvexchmbx1.microsemi.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4993A297653ECB4581FA5C3C31323D19698EAC78-d/0VHx0KLVxmlXRS5xiZ/kujk09f5ZhB0e7PPNI6Mm0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
Cc: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gerry Morong <gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, John Hall <John.Hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Bader Ali - Saleh <bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Teel <scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Justin Lindley <justin.lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Benesh <scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/06/2017 04:26 PM, Don Brace wrote:>
>> -----Original Message-----
>> From: G. Branden Robinson [mailto:g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>> Sent: Tuesday, October 31, 2017 8:37 PM
>> To: Michael Kerrisk (man-opages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Gerry
>> Morong <gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; John Hall
>> <John.Hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>;
>> Bader Ali - Saleh <bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; Scott Teel
>> <scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; Justin Lindley <justin.lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>;
>> Scott Benesh <scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
>> Subject: Re: [PATCH] smartpqi: initial submit of smartpqi man page
>>
>> EXTERNAL EMAIL
>
> I Ack your proposed changes.
>
> Acked-by: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>

Hello Don,

Thanks. I've taken your patch into a local branch, and applied
Branden's patch on top, and done a few edits.

However, Branden raised a couple of relevant questions that I'd
like to get resolved.

Could you take a look at the FIXMEs in the draft below, please.

Cheers,

Michael

.\" Copyright (C) 2016-2017, Microsemi Corporation
.\" Copyright (C) 2016, PMC-Sierra, Inc.
.\" Written by Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
.\"
.\" %%%LICENSE_START(GPLv2_ONELINE)
.\" Licensed under GNU General Public License version 2 (GPLv2)
.\" %%%LICENSE_END
.TH SMARTPQI 4 2017-10-19 "Linux" "Linux Programmer's Manual"
.SH NAME
smartpqi \- Microsemi Smart Family SCSI driver
.SH SYNOPSIS
.SY "modprobe smartpqi"
.RB [ disable_device_id_wildcards= { 0 | 1 }]
.RB [ disable_heartbeat= { 0 | 1 }]
.RB [ disable_ctrl_shutdown= { 0 | 1 }]
.RB [ lockup_action= { none | reboot | panic }]
.YS
.SH DESCRIPTION
.B smartpqi
is a SCSI driver for Microsemi Smart Family controllers.
.SS Supported \f[BI]ioctl\fP\/() operations
For compatibility with applications written for the
.BR cciss (4)
and
.BR hpsa (4)
drivers, many, but not all of the
.BR ioctl (2)
operations supported by the
.B hpsa
driver are also supported by the
.B smartpqi
driver.
The data structures used by these operations
are described in the Linux kernel source file
.IR include/linux/cciss_ioctl.h .
.TP
.BR CCISS_DEREGDISK ", " CCISS_REGNEWDISK ", " CCISS_REGNEWD
These operations
all do exactly the same thing, which is to cause the driver to re-scan
for new devices.
This does exactly the same thing as writing to the
.BR smartpqi -specific
host
.I rescan
attribute.
.TP
.B CCISS_GETPCIINFO
This operation Returns the PCI domain, bus,
device and function and "board ID" (PCI subsystem ID).
.TP
.B CCISS_GETDRIVVER
This operation returns the driver version in four bytes, encoded as:
.IP
.in +4n
.EX
(major_version << 28) | (minor_version << 24) |
        (release << 16) | revision
.EE
.in
.TP
.B CCISS_PASSTHRU
Allows BMIC and CISS commands to be passed through to the controller.
.SS Boot options
.TP
.BR disable_device_id_wildcards= { 0 | 1 }
Disables support for device ID wildcards.
The default value is 0.
.TP
.BR disable_heartbeat= { 0 | 1 }
Disables support for the controller's heartbeat check.
This parameter is used for debugging purposes.
The default value is 0, leaving the controller's heartbeat check active.
.TP
.BR disable_ctrl_shutdown= { 0 | 1 }
Disables support for shutting down the controller in the
event of a controller lockup.
The default value is 0.
.TP
.BR lockup_action= { none | reboot | panic }
Specifies the action the driver takes when a controller
lockup is detected.
The default action is
.BR none .
.TS
l l
---
l l.
parameter    action
\fBnone\fP    take controller offline only
\fBreboot\fP    reboot the system
\fBpanic\fP    panic the system
.TE
.RE
.SH FILES
.SS Device nodes
Logical drives are accessed via the SCSI disk driver
.RI ( sd ),
tape drives via the SCSI tape driver
.RI ( st ),
and the RAID controller via the SCSI generic driver
.RI ( sg ),
with device nodes named
.IR /dev/sd *,
.IR /dev/st *,
and
.IR /dev/sg *,
respectively.
.SS SmartPQI-specific host attribute files in \f[BI]/sys\fP
.TP
.IR /sys/class/scsi_host/host * /rescan
The host
.I rescan
attribute is a write-only attribute.
Writing to this attribute will cause the driver to scan for new,
changed, or removed devices (e.g., hot-plugged tape drives, or newly
configured or deleted logical drives) and notify the SCSI mid-layer of
any changes detected.
Usually this action is triggered automatically by configuration
changes, so the user should not normally have to write to this file.
Doing so may be useful when hot-plugging devices such as tape drives or
entire storage boxes containing pre-configured logical drives.
.TP
.IR /sys/class/scsi_host/host * /version
The host
.I version
attribute is a read-only attribute.
This attribute contains the driver version and the controller firmware
version.
.IP
For example:
.IP
.in +4n
.EX
$ \c
.B cat /sys/class/scsi_host/host1/version
driver: 1.1.2\-126
firmware: 1.29\-112
.EE
.in
.TP
.IR /sys/class/scsi_host/host * /lockup_action
The host
.I lockup_action
attribute is a read/write attribute.
This attribute will cause the driver to perform a specific action in the
unlikely event that a controller lockup has been detected.
See
.BR OPTIONS
above
for an explanation of the
.I lockup_action
values.
.SS SmartPQI-specific disk attribute files in \f[BI]/sys\fP
In the file specifications below,
.I c
stands for the number of the appropriate SCSI controller,
.I b
is the bus number,
.I t
the target number, and
.I l
is the logical unit number (LUN).
.TP
.IR /sys/class/scsi_disk/ c : b : t : l /device/raid_level
The
.I raid_level
attribute is read-only.
This attribute contains the RAID level of each logical drive.
.IP
For example:
.IP
.in +4n
.EX
$ \c
.B cat /sys/class/scsi_disk/4:0:0:0/device/raid_level
RAID 0
.EE
.in
.TP
.IR /sys/class/scsi_disk/c : b : t : l/device/sas_address
The
.I sas_address
attribute is read-only.
This attribute contains the unique identifier of the disk.
.IP
For example:
.IP
.in +4n
.EX
$ \c
.B cat /sys/class/scsi_disk/1:0:3:0/device/sas_address
0x5001173d028543a2
.EE
.in
.TP
.IR /sys/class/scsi_disk/c : b : t : l/device/ssd_smart_path_enabled
The
.I ssd_smart_path_enabled
attribute is read-only.
.\" FIXME
.\" What is "ioaccel"?  This string appears nowhere in man-pages HEAD.
This attribute is for ioaccel-enabled volumes.
Contains 1 if ioaccel is enabled for the volume and 0 otherwise.
.IP
For example:
.IP
.in +2n
.EX
$ \c
.B cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_enabled
0
.EE
.in
.SH VERSIONS
The
.B smarpqi
driver was added in Linux 4.9.
.SH NOTES
.SS Configuration
To configure Microsemi Smart Family controllers, please refer to the
controller's User Guide documentation.
.\" FIXME
.\" Does this manual have a title?  Is it freely available online?
.\" Does it have a stable URL?  Can this information be moved to the SEE
.\" ALSO section?
.SH SEE ALSO
.BR cciss (4),
.BR hpsa (4),
.BR sd (4),
.BR st (4)
.PP
.I Documentation/ABI/testing/sysfs\-bus\-pci\-devices\-cciss
in the Linux kernel source tree.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
