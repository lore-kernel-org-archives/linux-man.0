From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add man page for the cciss driver
Date: Wed, 21 Sep 2011 06:46:24 +0200
Message-ID: <CAKgNAkjFLPoOM2QiPkfx9=w8HA0_gapqQHFjA_UTOfrRA3fvtA@mail.gmail.com>
References: <20110812142359.21252.86908.stgit@beardog.cce.hp.com>
 <CAKgNAkg9srUqE0kBHgRdSsNAfhyaOCBpn-WGZMQsPM6Wy4yq7g@mail.gmail.com>
 <CADzpL0QvJ2s5eFJGFm-S4dD7EgQJ8FkJPQZiufKPDi=cdTPGrg@mail.gmail.com>
 <CAKgNAkjVsJJj2wz3NgPOJ4oN7kWTGms4+pCR0vGaWH6sXH+t9w@mail.gmail.com>
 <CAKgNAkhBhO=bez6KJkrF_MXVfCjsCK_m6HsBrjT17pHYj7gg1w@mail.gmail.com> <CADzpL0TEEaGRepL4CKvWQ-YYQmwWfW8wYhOSqj-OpFteJ5CF-w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=000e0cdf15ec5e159204ad6c4315
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADzpL0TEEaGRepL4CKvWQ-YYQmwWfW8wYhOSqj-OpFteJ5CF-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Cameron <stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Stephen M. Cameron" <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mikem-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org, varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--000e0cdf15ec5e159204ad6c4315
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 20, 2011 at 8:04 PM, Stephen Cameron
<stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> GPL v. 2 would be fine.
>
> Copyright assignment should be to:
>
> Hewlett-Packard Development Company, L.P.

Hi Steve,

Thank you for this page! The fundamental content is great. I did some
editing as follows:

1. I removed the AUTHORS section, since that's not used in man-pages.

2. I did some formatting fixes (to be consistent with man-pages
conventions) and some copyediting, rewording some long sentences, etc.
Hopefully, I did not change the meaning anywhere, but you should
carefully read the entire page to check.

3. There were a few pieces where I had questions. I've added FIXMEs for you.

Because of 2 and 3, could I ask you to please take a look at the
revised page, and send me back comments/fixes.

Cheers,

Michael

.\" Copyright (C) 2011, Hewlett-Packard Development Company, L.P.
.\" Written by Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
.\" Licensed under GNU General Public License version 2 (GPLv2)
.\"
.\" shorthand for double quote that works everywhere.
.ds q \N'34'
.TH CCISS 4  2011-09-21 "Linux" "Linux Programmer's Manual"
.SH NAME
cciss \- HP Smart Array block driver
.SH SYNOPSIS
.nf
modprobe cciss [ cciss_allow_hpsa=1 ]
.fi
.SH DESCRIPTION
.B cciss
is a block driver for older HP Smart Array RAID controllers.
.SS Options
.IR "cciss_allow_hpsa=1" :
This option prevents the
.B cciss
driver from attempting to drive any controllers which the
.BR hpsa (4)
driver is capable of controlling, which is to say, the
.B cciss
driver is restricted by this option to the following controllers:
.nf

    Smart Array 5300
    Smart Array 5i
    Smart Array 532
    Smart Array 5312
    Smart Array 641
    Smart Array 642
    Smart Array 6400
    Smart Array 6400 EM
    Smart Array 6i
    Smart Array P600
    Smart Array P400i
    Smart Array E200i
    Smart Array E200
    Smart Array E200i
    Smart Array E200i
    Smart Array E200i
    Smart Array E500
.fi
.SS Supported Hardware
The
.B cciss
driver supports the following Smart Array boards:
.nf

    Smart Array 5300
    Smart Array 5i
    Smart Array 532
    Smart Array 5312
    Smart Array 641
    Smart Array 642
    Smart Array 6400
    Smart Array 6400 U320 Expansion Module
    Smart Array 6i
    Smart Array P600
    Smart Array P800
    Smart Array E400
    Smart Array P400i
    Smart Array E200
    Smart Array E200i
    Smart Array E500
    Smart Array P700m
    Smart Array P212
    Smart Array P410
    Smart Array P410i
    Smart Array P411
    Smart Array P812
    Smart Array P712m
    Smart Array P711m
.fi
.SS Configuration Details
To configure HP Smart Array controllers,
use the HP Array Configuration Utility
(either
.BR hpacuxe (8)
or
.BR hpacucli (8))
or the Offline ROM-based Configuration Utility (ORCA)
run from the Smart Array's option ROM at boot time.
.SH FILES
.SS Device Nodes
The device naming scheme is as follows:
.nf

Major numbers:

    104     cciss0
    105     cciss1
    106     cciss2
    105     cciss3
    108     cciss4
    109     cciss5
    110     cciss6
    111     cciss7

Minor numbers:

    b7 b6 b5 b4 b3 b2 b1 b0
    |----+----| |----+----|
         |           |
         |           +-------- Partition ID (0=wholedev, 1-15 partition)
         |
         +-------------------- Logical Volume number

The device naming scheme is:

    /dev/cciss/c0d0         Controller 0, disk 0, whole device
    /dev/cciss/c0d0p1       Controller 0, disk 0, partition 1
    /dev/cciss/c0d0p2       Controller 0, disk 0, partition 2
    /dev/cciss/c0d0p3       Controller 0, disk 0, partition 3

    /dev/cciss/c1d1         Controller 1, disk 1, whole device
    /dev/cciss/c1d1p1       Controller 1, disk 1, partition 1
    /dev/cciss/c1d1p2       Controller 1, disk 1, partition 2
    /dev/cciss/c1d1p3       Controller 1, disk 1, partition 3

.fi
.SS Files in /proc
The files
.I /proc/driver/cciss/cciss[0-9]+
contain information about
the configuration of each controller.
For example:
.nf

    $ \fBcd /proc/driver/cciss\fP
    $ \fBls -l\fP
    total 0
    -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss0
    -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss1
    -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss2
    $ \fBcat cciss2\fP
    cciss2: HP Smart Array P800 Controller
    Board ID: 0x3223103c
    Firmware Version: 7.14
    IRQ: 16
    Logical drives: 1
    Current Q depth: 0
    Current # commands on controller: 0
    Max Q depth since init: 1
    Max # commands on controller since init: 2
    Max SG entries since init: 32
    Sequential access devices: 0

    cciss/c2d0:   36.38GB       RAID 0

.fi
.SS Files in /sys
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/cXdY/model
Displays the SCSI INQUIRY page 0 model for logical drive
.I Y
of controller
.IR X .
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/cXdY/rev
Displays the SCSI INQUIRY page 0 revision for logical drive
.I Y
of controller
.IR X .
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/cXdY/unique_id
Displays the SCSI INQUIRY page 83 serial number for logical drive
.I Y
of controller
.IR X .
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/cXdY/vendor
Displays the SCSI INQUIRY page 0 vendor for logical drive
.I Y
of controller
.IR X .
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/cXdY/block:cciss!cXdY
A symbolic link to
.IR /sys/block/cciss!cXdY .
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/rescan
.\" FIXME The following is not clear. How is the rescan kicked off?
.\" Do you write something to this file?
Kicks off a rescan of the controller to discover
logical drive topology changes.
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/resettable
A value of 1 displayed in this file indicates that
the "reset_devices=1" kernel parameter (used by
.BR kdump )
is honored by this controller.
A value of 0 indicates that the
"reset_devices=1" kernel parameter will not be honored.
Some models of Smart Array are not able to honor this parameter.
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/cXdY/lunid
Displays the 8-byte LUN ID used to address logical drive
.I Y
of controller
.IR X .
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/cXdY/raid_level
Displays the RAID level of logical drive
.I Y
of controller
.IR X .
.TP
.I /sys/bus/pci/devices/<dev>/ccissX/cXdY/usage_count
Displays the usage count (number of opens) of logical drive
.I Y
of controller
.IR X .
.SS SCSI tape drive and medium changer support
SCSI sequential access devices and medium changer devices are supported and
appropriate device nodes are automatically created (e.g.,
.IR /dev/st0 ,
.IR /dev/st1 ,
etc.; see
.BR st (4)
for more details.)
You must enable "SCSI tape drive support for Smart Array 5xxx" and
"SCSI support" in your kernel configuration to be able to use SCSI
tape drives with your Smart Array 5xxx controller.

Additionally, note that the driver will not engage the SCSI core at
init time.
The driver must be directed to dynamically engage the SCSI core via
the /proc file-system entry, which the "block" side of the driver creates as
.I /proc/driver/cciss/cciss*
at runtime.
This is because at driver init time,
the SCSI core may not yet be initialized (because the driver is a block
driver) and attempting to register it with the SCSI core in such a case
would cause a hang.
This is best done via an initialization script
(typically in
.IR /etc/init.d ,
but could vary depending on distribution).
For example:
.nf

    for x in /proc/driver/cciss/cciss[0-9]*
    do
        echo "engage scsi" > $x
    done

.fi
Once the SCSI core is engaged by the driver, it cannot be disengaged
(except by unloading the driver, if it happens to be linked as a module.)

Note also that if no sequential access devices or medium changers are
detected, the SCSI core will not be engaged by the action of the above
script.

.SS Hot plug support for SCSI tape drives

Hot plugging of SCSI tape drives is supported, with some caveats.
The
.B cciss
driver must be informed that changes to the SCSI bus
have been made.
This may be done via the /proc file system.
For example:

    echo "rescan" > /proc/scsi/cciss0/1

This causes the driver to:
.RS
.IP 1. 3
query the adapter about changes to the
physical SCSI buses and/or fibre channel arbitrated loop, and
.IP 2.
make note of any new or removed sequential access devices
or medium changers.
.RE
.LP
The driver will output messages indicating which
devices have been added or removed and the controller, bus, target and
lun used to address each device.
The driver then notifies the SCSI midlayer
of these changes.

Note that the naming convention of the /proc file-system entries
contains a number in addition to the driver name
(e.g., "cciss0"
instead of just "cciss", which you might expect).

Note:
.I Only
sequential access devices and medium changers are presented
as SCSI devices to the SCSI midlayer by the
.B cciss
driver.
Specifically, physical SCSI disk drives are
.I not
presented to the SCSI midlayer.
.\" FIXME The following sentence doesn't quite parse smantically, and it
.\" presents multiple ideas. Please rewrite as shorter sentences.
The physical SCSI disk drives are controlled directly by the array controller
hardware and it is important to prevent the kernel from attempting to directly
access these devices too, as if the array controller were merely a SCSI
controller in the same way that we are allowing it to access SCSI tape drives.
.SS SCSI error handling for tape drives and medium changers
The Linux SCSI midlayer provides an error-handling protocol which
is initiated whenever a SCSI command fails to complete within a
certain amount of time (which can vary depending on the command).
The
.B cciss
driver participates in this protocol to some extent.
The normal protocol is a four-step process:
.IP * 3
First, the device is told to abort the command.
.IP *
If that doesn't work, the device is reset.
.IP *
If that doesn't work, the SCSI bus is reset.
.IP *
If that doesn't work the host bus adapter is reset.
.LP
.\" FIXME Check the following. There was a very long sentence here that
.\" was hard to parse. I broke it into 3 sentences. Is the meaning still
.\" correctly conveyed?
The
.B cciss
driver is a block
driver as well as a SCSI driver and only the tape drives and medium
changers are presented to the SCSI midlayer
Furthermore, unlike more
straightforward SCSI drivers, disk I/O continues through the block
side during the SCSI error-recovery process
Therefore, the
.B cciss
driver implements only the first two of these actions,
aborting the command, and resetting the device.
Note also that most tape drives will not oblige
in aborting commands, and sometimes it appears they will not even
obey a reset command, though in most circumstances they will.
If the command cannot be aborted and the device cannot be
reset, the device will be set offline.

In the event that the error-handling code is triggered and a tape drive is
successfully reset or the tardy command is successfully aborted, the
tape drive may still not allow I/O to continue until some command
is issued which positions the tape to a known position.
Typically you must rewind the tape (by issuing
.I "mt -f /dev/st0 rewind"
for example)
before I/O can proceed again to a tape drive which was reset.
.SH "SEE ALSO"
.BR cciss_vol_status (8),
.BR hpsa (4),
.BR hpacucli (8),
.BR hpacuxe (8),
.IR http://cciss.sf.net ,
and the Linux kernel source files
.I Documentation/blockdev/cciss.txt
and
.I Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
.\" .SH AUTHORS
.\" Don Brace, Steve Cameron, Chase Maupin, Mike Miller, Michael Ni,
.\" Charles White, Francis Wiran
.\" and probably some other people.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/

--000e0cdf15ec5e159204ad6c4315
Content-Type: application/octet-stream; name="cciss.4"
Content-Disposition: attachment; filename="cciss.4"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gsttwkh50

LlwiIENvcHlyaWdodCAoQykgMjAxMSwgSGV3bGV0dC1QYWNrYXJkIERldmVsb3BtZW50IENvbXBh
bnksIEwuUC4KLlwiIFdyaXR0ZW4gYnkgU3RlcGhlbiBNLiBDYW1lcm9uIDxzY2FtZXJvbkBiZWFy
ZG9nLmNjZS5ocC5jb20+Ci5cIiBMaWNlbnNlZCB1bmRlciBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSB2ZXJzaW9uIDIgKEdQTHYyKQouXCIKLlwiIHNob3J0aGFuZCBmb3IgZG91YmxlIHF1b3Rl
IHRoYXQgd29ya3MgZXZlcnl3aGVyZS4KLmRzIHEgXE4nMzQnCi5USCBDQ0lTUyA0ICAyMDExLTA5
LTIxICJMaW51eCIgIkxpbnV4IFByb2dyYW1tZXIncyBNYW51YWwiCi5TSCBOQU1FCmNjaXNzIFwt
IEhQIFNtYXJ0IEFycmF5IGJsb2NrIGRyaXZlcgouU0ggU1lOT1BTSVMKLm5mCm1vZHByb2JlIGNj
aXNzIFsgY2Npc3NfYWxsb3dfaHBzYT0xIF0KLmZpCi5TSCBERVNDUklQVElPTgouQiBjY2lzcwpp
cyBhIGJsb2NrIGRyaXZlciBmb3Igb2xkZXIgSFAgU21hcnQgQXJyYXkgUkFJRCBjb250cm9sbGVy
cy4KLlNTIE9wdGlvbnMKLklSICJjY2lzc19hbGxvd19ocHNhPTEiIDoKVGhpcyBvcHRpb24gcHJl
dmVudHMgdGhlCi5CIGNjaXNzCmRyaXZlciBmcm9tIGF0dGVtcHRpbmcgdG8gZHJpdmUgYW55IGNv
bnRyb2xsZXJzIHdoaWNoIHRoZQouQlIgaHBzYSAoNCkKZHJpdmVyIGlzIGNhcGFibGUgb2YgY29u
dHJvbGxpbmcsIHdoaWNoIGlzIHRvIHNheSwgdGhlCi5CIGNjaXNzCmRyaXZlciBpcyByZXN0cmlj
dGVkIGJ5IHRoaXMgb3B0aW9uIHRvIHRoZSBmb2xsb3dpbmcgY29udHJvbGxlcnM6Ci5uZgoKICAg
IFNtYXJ0IEFycmF5IDUzMDAKICAgIFNtYXJ0IEFycmF5IDVpCiAgICBTbWFydCBBcnJheSA1MzIK
ICAgIFNtYXJ0IEFycmF5IDUzMTIKICAgIFNtYXJ0IEFycmF5IDY0MQogICAgU21hcnQgQXJyYXkg
NjQyCiAgICBTbWFydCBBcnJheSA2NDAwCiAgICBTbWFydCBBcnJheSA2NDAwIEVNCiAgICBTbWFy
dCBBcnJheSA2aQogICAgU21hcnQgQXJyYXkgUDYwMAogICAgU21hcnQgQXJyYXkgUDQwMGkKICAg
IFNtYXJ0IEFycmF5IEUyMDBpCiAgICBTbWFydCBBcnJheSBFMjAwCiAgICBTbWFydCBBcnJheSBF
MjAwaQogICAgU21hcnQgQXJyYXkgRTIwMGkKICAgIFNtYXJ0IEFycmF5IEUyMDBpCiAgICBTbWFy
dCBBcnJheSBFNTAwCi5maQouU1MgU3VwcG9ydGVkIEhhcmR3YXJlClRoZQouQiBjY2lzcwpkcml2
ZXIgc3VwcG9ydHMgdGhlIGZvbGxvd2luZyBTbWFydCBBcnJheSBib2FyZHM6Ci5uZgoKICAgIFNt
YXJ0IEFycmF5IDUzMDAKICAgIFNtYXJ0IEFycmF5IDVpCiAgICBTbWFydCBBcnJheSA1MzIKICAg
IFNtYXJ0IEFycmF5IDUzMTIKICAgIFNtYXJ0IEFycmF5IDY0MQogICAgU21hcnQgQXJyYXkgNjQy
CiAgICBTbWFydCBBcnJheSA2NDAwCiAgICBTbWFydCBBcnJheSA2NDAwIFUzMjAgRXhwYW5zaW9u
IE1vZHVsZQogICAgU21hcnQgQXJyYXkgNmkKICAgIFNtYXJ0IEFycmF5IFA2MDAKICAgIFNtYXJ0
IEFycmF5IFA4MDAKICAgIFNtYXJ0IEFycmF5IEU0MDAKICAgIFNtYXJ0IEFycmF5IFA0MDBpCiAg
ICBTbWFydCBBcnJheSBFMjAwCiAgICBTbWFydCBBcnJheSBFMjAwaQogICAgU21hcnQgQXJyYXkg
RTUwMAogICAgU21hcnQgQXJyYXkgUDcwMG0KICAgIFNtYXJ0IEFycmF5IFAyMTIKICAgIFNtYXJ0
IEFycmF5IFA0MTAKICAgIFNtYXJ0IEFycmF5IFA0MTBpCiAgICBTbWFydCBBcnJheSBQNDExCiAg
ICBTbWFydCBBcnJheSBQODEyCiAgICBTbWFydCBBcnJheSBQNzEybQogICAgU21hcnQgQXJyYXkg
UDcxMW0KLmZpCi5TUyBDb25maWd1cmF0aW9uIERldGFpbHMKVG8gY29uZmlndXJlIEhQIFNtYXJ0
IEFycmF5IGNvbnRyb2xsZXJzLAp1c2UgdGhlIEhQIEFycmF5IENvbmZpZ3VyYXRpb24gVXRpbGl0
eQooZWl0aGVyCi5CUiBocGFjdXhlICg4KQpvcgouQlIgaHBhY3VjbGkgKDgpKQpvciB0aGUgT2Zm
bGluZSBST00tYmFzZWQgQ29uZmlndXJhdGlvbiBVdGlsaXR5IChPUkNBKQpydW4gZnJvbSB0aGUg
U21hcnQgQXJyYXkncyBvcHRpb24gUk9NIGF0IGJvb3QgdGltZS4KLlNIIEZJTEVTCi5TUyBEZXZp
Y2UgTm9kZXMKVGhlIGRldmljZSBuYW1pbmcgc2NoZW1lIGlzIGFzIGZvbGxvd3M6Ci5uZgoKTWFq
b3IgbnVtYmVyczoKCiAgICAxMDQgICAgIGNjaXNzMAogICAgMTA1ICAgICBjY2lzczEKICAgIDEw
NiAgICAgY2Npc3MyCiAgICAxMDUgICAgIGNjaXNzMwogICAgMTA4ICAgICBjY2lzczQKICAgIDEw
OSAgICAgY2Npc3M1CiAgICAxMTAgICAgIGNjaXNzNgogICAgMTExICAgICBjY2lzczcKCk1pbm9y
IG51bWJlcnM6CgogICAgYjcgYjYgYjUgYjQgYjMgYjIgYjEgYjAKICAgIHwtLS0tKy0tLS18IHwt
LS0tKy0tLS18CiAgICAgICAgIHwgICAgICAgICAgIHwKICAgICAgICAgfCAgICAgICAgICAgKy0t
LS0tLS0tIFBhcnRpdGlvbiBJRCAoMD13aG9sZWRldiwgMS0xNSBwYXJ0aXRpb24pCiAgICAgICAg
IHwKICAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tIExvZ2ljYWwgVm9sdW1lIG51bWJlcgoK
VGhlIGRldmljZSBuYW1pbmcgc2NoZW1lIGlzOgoKICAgIC9kZXYvY2Npc3MvYzBkMCAgICAgICAg
IENvbnRyb2xsZXIgMCwgZGlzayAwLCB3aG9sZSBkZXZpY2UKICAgIC9kZXYvY2Npc3MvYzBkMHAx
ICAgICAgIENvbnRyb2xsZXIgMCwgZGlzayAwLCBwYXJ0aXRpb24gMQogICAgL2Rldi9jY2lzcy9j
MGQwcDIgICAgICAgQ29udHJvbGxlciAwLCBkaXNrIDAsIHBhcnRpdGlvbiAyCiAgICAvZGV2L2Nj
aXNzL2MwZDBwMyAgICAgICBDb250cm9sbGVyIDAsIGRpc2sgMCwgcGFydGl0aW9uIDMKCiAgICAv
ZGV2L2NjaXNzL2MxZDEgICAgICAgICBDb250cm9sbGVyIDEsIGRpc2sgMSwgd2hvbGUgZGV2aWNl
CiAgICAvZGV2L2NjaXNzL2MxZDFwMSAgICAgICBDb250cm9sbGVyIDEsIGRpc2sgMSwgcGFydGl0
aW9uIDEKICAgIC9kZXYvY2Npc3MvYzFkMXAyICAgICAgIENvbnRyb2xsZXIgMSwgZGlzayAxLCBw
YXJ0aXRpb24gMgogICAgL2Rldi9jY2lzcy9jMWQxcDMgICAgICAgQ29udHJvbGxlciAxLCBkaXNr
IDEsIHBhcnRpdGlvbiAzCgouZmkKLlNTIEZpbGVzIGluIC9wcm9jClRoZSBmaWxlcwouSSAvcHJv
Yy9kcml2ZXIvY2Npc3MvY2Npc3NbMC05XSsKY29udGFpbiBpbmZvcm1hdGlvbiBhYm91dAp0aGUg
Y29uZmlndXJhdGlvbiBvZiBlYWNoIGNvbnRyb2xsZXIuCkZvciBleGFtcGxlOgoubmYKCiAgICAk
IFxmQmNkIC9wcm9jL2RyaXZlci9jY2lzc1xmUAogICAgJCBcZkJscyAtbFxmUAogICAgdG90YWwg
MAogICAgLXJ3LXItLXItLSAxIHJvb3Qgcm9vdCAwIDIwMTAtMDktMTAgMTA6MzggY2Npc3MwCiAg
ICAtcnctci0tci0tIDEgcm9vdCByb290IDAgMjAxMC0wOS0xMCAxMDozOCBjY2lzczEKICAgIC1y
dy1yLS1yLS0gMSByb290IHJvb3QgMCAyMDEwLTA5LTEwIDEwOjM4IGNjaXNzMgogICAgJCBcZkJj
YXQgY2Npc3MyXGZQCiAgICBjY2lzczI6IEhQIFNtYXJ0IEFycmF5IFA4MDAgQ29udHJvbGxlcgog
ICAgQm9hcmQgSUQ6IDB4MzIyMzEwM2MKICAgIEZpcm13YXJlIFZlcnNpb246IDcuMTQKICAgIElS
UTogMTYKICAgIExvZ2ljYWwgZHJpdmVzOiAxCiAgICBDdXJyZW50IFEgZGVwdGg6IDAKICAgIEN1
cnJlbnQgIyBjb21tYW5kcyBvbiBjb250cm9sbGVyOiAwCiAgICBNYXggUSBkZXB0aCBzaW5jZSBp
bml0OiAxCiAgICBNYXggIyBjb21tYW5kcyBvbiBjb250cm9sbGVyIHNpbmNlIGluaXQ6IDIKICAg
IE1heCBTRyBlbnRyaWVzIHNpbmNlIGluaXQ6IDMyCiAgICBTZXF1ZW50aWFsIGFjY2VzcyBkZXZp
Y2VzOiAwCgogICAgY2Npc3MvYzJkMDogICAzNi4zOEdCICAgICAgIFJBSUQgMAoKLmZpCi5TUyBG
aWxlcyBpbiAvc3lzCi5UUAouSSAvc3lzL2J1cy9wY2kvZGV2aWNlcy88ZGV2Pi9jY2lzc1gvY1hk
WS9tb2RlbApEaXNwbGF5cyB0aGUgU0NTSSBJTlFVSVJZIHBhZ2UgMCBtb2RlbCBmb3IgbG9naWNh
bCBkcml2ZQouSSBZCm9mIGNvbnRyb2xsZXIKLklSIFggLgouVFAKLkkgL3N5cy9idXMvcGNpL2Rl
dmljZXMvPGRldj4vY2Npc3NYL2NYZFkvcmV2CkRpc3BsYXlzIHRoZSBTQ1NJIElOUVVJUlkgcGFn
ZSAwIHJldmlzaW9uIGZvciBsb2dpY2FsIGRyaXZlCi5JIFkKb2YgY29udHJvbGxlcgouSVIgWCAu
Ci5UUAouSSAvc3lzL2J1cy9wY2kvZGV2aWNlcy88ZGV2Pi9jY2lzc1gvY1hkWS91bmlxdWVfaWQK
RGlzcGxheXMgdGhlIFNDU0kgSU5RVUlSWSBwYWdlIDgzIHNlcmlhbCBudW1iZXIgZm9yIGxvZ2lj
YWwgZHJpdmUKLkkgWQpvZiBjb250cm9sbGVyCi5JUiBYIC4KLlRQCi5JIC9zeXMvYnVzL3BjaS9k
ZXZpY2VzLzxkZXY+L2NjaXNzWC9jWGRZL3ZlbmRvcgpEaXNwbGF5cyB0aGUgU0NTSSBJTlFVSVJZ
IHBhZ2UgMCB2ZW5kb3IgZm9yIGxvZ2ljYWwgZHJpdmUKLkkgWQpvZiBjb250cm9sbGVyCi5JUiBY
IC4KLlRQCi5JIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxkZXY+L2NjaXNzWC9jWGRZL2Jsb2NrOmNj
aXNzIWNYZFkKQSBzeW1ib2xpYyBsaW5rIHRvCi5JUiAvc3lzL2Jsb2NrL2NjaXNzIWNYZFkgLgou
VFAKLkkgL3N5cy9idXMvcGNpL2RldmljZXMvPGRldj4vY2Npc3NYL3Jlc2NhbgouXCIgRklYTUUg
VGhlIGZvbGxvd2luZyBpcyBub3QgY2xlYXIuIEhvdyBpcyB0aGUgcmVzY2FuIGtpY2tlZCBvZmY/
Ci5cIiBEbyB5b3Ugd3JpdGUgc29tZXRoaW5nIHRvIHRoaXMgZmlsZT8KS2lja3Mgb2ZmIGEgcmVz
Y2FuIG9mIHRoZSBjb250cm9sbGVyIHRvIGRpc2NvdmVyCmxvZ2ljYWwgZHJpdmUgdG9wb2xvZ3kg
Y2hhbmdlcy4KLlRQCi5JIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxkZXY+L2NjaXNzWC9yZXNldHRh
YmxlCkEgdmFsdWUgb2YgMSBkaXNwbGF5ZWQgaW4gdGhpcyBmaWxlIGluZGljYXRlcyB0aGF0CnRo
ZSAicmVzZXRfZGV2aWNlcz0xIiBrZXJuZWwgcGFyYW1ldGVyICh1c2VkIGJ5Ci5CUiBrZHVtcCAp
CmlzIGhvbm9yZWQgYnkgdGhpcyBjb250cm9sbGVyLgpBIHZhbHVlIG9mIDAgaW5kaWNhdGVzIHRo
YXQgdGhlCiJyZXNldF9kZXZpY2VzPTEiIGtlcm5lbCBwYXJhbWV0ZXIgd2lsbCBub3QgYmUgaG9u
b3JlZC4KU29tZSBtb2RlbHMgb2YgU21hcnQgQXJyYXkgYXJlIG5vdCBhYmxlIHRvIGhvbm9yIHRo
aXMgcGFyYW1ldGVyLgouVFAKLkkgL3N5cy9idXMvcGNpL2RldmljZXMvPGRldj4vY2Npc3NYL2NY
ZFkvbHVuaWQKRGlzcGxheXMgdGhlIDgtYnl0ZSBMVU4gSUQgdXNlZCB0byBhZGRyZXNzIGxvZ2lj
YWwgZHJpdmUKLkkgWQpvZiBjb250cm9sbGVyCi5JUiBYIC4KLlRQCi5JIC9zeXMvYnVzL3BjaS9k
ZXZpY2VzLzxkZXY+L2NjaXNzWC9jWGRZL3JhaWRfbGV2ZWwKRGlzcGxheXMgdGhlIFJBSUQgbGV2
ZWwgb2YgbG9naWNhbCBkcml2ZQouSSBZCm9mIGNvbnRyb2xsZXIKLklSIFggLgouVFAKLkkgL3N5
cy9idXMvcGNpL2RldmljZXMvPGRldj4vY2Npc3NYL2NYZFkvdXNhZ2VfY291bnQKRGlzcGxheXMg
dGhlIHVzYWdlIGNvdW50IChudW1iZXIgb2Ygb3BlbnMpIG9mIGxvZ2ljYWwgZHJpdmUKLkkgWQpv
ZiBjb250cm9sbGVyCi5JUiBYIC4KLlNTIFNDU0kgdGFwZSBkcml2ZSBhbmQgbWVkaXVtIGNoYW5n
ZXIgc3VwcG9ydApTQ1NJIHNlcXVlbnRpYWwgYWNjZXNzIGRldmljZXMgYW5kIG1lZGl1bSBjaGFu
Z2VyIGRldmljZXMgYXJlIHN1cHBvcnRlZCBhbmQKYXBwcm9wcmlhdGUgZGV2aWNlIG5vZGVzIGFy
ZSBhdXRvbWF0aWNhbGx5IGNyZWF0ZWQgKGUuZy4sCi5JUiAvZGV2L3N0MCAsCi5JUiAvZGV2L3N0
MSAsCmV0Yy47IHNlZQouQlIgc3QgKDQpCmZvciBtb3JlIGRldGFpbHMuKQpZb3UgbXVzdCBlbmFi
bGUgIlNDU0kgdGFwZSBkcml2ZSBzdXBwb3J0IGZvciBTbWFydCBBcnJheSA1eHh4IiBhbmQKIlND
U0kgc3VwcG9ydCIgaW4geW91ciBrZXJuZWwgY29uZmlndXJhdGlvbiB0byBiZSBhYmxlIHRvIHVz
ZSBTQ1NJCnRhcGUgZHJpdmVzIHdpdGggeW91ciBTbWFydCBBcnJheSA1eHh4IGNvbnRyb2xsZXIu
CgpBZGRpdGlvbmFsbHksIG5vdGUgdGhhdCB0aGUgZHJpdmVyIHdpbGwgbm90IGVuZ2FnZSB0aGUg
U0NTSSBjb3JlIGF0CmluaXQgdGltZS4KVGhlIGRyaXZlciBtdXN0IGJlIGRpcmVjdGVkIHRvIGR5
bmFtaWNhbGx5IGVuZ2FnZSB0aGUgU0NTSSBjb3JlIHZpYQp0aGUgL3Byb2MgZmlsZS1zeXN0ZW0g
ZW50cnksIHdoaWNoIHRoZSAiYmxvY2siIHNpZGUgb2YgdGhlIGRyaXZlciBjcmVhdGVzIGFzCi5J
IC9wcm9jL2RyaXZlci9jY2lzcy9jY2lzcyoKYXQgcnVudGltZS4KVGhpcyBpcyBiZWNhdXNlIGF0
IGRyaXZlciBpbml0IHRpbWUsCnRoZSBTQ1NJIGNvcmUgbWF5IG5vdCB5ZXQgYmUgaW5pdGlhbGl6
ZWQgKGJlY2F1c2UgdGhlIGRyaXZlciBpcyBhIGJsb2NrCmRyaXZlcikgYW5kIGF0dGVtcHRpbmcg
dG8gcmVnaXN0ZXIgaXQgd2l0aCB0aGUgU0NTSSBjb3JlIGluIHN1Y2ggYSBjYXNlCndvdWxkIGNh
dXNlIGEgaGFuZy4KVGhpcyBpcyBiZXN0IGRvbmUgdmlhIGFuIGluaXRpYWxpemF0aW9uIHNjcmlw
dAoodHlwaWNhbGx5IGluCi5JUiAvZXRjL2luaXQuZCAsCmJ1dCBjb3VsZCB2YXJ5IGRlcGVuZGlu
ZyBvbiBkaXN0cmlidXRpb24pLgpGb3IgZXhhbXBsZToKLm5mCgogICAgZm9yIHggaW4gL3Byb2Mv
ZHJpdmVyL2NjaXNzL2NjaXNzWzAtOV0qCiAgICBkbwogICAgICAgIGVjaG8gImVuZ2FnZSBzY3Np
IiA+ICR4CiAgICBkb25lCgouZmkKT25jZSB0aGUgU0NTSSBjb3JlIGlzIGVuZ2FnZWQgYnkgdGhl
IGRyaXZlciwgaXQgY2Fubm90IGJlIGRpc2VuZ2FnZWQKKGV4Y2VwdCBieSB1bmxvYWRpbmcgdGhl
IGRyaXZlciwgaWYgaXQgaGFwcGVucyB0byBiZSBsaW5rZWQgYXMgYSBtb2R1bGUuKQoKTm90ZSBh
bHNvIHRoYXQgaWYgbm8gc2VxdWVudGlhbCBhY2Nlc3MgZGV2aWNlcyBvciBtZWRpdW0gY2hhbmdl
cnMgYXJlCmRldGVjdGVkLCB0aGUgU0NTSSBjb3JlIHdpbGwgbm90IGJlIGVuZ2FnZWQgYnkgdGhl
IGFjdGlvbiBvZiB0aGUgYWJvdmUKc2NyaXB0LgoKLlNTIEhvdCBwbHVnIHN1cHBvcnQgZm9yIFND
U0kgdGFwZSBkcml2ZXMKCkhvdCBwbHVnZ2luZyBvZiBTQ1NJIHRhcGUgZHJpdmVzIGlzIHN1cHBv
cnRlZCwgd2l0aCBzb21lIGNhdmVhdHMuClRoZQouQiBjY2lzcwpkcml2ZXIgbXVzdCBiZSBpbmZv
cm1lZCB0aGF0IGNoYW5nZXMgdG8gdGhlIFNDU0kgYnVzCmhhdmUgYmVlbiBtYWRlLgpUaGlzIG1h
eSBiZSBkb25lIHZpYSB0aGUgL3Byb2MgZmlsZSBzeXN0ZW0uCkZvciBleGFtcGxlOgoKICAgIGVj
aG8gInJlc2NhbiIgPiAvcHJvYy9zY3NpL2NjaXNzMC8xCgpUaGlzIGNhdXNlcyB0aGUgZHJpdmVy
IHRvOgouUlMKLklQIDEuIDMKcXVlcnkgdGhlIGFkYXB0ZXIgYWJvdXQgY2hhbmdlcyB0byB0aGUK
cGh5c2ljYWwgU0NTSSBidXNlcyBhbmQvb3IgZmlicmUgY2hhbm5lbCBhcmJpdHJhdGVkIGxvb3As
IGFuZAouSVAgMi4KbWFrZSBub3RlIG9mIGFueSBuZXcgb3IgcmVtb3ZlZCBzZXF1ZW50aWFsIGFj
Y2VzcyBkZXZpY2VzCm9yIG1lZGl1bSBjaGFuZ2Vycy4KLlJFCi5MUApUaGUgZHJpdmVyIHdpbGwg
b3V0cHV0IG1lc3NhZ2VzIGluZGljYXRpbmcgd2hpY2gKZGV2aWNlcyBoYXZlIGJlZW4gYWRkZWQg
b3IgcmVtb3ZlZCBhbmQgdGhlIGNvbnRyb2xsZXIsIGJ1cywgdGFyZ2V0IGFuZApsdW4gdXNlZCB0
byBhZGRyZXNzIGVhY2ggZGV2aWNlLgpUaGUgZHJpdmVyIHRoZW4gbm90aWZpZXMgdGhlIFNDU0kg
bWlkbGF5ZXIKb2YgdGhlc2UgY2hhbmdlcy4KCk5vdGUgdGhhdCB0aGUgbmFtaW5nIGNvbnZlbnRp
b24gb2YgdGhlIC9wcm9jIGZpbGUtc3lzdGVtIGVudHJpZXMKY29udGFpbnMgYSBudW1iZXIgaW4g
YWRkaXRpb24gdG8gdGhlIGRyaXZlciBuYW1lCihlLmcuLCAiY2Npc3MwIgppbnN0ZWFkIG9mIGp1
c3QgImNjaXNzIiwgd2hpY2ggeW91IG1pZ2h0IGV4cGVjdCkuCgpOb3RlOgouSSBPbmx5CnNlcXVl
bnRpYWwgYWNjZXNzIGRldmljZXMgYW5kIG1lZGl1bSBjaGFuZ2VycyBhcmUgcHJlc2VudGVkCmFz
IFNDU0kgZGV2aWNlcyB0byB0aGUgU0NTSSBtaWRsYXllciBieSB0aGUKLkIgY2Npc3MKZHJpdmVy
LgpTcGVjaWZpY2FsbHksIHBoeXNpY2FsIFNDU0kgZGlzayBkcml2ZXMgYXJlCi5JIG5vdApwcmVz
ZW50ZWQgdG8gdGhlIFNDU0kgbWlkbGF5ZXIuCi5cIiBGSVhNRSBUaGUgZm9sbG93aW5nIHNlbnRl
bmNlIGRvZXNuJ3QgcXVpdGUgcGFyc2Ugc21hbnRpY2FsbHksIGFuZCBpdAouXCIgcHJlc2VudHMg
bXVsdGlwbGUgaWRlYXMuIFBsZWFzZSByZXdyaXRlIGFzIHNob3J0ZXIgc2VudGVuY2VzLgpUaGUg
cGh5c2ljYWwgU0NTSSBkaXNrIGRyaXZlcyBhcmUgY29udHJvbGxlZCBkaXJlY3RseSBieSB0aGUg
YXJyYXkgY29udHJvbGxlcgpoYXJkd2FyZSBhbmQgaXQgaXMgaW1wb3J0YW50IHRvIHByZXZlbnQg
dGhlIGtlcm5lbCBmcm9tIGF0dGVtcHRpbmcgdG8gZGlyZWN0bHkKYWNjZXNzIHRoZXNlIGRldmlj
ZXMgdG9vLCBhcyBpZiB0aGUgYXJyYXkgY29udHJvbGxlciB3ZXJlIG1lcmVseSBhIFNDU0kKY29u
dHJvbGxlciBpbiB0aGUgc2FtZSB3YXkgdGhhdCB3ZSBhcmUgYWxsb3dpbmcgaXQgdG8gYWNjZXNz
IFNDU0kgdGFwZSBkcml2ZXMuCi5TUyBTQ1NJIGVycm9yIGhhbmRsaW5nIGZvciB0YXBlIGRyaXZl
cyBhbmQgbWVkaXVtIGNoYW5nZXJzClRoZSBMaW51eCBTQ1NJIG1pZGxheWVyIHByb3ZpZGVzIGFu
IGVycm9yLWhhbmRsaW5nIHByb3RvY29sIHdoaWNoCmlzIGluaXRpYXRlZCB3aGVuZXZlciBhIFND
U0kgY29tbWFuZCBmYWlscyB0byBjb21wbGV0ZSB3aXRoaW4gYQpjZXJ0YWluIGFtb3VudCBvZiB0
aW1lICh3aGljaCBjYW4gdmFyeSBkZXBlbmRpbmcgb24gdGhlIGNvbW1hbmQpLgpUaGUKLkIgY2Np
c3MKZHJpdmVyIHBhcnRpY2lwYXRlcyBpbiB0aGlzIHByb3RvY29sIHRvIHNvbWUgZXh0ZW50LgpU
aGUgbm9ybWFsIHByb3RvY29sIGlzIGEgZm91ci1zdGVwIHByb2Nlc3M6Ci5JUCAqIDMKRmlyc3Qs
IHRoZSBkZXZpY2UgaXMgdG9sZCB0byBhYm9ydCB0aGUgY29tbWFuZC4KLklQICoKSWYgdGhhdCBk
b2Vzbid0IHdvcmssIHRoZSBkZXZpY2UgaXMgcmVzZXQuCi5JUCAqCklmIHRoYXQgZG9lc24ndCB3
b3JrLCB0aGUgU0NTSSBidXMgaXMgcmVzZXQuCi5JUCAqCklmIHRoYXQgZG9lc24ndCB3b3JrIHRo
ZSBob3N0IGJ1cyBhZGFwdGVyIGlzIHJlc2V0LgouTFAKLlwiIEZJWE1FIENoZWNrIHRoZSBmb2xs
b3dpbmcuIFRoZXJlIHdhcyBhIHZlcnkgbG9uZyBzZW50ZW5jZSBoZXJlIHRoYXQKLlwiIHdhcyBo
YXJkIHRvIHBhcnNlLiBJIGJyb2tlIGl0IGludG8gMyBzZW50ZW5jZXMuIElzIHRoZSBtZWFuaW5n
IHN0aWxsCi5cIiBjb3JyZWN0bHkgY29udmV5ZWQ/ClRoZQouQiBjY2lzcwpkcml2ZXIgaXMgYSBi
bG9jawpkcml2ZXIgYXMgd2VsbCBhcyBhIFNDU0kgZHJpdmVyIGFuZCBvbmx5IHRoZSB0YXBlIGRy
aXZlcyBhbmQgbWVkaXVtCmNoYW5nZXJzIGFyZSBwcmVzZW50ZWQgdG8gdGhlIFNDU0kgbWlkbGF5
ZXIKRnVydGhlcm1vcmUsIHVubGlrZSBtb3JlCnN0cmFpZ2h0Zm9yd2FyZCBTQ1NJIGRyaXZlcnMs
IGRpc2sgSS9PIGNvbnRpbnVlcyB0aHJvdWdoIHRoZSBibG9jawpzaWRlIGR1cmluZyB0aGUgU0NT
SSBlcnJvci1yZWNvdmVyeSBwcm9jZXNzClRoZXJlZm9yZSwgdGhlCi5CIGNjaXNzCmRyaXZlciBp
bXBsZW1lbnRzIG9ubHkgdGhlIGZpcnN0IHR3byBvZiB0aGVzZSBhY3Rpb25zLAphYm9ydGluZyB0
aGUgY29tbWFuZCwgYW5kIHJlc2V0dGluZyB0aGUgZGV2aWNlLgpOb3RlIGFsc28gdGhhdCBtb3N0
IHRhcGUgZHJpdmVzIHdpbGwgbm90IG9ibGlnZQppbiBhYm9ydGluZyBjb21tYW5kcywgYW5kIHNv
bWV0aW1lcyBpdCBhcHBlYXJzIHRoZXkgd2lsbCBub3QgZXZlbgpvYmV5IGEgcmVzZXQgY29tbWFu
ZCwgdGhvdWdoIGluIG1vc3QgY2lyY3Vtc3RhbmNlcyB0aGV5IHdpbGwuCklmIHRoZSBjb21tYW5k
IGNhbm5vdCBiZSBhYm9ydGVkIGFuZCB0aGUgZGV2aWNlIGNhbm5vdCBiZQpyZXNldCwgdGhlIGRl
dmljZSB3aWxsIGJlIHNldCBvZmZsaW5lLgoKSW4gdGhlIGV2ZW50IHRoYXQgdGhlIGVycm9yLWhh
bmRsaW5nIGNvZGUgaXMgdHJpZ2dlcmVkIGFuZCBhIHRhcGUgZHJpdmUgaXMKc3VjY2Vzc2Z1bGx5
IHJlc2V0IG9yIHRoZSB0YXJkeSBjb21tYW5kIGlzIHN1Y2Nlc3NmdWxseSBhYm9ydGVkLCB0aGUK
dGFwZSBkcml2ZSBtYXkgc3RpbGwgbm90IGFsbG93IEkvTyB0byBjb250aW51ZSB1bnRpbCBzb21l
IGNvbW1hbmQKaXMgaXNzdWVkIHdoaWNoIHBvc2l0aW9ucyB0aGUgdGFwZSB0byBhIGtub3duIHBv
c2l0aW9uLgpUeXBpY2FsbHkgeW91IG11c3QgcmV3aW5kIHRoZSB0YXBlIChieSBpc3N1aW5nCi5J
ICJtdCAtZiAvZGV2L3N0MCByZXdpbmQiCmZvciBleGFtcGxlKQpiZWZvcmUgSS9PIGNhbiBwcm9j
ZWVkIGFnYWluIHRvIGEgdGFwZSBkcml2ZSB3aGljaCB3YXMgcmVzZXQuCi5TSCAiU0VFIEFMU08i
Ci5CUiBjY2lzc192b2xfc3RhdHVzICg4KSwKLkJSIGhwc2EgKDQpLAouQlIgaHBhY3VjbGkgKDgp
LAouQlIgaHBhY3V4ZSAoOCksCi5JUiBodHRwOi8vY2Npc3Muc2YubmV0ICwKYW5kIHRoZSBMaW51
eCBrZXJuZWwgc291cmNlIGZpbGVzCi5JIERvY3VtZW50YXRpb24vYmxvY2tkZXYvY2Npc3MudHh0
CmFuZAouSSBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1wY2ktZGV2aWNlcy1j
Y2lzcwouXCIgLlNIIEFVVEhPUlMKLlwiIERvbiBCcmFjZSwgU3RldmUgQ2FtZXJvbiwgQ2hhc2Ug
TWF1cGluLCBNaWtlIE1pbGxlciwgTWljaGFlbCBOaSwKLlwiIENoYXJsZXMgV2hpdGUsIEZyYW5j
aXMgV2lyYW4KLlwiIGFuZCBwcm9iYWJseSBzb21lIG90aGVyIHBlb3BsZS4K
--000e0cdf15ec5e159204ad6c4315--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
