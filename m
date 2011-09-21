From: scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org
Subject: Re: [PATCH] Add man page for the cciss driver
Date: Wed, 21 Sep 2011 09:46:40 -0500
Message-ID: <20110921144640.GH20956@beardog.cce.hp.com>
References: <20110812142359.21252.86908.stgit@beardog.cce.hp.com> <CAKgNAkg9srUqE0kBHgRdSsNAfhyaOCBpn-WGZMQsPM6Wy4yq7g@mail.gmail.com> <CADzpL0QvJ2s5eFJGFm-S4dD7EgQJ8FkJPQZiufKPDi=cdTPGrg@mail.gmail.com> <CAKgNAkjVsJJj2wz3NgPOJ4oN7kWTGms4+pCR0vGaWH6sXH+t9w@mail.gmail.com> <CAKgNAkhBhO=bez6KJkrF_MXVfCjsCK_m6HsBrjT17pHYj7gg1w@mail.gmail.com> <CADzpL0TEEaGRepL4CKvWQ-YYQmwWfW8wYhOSqj-OpFteJ5CF-w@mail.gmail.com> <CAKgNAkjFLPoOM2QiPkfx9=w8HA0_gapqQHFjA_UTOfrRA3fvtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjFLPoOM2QiPkfx9=w8HA0_gapqQHFjA_UTOfrRA3fvtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Cameron <stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mikem-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org, varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 21, 2011 at 06:46:24AM +0200, Michael Kerrisk wrote:
> On Tue, Sep 20, 2011 at 8:04 PM, Stephen Cameron
> <stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi,
> >
> > GPL v. 2 would be fine.
> >
> > Copyright assignment should be to:
> >
> > Hewlett-Packard Development Company, L.P.
> 
> Hi Steve,
> 
> Thank you for this page! The fundamental content is great. I did some
> editing as follows:
> 
> 1. I removed the AUTHORS section, since that's not used in man-pages.
> 
> 2. I did some formatting fixes (to be consistent with man-pages
> conventions) and some copyediting, rewording some long sentences, etc.
> Hopefully, I did not change the meaning anywhere, but you should
> carefully read the entire page to check.
> 
> 3. There were a few pieces where I had questions. I've added FIXMEs for you.
> 
> Because of 2 and 3, could I ask you to please take a look at the
> revised page, and send me back comments/fixes.

Enclosed are my attempts at fixing the parts you noted.

-- steve

> 
> Cheers,
> 
> Michael
> 
> .\" Copyright (C) 2011, Hewlett-Packard Development Company, L.P.
> .\" Written by Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
> .\" Licensed under GNU General Public License version 2 (GPLv2)
> .\"
> .\" shorthand for double quote that works everywhere.
> .ds q \N'34'
> .TH CCISS 4  2011-09-21 "Linux" "Linux Programmer's Manual"
> .SH NAME
> cciss \- HP Smart Array block driver
> .SH SYNOPSIS
> .nf
> modprobe cciss [ cciss_allow_hpsa=1 ]
> .fi
> .SH DESCRIPTION
> .B cciss
> is a block driver for older HP Smart Array RAID controllers.
> .SS Options
> .IR "cciss_allow_hpsa=1" :
> This option prevents the
> .B cciss
> driver from attempting to drive any controllers which the
> .BR hpsa (4)
> driver is capable of controlling, which is to say, the
> .B cciss
> driver is restricted by this option to the following controllers:
> .nf
> 
>     Smart Array 5300
>     Smart Array 5i
>     Smart Array 532
>     Smart Array 5312
>     Smart Array 641
>     Smart Array 642
>     Smart Array 6400
>     Smart Array 6400 EM
>     Smart Array 6i
>     Smart Array P600
>     Smart Array P400i
>     Smart Array E200i
>     Smart Array E200
>     Smart Array E200i
>     Smart Array E200i
>     Smart Array E200i
>     Smart Array E500
> .fi
> .SS Supported Hardware
> The
> .B cciss
> driver supports the following Smart Array boards:
> .nf
> 
>     Smart Array 5300
>     Smart Array 5i
>     Smart Array 532
>     Smart Array 5312
>     Smart Array 641
>     Smart Array 642
>     Smart Array 6400
>     Smart Array 6400 U320 Expansion Module
>     Smart Array 6i
>     Smart Array P600
>     Smart Array P800
>     Smart Array E400
>     Smart Array P400i
>     Smart Array E200
>     Smart Array E200i
>     Smart Array E500
>     Smart Array P700m
>     Smart Array P212
>     Smart Array P410
>     Smart Array P410i
>     Smart Array P411
>     Smart Array P812
>     Smart Array P712m
>     Smart Array P711m
> .fi
> .SS Configuration Details
> To configure HP Smart Array controllers,
> use the HP Array Configuration Utility
> (either
> .BR hpacuxe (8)
> or
> .BR hpacucli (8))
> or the Offline ROM-based Configuration Utility (ORCA)
> run from the Smart Array's option ROM at boot time.
> .SH FILES
> .SS Device Nodes
> The device naming scheme is as follows:
> .nf
> 
> Major numbers:
> 
>     104     cciss0
>     105     cciss1
>     106     cciss2
>     105     cciss3
>     108     cciss4
>     109     cciss5
>     110     cciss6
>     111     cciss7
> 
> Minor numbers:
> 
>     b7 b6 b5 b4 b3 b2 b1 b0
>     |----+----| |----+----|
>          |           |
>          |           +-------- Partition ID (0=wholedev, 1-15 partition)
>          |
>          +-------------------- Logical Volume number
> 
> The device naming scheme is:
> 
>     /dev/cciss/c0d0         Controller 0, disk 0, whole device
>     /dev/cciss/c0d0p1       Controller 0, disk 0, partition 1
>     /dev/cciss/c0d0p2       Controller 0, disk 0, partition 2
>     /dev/cciss/c0d0p3       Controller 0, disk 0, partition 3
> 
>     /dev/cciss/c1d1         Controller 1, disk 1, whole device
>     /dev/cciss/c1d1p1       Controller 1, disk 1, partition 1
>     /dev/cciss/c1d1p2       Controller 1, disk 1, partition 2
>     /dev/cciss/c1d1p3       Controller 1, disk 1, partition 3
> 
> .fi
> .SS Files in /proc
> The files
> .I /proc/driver/cciss/cciss[0-9]+
> contain information about
> the configuration of each controller.
> For example:
> .nf
> 
>     $ \fBcd /proc/driver/cciss\fP
>     $ \fBls -l\fP
>     total 0
>     -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss0
>     -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss1
>     -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss2
>     $ \fBcat cciss2\fP
>     cciss2: HP Smart Array P800 Controller
>     Board ID: 0x3223103c
>     Firmware Version: 7.14
>     IRQ: 16
>     Logical drives: 1
>     Current Q depth: 0
>     Current # commands on controller: 0
>     Max Q depth since init: 1
>     Max # commands on controller since init: 2
>     Max SG entries since init: 32
>     Sequential access devices: 0
> 
>     cciss/c2d0:   36.38GB       RAID 0
> 
> .fi
> .SS Files in /sys
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/model
> Displays the SCSI INQUIRY page 0 model for logical drive
> .I Y
> of controller
> .IR X .
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/rev
> Displays the SCSI INQUIRY page 0 revision for logical drive
> .I Y
> of controller
> .IR X .
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/unique_id
> Displays the SCSI INQUIRY page 83 serial number for logical drive
> .I Y
> of controller
> .IR X .
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/vendor
> Displays the SCSI INQUIRY page 0 vendor for logical drive
> .I Y
> of controller
> .IR X .
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/block:cciss!cXdY
> A symbolic link to
> .IR /sys/block/cciss!cXdY .
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/rescan
> .\" FIXME The following is not clear. How is the rescan kicked off?
> .\" Do you write something to this file?
> Kicks off a rescan of the controller to discover
> logical drive topology changes.
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/resettable
> A value of 1 displayed in this file indicates that
> the "reset_devices=1" kernel parameter (used by
> .BR kdump )
> is honored by this controller.
> A value of 0 indicates that the
> "reset_devices=1" kernel parameter will not be honored.
> Some models of Smart Array are not able to honor this parameter.
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/lunid
> Displays the 8-byte LUN ID used to address logical drive
> .I Y
> of controller
> .IR X .
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/raid_level
> Displays the RAID level of logical drive
> .I Y
> of controller
> .IR X .
> .TP
> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/usage_count
> Displays the usage count (number of opens) of logical drive
> .I Y
> of controller
> .IR X .
> .SS SCSI tape drive and medium changer support
> SCSI sequential access devices and medium changer devices are supported and
> appropriate device nodes are automatically created (e.g.,
> .IR /dev/st0 ,
> .IR /dev/st1 ,
> etc.; see
> .BR st (4)
> for more details.)
> You must enable "SCSI tape drive support for Smart Array 5xxx" and
> "SCSI support" in your kernel configuration to be able to use SCSI
> tape drives with your Smart Array 5xxx controller.
> 
> Additionally, note that the driver will not engage the SCSI core at
> init time.
> The driver must be directed to dynamically engage the SCSI core via
> the /proc file-system entry, which the "block" side of the driver creates as
> .I /proc/driver/cciss/cciss*
> at runtime.
> This is because at driver init time,
> the SCSI core may not yet be initialized (because the driver is a block
> driver) and attempting to register it with the SCSI core in such a case
> would cause a hang.
> This is best done via an initialization script
> (typically in
> .IR /etc/init.d ,
> but could vary depending on distribution).
> For example:
> .nf
> 
>     for x in /proc/driver/cciss/cciss[0-9]*
>     do
>         echo "engage scsi" > $x
>     done
> 
> .fi
> Once the SCSI core is engaged by the driver, it cannot be disengaged
> (except by unloading the driver, if it happens to be linked as a module.)
> 
> Note also that if no sequential access devices or medium changers are
> detected, the SCSI core will not be engaged by the action of the above
> script.
> 
> .SS Hot plug support for SCSI tape drives
> 
> Hot plugging of SCSI tape drives is supported, with some caveats.
> The
> .B cciss
> driver must be informed that changes to the SCSI bus
> have been made.
> This may be done via the /proc file system.
> For example:
> 
>     echo "rescan" > /proc/scsi/cciss0/1
> 
> This causes the driver to:
> .RS
> .IP 1. 3
> query the adapter about changes to the
> physical SCSI buses and/or fibre channel arbitrated loop, and
> .IP 2.
> make note of any new or removed sequential access devices
> or medium changers.
> .RE
> .LP
> The driver will output messages indicating which
> devices have been added or removed and the controller, bus, target and
> lun used to address each device.
> The driver then notifies the SCSI midlayer
> of these changes.
> 
> Note that the naming convention of the /proc file-system entries
> contains a number in addition to the driver name
> (e.g., "cciss0"
> instead of just "cciss", which you might expect).
> 
> Note:
> .I Only
> sequential access devices and medium changers are presented
> as SCSI devices to the SCSI midlayer by the
> .B cciss
> driver.
> Specifically, physical SCSI disk drives are
> .I not
> presented to the SCSI midlayer.
> .\" FIXME The following sentence doesn't quite parse smantically, and it
> .\" presents multiple ideas. Please rewrite as shorter sentences.
> The physical SCSI disk drives are controlled directly by the array controller
> hardware and it is important to prevent the kernel from attempting to directly
> access these devices too, as if the array controller were merely a SCSI
> controller in the same way that we are allowing it to access SCSI tape drives.
> .SS SCSI error handling for tape drives and medium changers
> The Linux SCSI midlayer provides an error-handling protocol which
> is initiated whenever a SCSI command fails to complete within a
> certain amount of time (which can vary depending on the command).
> The
> .B cciss
> driver participates in this protocol to some extent.
> The normal protocol is a four-step process:
> .IP * 3
> First, the device is told to abort the command.
> .IP *
> If that doesn't work, the device is reset.
> .IP *
> If that doesn't work, the SCSI bus is reset.
> .IP *
> If that doesn't work the host bus adapter is reset.
> .LP
> .\" FIXME Check the following. There was a very long sentence here that
> .\" was hard to parse. I broke it into 3 sentences. Is the meaning still
> .\" correctly conveyed?
> The
> .B cciss
> driver is a block
> driver as well as a SCSI driver and only the tape drives and medium
> changers are presented to the SCSI midlayer
> Furthermore, unlike more
> straightforward SCSI drivers, disk I/O continues through the block
> side during the SCSI error-recovery process
> Therefore, the
> .B cciss
> driver implements only the first two of these actions,
> aborting the command, and resetting the device.
> Note also that most tape drives will not oblige
> in aborting commands, and sometimes it appears they will not even
> obey a reset command, though in most circumstances they will.
> If the command cannot be aborted and the device cannot be
> reset, the device will be set offline.
> 
> In the event that the error-handling code is triggered and a tape drive is
> successfully reset or the tardy command is successfully aborted, the
> tape drive may still not allow I/O to continue until some command
> is issued which positions the tape to a known position.
> Typically you must rewind the tape (by issuing
> .I "mt -f /dev/st0 rewind"
> for example)
> before I/O can proceed again to a tape drive which was reset.
> .SH "SEE ALSO"
> .BR cciss_vol_status (8),
> .BR hpsa (4),
> .BR hpacucli (8),
> .BR hpacuxe (8),
> .IR http://cciss.sf.net ,
> and the Linux kernel source files
> .I Documentation/blockdev/cciss.txt
> and
> .I Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
> .\" .SH AUTHORS
> .\" Don Brace, Steve Cameron, Chase Maupin, Mike Miller, Michael Ni,
> .\" Charles White, Francis Wiran
> .\" and probably some other people.
> 
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/



--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cciss.4"

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
When this file is written to, the driver rescans the controller
to discover any new, removed or modified logical drives.
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
presented to the SCSI midlayer.  The only disk devices
which are presented to the kernel are are logical
drives which the array controller constructs from regions on
the physical drives.  The logical drives are presented to the
block layer not the SCSI midlayer.  It is important for the driver
to prevent the kernel from accessing the physical drives directly
since these drives are used by the array controller to construct
the logical drives.
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

--qDbXVdCdHGoSgWSk--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
