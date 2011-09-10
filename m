From: Stephen Cameron <stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add man page for the cciss driver
Date: Sat, 10 Sep 2011 16:22:35 -0500
Message-ID: <CADzpL0QvJ2s5eFJGFm-S4dD7EgQJ8FkJPQZiufKPDi=cdTPGrg@mail.gmail.com>
References: <20110812142359.21252.86908.stgit@beardog.cce.hp.com>
	<CAKgNAkg9srUqE0kBHgRdSsNAfhyaOCBpn-WGZMQsPM6Wy4yq7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkg9srUqE0kBHgRdSsNAfhyaOCBpn-WGZMQsPM6Wy4yq7g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "Stephen M. Cameron" <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mikem-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org, varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Sorry for the slow reply, I've been on vacation this past week.  What
do you suggest?  Whatever most of the other man pages use is probably
fine, though I will have to check with management at HP to see what
the lawyers insist upon, but it would be good if I had something that
is commonly used to suggest to them.

-- steve

On Fri, Sep 9, 2011 at 9:38 AM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> Stephen,
>
> On Fri, Aug 12, 2011 at 4:23 PM, Stephen M. Cameron
> <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org> wrote:
>> From: Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
>>
>> This patch applied to man-pages-3.32.
>>
>> I obtained the information in this man page as a consequence
>> of having worked on the cciss driver for the past several years,
>> and having written considerable portions of it.
>
> Thanks for the page. I've added it for the upcoming 3.33 release. But
> what license and copyright do you want to assign to the page? (See
> http://man7.org/linux/man-pages/licenses.html)
>
> Cheers,
>
> Michael
>
>
>> Signed-off-by: Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
>> ---
>> =A0man4/cciss.4 | =A0291 +++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++
>> =A01 files changed, 291 insertions(+), 0 deletions(-)
>> =A0create mode 100644 man4/cciss.4
>>
>> diff --git a/man4/cciss.4 b/man4/cciss.4
>> new file mode 100644
>> index 0000000..4f61570
>> --- /dev/null
>> +++ b/man4/cciss.4
>> @@ -0,0 +1,291 @@
>> +.\" shorthand for double quote that works everywhere.
>> +.ds q \N'34'
>> +.TH CCISS 4 "cciss"
>> +.SH NAME
>> +cciss \- HP Smart Array block driver
>> +.SH SYNOPSIS
>> +.nf
>> +modprobe cciss [ cciss_allow_hpsa=3D1 ]
>> +.fi
>> +.SH DESCRIPTION
>> +.B cciss
>> +is a block driver for older HP Smart Array RAID controllers.
>> +.SH OPTIONS
>> +.HP
>> +cciss_allow_hpsa=3D1
>> +This option prevents the cciss driver
>> +from attempting to drive any controllers which the hpsa driver
>> +is capable of controlling, which is to say, the cciss driver
>> +is restricted by this option to the following controllers:
>> +.nf
>> +
>> + =A0 =A0 =A0 Smart Array 5300
>> + =A0 =A0 =A0 Smart Array 5i
>> + =A0 =A0 =A0 Smart Array 532
>> + =A0 =A0 =A0 Smart Array 5312
>> + =A0 =A0 =A0 Smart Array 641
>> + =A0 =A0 =A0 Smart Array 642
>> + =A0 =A0 =A0 Smart Array 6400
>> + =A0 =A0 =A0 Smart Array 6400 EM
>> + =A0 =A0 =A0 Smart Array 6i
>> + =A0 =A0 =A0 Smart Array P600
>> + =A0 =A0 =A0 Smart Array P400i
>> + =A0 =A0 =A0 Smart Array E200i
>> + =A0 =A0 =A0 Smart Array E200
>> + =A0 =A0 =A0 Smart Array E200i
>> + =A0 =A0 =A0 Smart Array E200i
>> + =A0 =A0 =A0 Smart Array E200i
>> + =A0 =A0 =A0 Smart Array E500
>> +.fi
>> +
>> +
>> +.SH SUPPORTED HARDWARE
>> +The
>> +.B cciss
>> +driver supports the following Smart Array boards:
>> +.nf
>> +
>> + =A0 =A0 =A0 Smart Array 5300
>> + =A0 =A0 =A0 Smart Array 5i
>> + =A0 =A0 =A0 Smart Array 532
>> + =A0 =A0 =A0 Smart Array 5312
>> + =A0 =A0 =A0 Smart Array 641
>> + =A0 =A0 =A0 Smart Array 642
>> + =A0 =A0 =A0 Smart Array 6400
>> + =A0 =A0 =A0 Smart Array 6400 U320 Expansion Module
>> + =A0 =A0 =A0 Smart Array 6i
>> + =A0 =A0 =A0 Smart Array P600
>> + =A0 =A0 =A0 Smart Array P800
>> + =A0 =A0 =A0 Smart Array E400
>> + =A0 =A0 =A0 Smart Array P400i
>> + =A0 =A0 =A0 Smart Array E200
>> + =A0 =A0 =A0 Smart Array E200i
>> + =A0 =A0 =A0 Smart Array E500
>> + =A0 =A0 =A0 Smart Array P700m
>> + =A0 =A0 =A0 Smart Array P212
>> + =A0 =A0 =A0 Smart Array P410
>> + =A0 =A0 =A0 Smart Array P410i
>> + =A0 =A0 =A0 Smart Array P411
>> + =A0 =A0 =A0 Smart Array P812
>> + =A0 =A0 =A0 Smart Array P712m
>> + =A0 =A0 =A0 Smart Array P711m
>> +.fi
>> +.SH CONFIGURATION DETAILS
>> +To configure HP Smart Array controllers, use the HP Array Configura=
tion Utility
>> +(either hpacuxe or hpacucli) or the Offline ROM-based Configuration=
 Utility (ORCA)
>> +run from the Smart Array's option ROM at boot time.
>> +.SH FILES
>> +.SS DEVICE NODES
>> +The device naming scheme is as follows:
>> +.nf
>> +Major numbers:
>> + =A0 =A0 =A0 =A0104 =A0 =A0 cciss0
>> + =A0 =A0 =A0 =A0105 =A0 =A0 cciss1
>> + =A0 =A0 =A0 =A0106 =A0 =A0 cciss2
>> + =A0 =A0 =A0 =A0105 =A0 =A0 cciss3
>> + =A0 =A0 =A0 =A0108 =A0 =A0 cciss4
>> + =A0 =A0 =A0 =A0109 =A0 =A0 cciss5
>> + =A0 =A0 =A0 =A0110 =A0 =A0 cciss6
>> + =A0 =A0 =A0 =A0111 =A0 =A0 cciss7
>> +
>> +Minor numbers:
>> + =A0 =A0 =A0 =A0b7 b6 b5 b4 b3 b2 b1 b0
>> + =A0 =A0 =A0 =A0|----+----| |----+----|
>> + =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0 =A0 =A0 =A0 |
>> + =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0 =A0 =A0 =A0 +-------- Partition =
ID (0=3Dwholedev, 1-15 partition)
>> + =A0 =A0 =A0 =A0 =A0 =A0 |
>> + =A0 =A0 =A0 =A0 =A0 =A0 +-------------------- Logical Volume numbe=
r
>> +
>> +The device naming scheme is:
>> +/dev/cciss/c0d0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Controller 0, disk =
0, whole device
>> +/dev/cciss/c0d0p1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Controller 0, disk 0,=
 partition 1
>> +/dev/cciss/c0d0p2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Controller 0, disk 0,=
 partition 2
>> +/dev/cciss/c0d0p3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Controller 0, disk 0,=
 partition 3
>> +
>> +/dev/cciss/c1d1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Controller 1, disk =
1, whole device
>> +/dev/cciss/c1d1p1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Controller 1, disk 1,=
 partition 1
>> +/dev/cciss/c1d1p2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Controller 1, disk 1,=
 partition 2
>> +/dev/cciss/c1d1p3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Controller 1, disk 1,=
 partition 3
>> +
>> +.fi
>> +.SS FILES IN /proc
>> +The files /proc/driver/cciss/cciss[0-9]+ contain information about
>> +the configuration of each controller. =A0For example:
>> +.nf
>> +
>> + =A0 =A0 =A0 someone@somehost:/proc/driver/cciss> ls -l
>> + =A0 =A0 =A0 total 0
>> + =A0 =A0 =A0 -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss0
>> + =A0 =A0 =A0 -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss1
>> + =A0 =A0 =A0 -rw-r--r-- 1 root root 0 2010-09-10 10:38 cciss2
>> + =A0 =A0 =A0 someone@somehost:/proc/driver/cciss> cat cciss2
>> + =A0 =A0 =A0 cciss2: HP Smart Array P800 Controller
>> + =A0 =A0 =A0 Board ID: 0x3223103c
>> + =A0 =A0 =A0 Firmware Version: 7.14
>> + =A0 =A0 =A0 IRQ: 16
>> + =A0 =A0 =A0 Logical drives: 1
>> + =A0 =A0 =A0 Current Q depth: 0
>> + =A0 =A0 =A0 Current # commands on controller: 0
>> + =A0 =A0 =A0 Max Q depth since init: 1
>> + =A0 =A0 =A0 Max # commands on controller since init: 2
>> + =A0 =A0 =A0 Max SG entries since init: 32
>> + =A0 =A0 =A0 Sequential access devices: 0
>> +
>> + =A0 =A0 =A0 cciss/c2d0: =A0 =A0 =A0 36.38GB =A0 =A0 =A0 RAID 0
>> + =A0 =A0 =A0 someone@somehost:/proc/driver/cciss>
>> +
>> +.fi
>> +.SS FILES IN /sys
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/cXdY/model
>> +
>> +Displays the SCSI INQUIRY page 0 model for logical drive Y of contr=
oller X.
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/cXdY/rev
>> +
>> +Displays the SCSI INQUIRY page 0 revision for logical drive Y of co=
ntroller X.
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/cXdY/unique_id
>> +
>> +Displays the SCSI INQUIRY page 83 serial number for logical drive Y=
 of controller X.
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/cXdY/vendor
>> +
>> +Displays the SCSI INQUIRY page 0 vendor for logical drive Y of cont=
roller X.
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/cXdY/block:cciss!cXdY
>> +
>> +A symbolic link to /sys/block/cciss!cXdY
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/rescan
>> +
>> +Kicks off a rescan of the controller to discover logical drive topo=
logy changes.
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/resettable
>> +
>> +A value of 1 indicates the "reset_devices=3D1" kernel parameter (us=
ed by
>> +kdump) is honored by this controller. =A0A value of 0 indicates the
>> +"reset_devices=3D1" kernel parameter will not be honored. =A0Some m=
odels
>> +of Smart Array are not able to honor this parameter.
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/cXdY/lunid
>> +
>> +Displays the 8-byte LUN ID used to address logical drive Y of contr=
oller X.
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/cXdY/raid_level
>> +
>> +Displays the RAID level of logical drive Y of controller X.
>> +
>> +.HP
>> +/sys/bus/pci/devices/<dev>/ccissX/cXdY/usage_count
>> +
>> +Displays the usage count (number of opens) of logical drive Y of co=
ntroller X.
>> +
>> +.SH SCSI tape drive and medium changer support
>> +
>> +SCSI sequential access devices and medium changer devices are suppo=
rted and
>> +appropriate device nodes are automatically created. =A0(e.g.
>> +/dev/st0, /dev/st1, etc. =A0See the "st" man page for more details.=
)
>> +You must enable "SCSI tape drive support for Smart Array 5xxx" and
>> +"SCSI support" in your kernel configuration to be able to use SCSI
>> +tape drives with your Smart Array 5xxx controller.
>> +
>> +Additionally, note that the driver will not engage the SCSI core at=
 init
>> +time. =A0The driver must be directed to dynamically engage the SCSI=
 core via
>> +the /proc filesystem entry which the "block" side of the driver cre=
ates as
>> +/proc/driver/cciss/cciss* at runtime. =A0This is because at driver =
init time,
>> +the SCSI core may not yet be initialized (because the driver is a b=
lock
>> +driver) and attempting to register it with the SCSI core in such a =
case
>> +would cause a hang. =A0This is best done via an initialization scri=
pt
>> +(typically in /etc/init.d, but could vary depending on distribution=
).
>> +For example:
>> +.nf
>> +
>> + =A0 =A0 =A0 =A0for x in /proc/driver/cciss/cciss[0-9]*
>> + =A0 =A0 =A0 =A0do
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "engage scsi" > $x
>> + =A0 =A0 =A0 =A0done
>> +
>> +.fi
>> +Once the SCSI core is engaged by the driver, it cannot be disengage=
d
>> +(except by unloading the driver, if it happens to be linked as a mo=
dule.)
>> +
>> +Note also that if no sequential access devices or medium changers a=
re
>> +detected, the SCSI core will not be engaged by the action of the ab=
ove
>> +script.
>> +
>> +.SS Hot plug support for SCSI tape drives
>> +
>> +Hot plugging of SCSI tape drives is supported, with some caveats.
>> +The cciss driver must be informed that changes to the SCSI bus
>> +have been made. =A0This may be done via the /proc filesystem.
>> +For example:
>> +
>> + =A0 =A0 =A0 =A0echo "rescan" > /proc/scsi/cciss0/1
>> +
>> +This causes the driver to query the adapter about changes to the
>> +physical SCSI buses and/or fibre channel arbitrated loop and the
>> +driver to make note of any new or removed sequential access devices
>> +or medium changers. =A0The driver will output messages indicating w=
hat
>> +devices have been added or removed and the controller, bus, target =
and
>> +lun used to address the device. =A0It then notifies the SCSI mid la=
yer
>> +of these changes.
>> +
>> +Note that the naming convention of the /proc filesystem entries
>> +contains a number in addition to the driver name. =A0(E.g. "cciss0"
>> +instead of just "cciss" which you might expect.)
>> +
>> +Note: ONLY sequential access devices and medium changers are presen=
ted
>> +as SCSI devices to the SCSI mid layer by the cciss driver. =A0Speci=
fically,
>> +physical SCSI disk drives are NOT presented to the SCSI mid layer. =
=A0The
>> +physical SCSI disk drives are controlled directly by the array cont=
roller
>> +hardware and it is important to prevent the kernel from attempting =
to directly
>> +access these devices too, as if the array controller were merely a =
SCSI
>> +controller in the same way that we are allowing it to access SCSI t=
ape drives.
>> +
>> +.SS SCSI error handling for tape drives and medium changers
>> +
>> +The linux SCSI mid layer provides an error handling protocol which
>> +kicks into gear whenever a SCSI command fails to complete within a
>> +certain amount of time (which can vary depending on the command).
>> +The cciss driver participates in this protocol to some extent. =A0T=
he
>> +normal protocol is a four step process. =A0First the device is told
>> +to abort the command. =A0If that doesn't work, the device is reset.
>> +If that doesn't work, the SCSI bus is reset. =A0If that doesn't wor=
k
>> +the host bus adapter is reset. =A0Because the cciss driver is a blo=
ck
>> +driver as well as a SCSI driver and only the tape drives and medium
>> +changers are presented to the SCSI mid layer, and unlike more
>> +straightforward SCSI drivers, disk i/o continues through the block
>> +side during the SCSI error recovery process, the cciss driver only
>> +implements the first two of these actions, aborting the command, an=
d
>> +resetting the device. =A0Additionally, most tape drives will not ob=
lige
>> +in aborting commands, and sometimes it appears they will not even
>> +obey a reset command, though in most circumstances they will. =A0In
>> +the case that the command cannot be aborted and the device cannot b=
e
>> +reset, the device will be set offline.
>> +
>> +In the event the error handling code is triggered and a tape drive =
is
>> +successfully reset or the tardy command is successfully aborted, th=
e
>> +tape drive may still not allow i/o to continue until some command
>> +is issued which positions the tape to a known position. =A0Typicall=
y you
>> +must rewind the tape (by issuing "mt -f /dev/st0 rewind" for exampl=
e)
>> +before i/o can proceed again to a tape drive which was reset.
>> +
>> +.SH "SEE ALSO"
>> +hpsa(4), hpacucli(8), hpacuxe(8), cciss_vol_status(8), http://cciss=
=2Esf.net,
>> +and from the linux kernel source, Documentation/blockdev/cciss.txt =
and
>> +Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
>> +.SH AUTHORS
>> +Don Brace, Steve Cameron, Chase Maupin, Mike Miller, Michael Ni, Ch=
arles White, Francis Wiran
>> +and probably some other people.
>> +
>> +
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-man"=
 in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
