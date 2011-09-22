From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add man page for the cciss driver
Date: Thu, 22 Sep 2011 05:31:56 +0200
Message-ID: <CAKgNAkh+0qeaZ-UEGt+fCuVguXz62x0dw23uFBSU8f7tK5hO6g@mail.gmail.com>
References: <20110812142359.21252.86908.stgit@beardog.cce.hp.com>
 <CAKgNAkg9srUqE0kBHgRdSsNAfhyaOCBpn-WGZMQsPM6Wy4yq7g@mail.gmail.com>
 <CADzpL0QvJ2s5eFJGFm-S4dD7EgQJ8FkJPQZiufKPDi=cdTPGrg@mail.gmail.com>
 <CAKgNAkjVsJJj2wz3NgPOJ4oN7kWTGms4+pCR0vGaWH6sXH+t9w@mail.gmail.com>
 <CAKgNAkhBhO=bez6KJkrF_MXVfCjsCK_m6HsBrjT17pHYj7gg1w@mail.gmail.com>
 <CADzpL0TEEaGRepL4CKvWQ-YYQmwWfW8wYhOSqj-OpFteJ5CF-w@mail.gmail.com>
 <CAKgNAkjFLPoOM2QiPkfx9=w8HA0_gapqQHFjA_UTOfrRA3fvtA@mail.gmail.com> <20110921144640.GH20956@beardog.cce.hp.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110921144640.GH20956-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org
Cc: Stephen Cameron <stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mikem-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org, varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Steve

On Wed, Sep 21, 2011 at 4:46 PM,  <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Sep 21, 2011 at 06:46:24AM +0200, Michael Kerrisk wrote:
>> On Tue, Sep 20, 2011 at 8:04 PM, Stephen Cameron
>> <stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Hi,
>> >
>> > GPL v. 2 would be fine.
>> >
>> > Copyright assignment should be to:
>> >
>> > Hewlett-Packard Development Company, L.P.
>>
>> Hi Steve,
>>
>> Thank you for this page! The fundamental content is great. I did som=
e
>> editing as follows:
>>
>> 1. I removed the AUTHORS section, since that's not used in man-pages=
=2E
>>
>> 2. I did some formatting fixes (to be consistent with man-pages
>> conventions) and some copyediting, rewording some long sentences, et=
c.
>> Hopefully, I did not change the meaning anywhere, but you should
>> carefully read the entire page to check.
>>
>> 3. There were a few pieces where I had questions. I've added FIXMEs =
for you.
>>
>> Because of 2 and 3, could I ask you to please take a look at the
>> revised page, and send me back comments/fixes.
>
> Enclosed are my attempts at fixing the parts you noted.

Thanks! I've put the page into the upcoming 3.34 release.

Cheers,

Michael


>> .\" Copyright (C) 2011, Hewlett-Packard Development Company, L.P.
>> .\" Written by Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
>> .\" Licensed under GNU General Public License version 2 (GPLv2)
>> .\"
>> .\" shorthand for double quote that works everywhere.
>> .ds q \N'34'
>> .TH CCISS 4 =A02011-09-21 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> cciss \- HP Smart Array block driver
>> .SH SYNOPSIS
>> .nf
>> modprobe cciss [ cciss_allow_hpsa=3D1 ]
>> .fi
>> .SH DESCRIPTION
>> .B cciss
>> is a block driver for older HP Smart Array RAID controllers.
>> .SS Options
>> .IR "cciss_allow_hpsa=3D1" :
>> This option prevents the
>> .B cciss
>> driver from attempting to drive any controllers which the
>> .BR hpsa (4)
>> driver is capable of controlling, which is to say, the
>> .B cciss
>> driver is restricted by this option to the following controllers:
>> .nf
>>
>> =A0 =A0 Smart Array 5300
>> =A0 =A0 Smart Array 5i
>> =A0 =A0 Smart Array 532
>> =A0 =A0 Smart Array 5312
>> =A0 =A0 Smart Array 641
>> =A0 =A0 Smart Array 642
>> =A0 =A0 Smart Array 6400
>> =A0 =A0 Smart Array 6400 EM
>> =A0 =A0 Smart Array 6i
>> =A0 =A0 Smart Array P600
>> =A0 =A0 Smart Array P400i
>> =A0 =A0 Smart Array E200i
>> =A0 =A0 Smart Array E200
>> =A0 =A0 Smart Array E200i
>> =A0 =A0 Smart Array E200i
>> =A0 =A0 Smart Array E200i
>> =A0 =A0 Smart Array E500
>> .fi
>> .SS Supported Hardware
>> The
>> .B cciss
>> driver supports the following Smart Array boards:
>> .nf
>>
>> =A0 =A0 Smart Array 5300
>> =A0 =A0 Smart Array 5i
>> =A0 =A0 Smart Array 532
>> =A0 =A0 Smart Array 5312
>> =A0 =A0 Smart Array 641
>> =A0 =A0 Smart Array 642
>> =A0 =A0 Smart Array 6400
>> =A0 =A0 Smart Array 6400 U320 Expansion Module
>> =A0 =A0 Smart Array 6i
>> =A0 =A0 Smart Array P600
>> =A0 =A0 Smart Array P800
>> =A0 =A0 Smart Array E400
>> =A0 =A0 Smart Array P400i
>> =A0 =A0 Smart Array E200
>> =A0 =A0 Smart Array E200i
>> =A0 =A0 Smart Array E500
>> =A0 =A0 Smart Array P700m
>> =A0 =A0 Smart Array P212
>> =A0 =A0 Smart Array P410
>> =A0 =A0 Smart Array P410i
>> =A0 =A0 Smart Array P411
>> =A0 =A0 Smart Array P812
>> =A0 =A0 Smart Array P712m
>> =A0 =A0 Smart Array P711m
>> .fi
>> .SS Configuration Details
>> To configure HP Smart Array controllers,
>> use the HP Array Configuration Utility
>> (either
>> .BR hpacuxe (8)
>> or
>> .BR hpacucli (8))
>> or the Offline ROM-based Configuration Utility (ORCA)
>> run from the Smart Array's option ROM at boot time.
>> .SH FILES
>> .SS Device Nodes
>> The device naming scheme is as follows:
>> .nf
>>
>> Major numbers:
>>
>> =A0 =A0 104 =A0 =A0 cciss0
>> =A0 =A0 105 =A0 =A0 cciss1
>> =A0 =A0 106 =A0 =A0 cciss2
>> =A0 =A0 105 =A0 =A0 cciss3
>> =A0 =A0 108 =A0 =A0 cciss4
>> =A0 =A0 109 =A0 =A0 cciss5
>> =A0 =A0 110 =A0 =A0 cciss6
>> =A0 =A0 111 =A0 =A0 cciss7
>>
>> Minor numbers:
>>
>> =A0 =A0 b7 b6 b5 b4 b3 b2 b1 b0
>> =A0 =A0 |----+----| |----+----|
>> =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0 |
>> =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0 +-------- Partition ID (0=3D=
wholedev, 1-15 partition)
>> =A0 =A0 =A0 =A0 =A0|
>> =A0 =A0 =A0 =A0 =A0+-------------------- Logical Volume number
>>
>> The device naming scheme is:
>>
>> =A0 =A0 /dev/cciss/c0d0 =A0 =A0 =A0 =A0 Controller 0, disk 0, whole =
device
>> =A0 =A0 /dev/cciss/c0d0p1 =A0 =A0 =A0 Controller 0, disk 0, partitio=
n 1
>> =A0 =A0 /dev/cciss/c0d0p2 =A0 =A0 =A0 Controller 0, disk 0, partitio=
n 2
>> =A0 =A0 /dev/cciss/c0d0p3 =A0 =A0 =A0 Controller 0, disk 0, partitio=
n 3
>>
>> =A0 =A0 /dev/cciss/c1d1 =A0 =A0 =A0 =A0 Controller 1, disk 1, whole =
device
>> =A0 =A0 /dev/cciss/c1d1p1 =A0 =A0 =A0 Controller 1, disk 1, partitio=
n 1
>> =A0 =A0 /dev/cciss/c1d1p2 =A0 =A0 =A0 Controller 1, disk 1, partitio=
n 2
>> =A0 =A0 /dev/cciss/c1d1p3 =A0 =A0 =A0 Controller 1, disk 1, partitio=
n 3
>>
>> .fi
>> .SS Files in /proc
>> The files
>> .I /proc/driver/cciss/cciss[0-9]+
>> contain information about
>> the configuration of each controller.
>> For example:
>> .nf
>>
>> =A0 =A0 $ \fBcd /proc/driver/cciss\fP
>> =A0 =A0 $ \fBls -l\fP
>> =A0 =A0 total 0
>> =A0 =A0 -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss0
>> =A0 =A0 -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss1
>> =A0 =A0 -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss2
>> =A0 =A0 $ \fBcat cciss2\fP
>> =A0 =A0 cciss2: HP Smart Array P800 Controller
>> =A0 =A0 Board ID: 0x3223103c
>> =A0 =A0 Firmware Version: 7.14
>> =A0 =A0 IRQ: 16
>> =A0 =A0 Logical drives: 1
>> =A0 =A0 Current Q depth: 0
>> =A0 =A0 Current # commands on controller: 0
>> =A0 =A0 Max Q depth since init: 1
>> =A0 =A0 Max # commands on controller since init: 2
>> =A0 =A0 Max SG entries since init: 32
>> =A0 =A0 Sequential access devices: 0
>>
>> =A0 =A0 cciss/c2d0: =A0 36.38GB =A0 =A0 =A0 RAID 0
>>
>> .fi
>> .SS Files in /sys
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/model
>> Displays the SCSI INQUIRY page 0 model for logical drive
>> .I Y
>> of controller
>> .IR X .
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/rev
>> Displays the SCSI INQUIRY page 0 revision for logical drive
>> .I Y
>> of controller
>> .IR X .
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/unique_id
>> Displays the SCSI INQUIRY page 83 serial number for logical drive
>> .I Y
>> of controller
>> .IR X .
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/vendor
>> Displays the SCSI INQUIRY page 0 vendor for logical drive
>> .I Y
>> of controller
>> .IR X .
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/block:cciss!cXdY
>> A symbolic link to
>> .IR /sys/block/cciss!cXdY .
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/rescan
>> .\" FIXME The following is not clear. How is the rescan kicked off?
>> .\" Do you write something to this file?
>> Kicks off a rescan of the controller to discover
>> logical drive topology changes.
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/resettable
>> A value of 1 displayed in this file indicates that
>> the "reset_devices=3D1" kernel parameter (used by
>> .BR kdump )
>> is honored by this controller.
>> A value of 0 indicates that the
>> "reset_devices=3D1" kernel parameter will not be honored.
>> Some models of Smart Array are not able to honor this parameter.
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/lunid
>> Displays the 8-byte LUN ID used to address logical drive
>> .I Y
>> of controller
>> .IR X .
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/raid_level
>> Displays the RAID level of logical drive
>> .I Y
>> of controller
>> .IR X .
>> .TP
>> .I /sys/bus/pci/devices/<dev>/ccissX/cXdY/usage_count
>> Displays the usage count (number of opens) of logical drive
>> .I Y
>> of controller
>> .IR X .
>> .SS SCSI tape drive and medium changer support
>> SCSI sequential access devices and medium changer devices are suppor=
ted and
>> appropriate device nodes are automatically created (e.g.,
>> .IR /dev/st0 ,
>> .IR /dev/st1 ,
>> etc.; see
>> .BR st (4)
>> for more details.)
>> You must enable "SCSI tape drive support for Smart Array 5xxx" and
>> "SCSI support" in your kernel configuration to be able to use SCSI
>> tape drives with your Smart Array 5xxx controller.
>>
>> Additionally, note that the driver will not engage the SCSI core at
>> init time.
>> The driver must be directed to dynamically engage the SCSI core via
>> the /proc file-system entry, which the "block" side of the driver cr=
eates as
>> .I /proc/driver/cciss/cciss*
>> at runtime.
>> This is because at driver init time,
>> the SCSI core may not yet be initialized (because the driver is a bl=
ock
>> driver) and attempting to register it with the SCSI core in such a c=
ase
>> would cause a hang.
>> This is best done via an initialization script
>> (typically in
>> .IR /etc/init.d ,
>> but could vary depending on distribution).
>> For example:
>> .nf
>>
>> =A0 =A0 for x in /proc/driver/cciss/cciss[0-9]*
>> =A0 =A0 do
>> =A0 =A0 =A0 =A0 echo "engage scsi" > $x
>> =A0 =A0 done
>>
>> .fi
>> Once the SCSI core is engaged by the driver, it cannot be disengaged
>> (except by unloading the driver, if it happens to be linked as a mod=
ule.)
>>
>> Note also that if no sequential access devices or medium changers ar=
e
>> detected, the SCSI core will not be engaged by the action of the abo=
ve
>> script.
>>
>> .SS Hot plug support for SCSI tape drives
>>
>> Hot plugging of SCSI tape drives is supported, with some caveats.
>> The
>> .B cciss
>> driver must be informed that changes to the SCSI bus
>> have been made.
>> This may be done via the /proc file system.
>> For example:
>>
>> =A0 =A0 echo "rescan" > /proc/scsi/cciss0/1
>>
>> This causes the driver to:
>> .RS
>> .IP 1. 3
>> query the adapter about changes to the
>> physical SCSI buses and/or fibre channel arbitrated loop, and
>> .IP 2.
>> make note of any new or removed sequential access devices
>> or medium changers.
>> .RE
>> .LP
>> The driver will output messages indicating which
>> devices have been added or removed and the controller, bus, target a=
nd
>> lun used to address each device.
>> The driver then notifies the SCSI midlayer
>> of these changes.
>>
>> Note that the naming convention of the /proc file-system entries
>> contains a number in addition to the driver name
>> (e.g., "cciss0"
>> instead of just "cciss", which you might expect).
>>
>> Note:
>> .I Only
>> sequential access devices and medium changers are presented
>> as SCSI devices to the SCSI midlayer by the
>> .B cciss
>> driver.
>> Specifically, physical SCSI disk drives are
>> .I not
>> presented to the SCSI midlayer.
>> .\" FIXME The following sentence doesn't quite parse smantically, an=
d it
>> .\" presents multiple ideas. Please rewrite as shorter sentences.
>> The physical SCSI disk drives are controlled directly by the array c=
ontroller
>> hardware and it is important to prevent the kernel from attempting t=
o directly
>> access these devices too, as if the array controller were merely a S=
CSI
>> controller in the same way that we are allowing it to access SCSI ta=
pe drives.
>> .SS SCSI error handling for tape drives and medium changers
>> The Linux SCSI midlayer provides an error-handling protocol which
>> is initiated whenever a SCSI command fails to complete within a
>> certain amount of time (which can vary depending on the command).
>> The
>> .B cciss
>> driver participates in this protocol to some extent.
>> The normal protocol is a four-step process:
>> .IP * 3
>> First, the device is told to abort the command.
>> .IP *
>> If that doesn't work, the device is reset.
>> .IP *
>> If that doesn't work, the SCSI bus is reset.
>> .IP *
>> If that doesn't work the host bus adapter is reset.
>> .LP
>> .\" FIXME Check the following. There was a very long sentence here t=
hat
>> .\" was hard to parse. I broke it into 3 sentences. Is the meaning s=
till
>> .\" correctly conveyed?
>> The
>> .B cciss
>> driver is a block
>> driver as well as a SCSI driver and only the tape drives and medium
>> changers are presented to the SCSI midlayer
>> Furthermore, unlike more
>> straightforward SCSI drivers, disk I/O continues through the block
>> side during the SCSI error-recovery process
>> Therefore, the
>> .B cciss
>> driver implements only the first two of these actions,
>> aborting the command, and resetting the device.
>> Note also that most tape drives will not oblige
>> in aborting commands, and sometimes it appears they will not even
>> obey a reset command, though in most circumstances they will.
>> If the command cannot be aborted and the device cannot be
>> reset, the device will be set offline.
>>
>> In the event that the error-handling code is triggered and a tape dr=
ive is
>> successfully reset or the tardy command is successfully aborted, the
>> tape drive may still not allow I/O to continue until some command
>> is issued which positions the tape to a known position.
>> Typically you must rewind the tape (by issuing
>> .I "mt -f /dev/st0 rewind"
>> for example)
>> before I/O can proceed again to a tape drive which was reset.
>> .SH "SEE ALSO"
>> .BR cciss_vol_status (8),
>> .BR hpsa (4),
>> .BR hpacucli (8),
>> .BR hpacuxe (8),
>> .IR http://cciss.sf.net ,
>> and the Linux kernel source files
>> .I Documentation/blockdev/cciss.txt
>> and
>> .I Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
>> .\" .SH AUTHORS
>> .\" Don Brace, Steve Cameron, Chase Maupin, Mike Miller, Michael Ni,
>> .\" Charles White, Francis Wiran
>> .\" and probably some other people.
>>
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
>
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
