From: scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org
Subject: Re: [PATCH] Add man page for the hpsa driver
Date: Wed, 21 Sep 2011 09:45:32 -0500
Message-ID: <20110921144532.GG20956@beardog.cce.hp.com>
References: <20110812142351.21226.69362.stgit@beardog.cce.hp.com> <CAKgNAkixAfS_CtQvBZz0c+fD9=adw8YtoJm=q7R4wWkXNGVwVw@mail.gmail.com> <CAKgNAkj-95+_F7uugWcEmngCz16_jiD9OG_=UAAqhzW=Emcfjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkj-95+_F7uugWcEmngCz16_jiD9OG_=UAAqhzW=Emcfjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mikem-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org, varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Sep 21, 2011 at 06:46:39AM +0200, Michael Kerrisk wrote:
> Hi Steve,
> 
> On Fri, Sep 9, 2011 at 4:38 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hello Stephen,
> >
> > On Fri, Aug 12, 2011 at 4:23 PM, Stephen M. Cameron
> > <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org> wrote:
> >> From: Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
> >>
> >> This patch applies against man-pages-3.32.
> >>
> >> I obtained the information in this man page as a consequence
> >> of of being the main author of the hpsa driver.
> >>
> >> Signed-off-by: Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
> >
> > Thanks for the page. I've added it for the upcoming 3.33 release. But
> > what license and copyright do you want to assign to the page? (See
> > http://man7.org/linux/man-pages/licenses.html)
> 
> Hi Steve,
> 
> So, in the end, I didn't put this page out with the recent
> man-pages-3.33 release, since I hadn't finished processing it.
> 
> Thank you also for this page. As with the ccis(4) page, the
> fundamental content is great. I did some editing as follows:
> 
> 1. I removed the AUTHORS section, since that's not used in man-pages.
> 
> 2. I did some formatting fixes (to be consistent with man-pages
> conventions) and some copyediting, rewording some long sentences, etc.
> Hopefully, I did not change the meaning anywhere, but you should
> carefully read the entire page to check.
> 
> Because of 2, could I ask you to please take a look at the revised
> page, and send me back any fixes that are required (or an ACK if none
> are required).


Looks good to me.

Ack.

-- steve

> 
> Cheers,
> 
> Michael
> 
> 
> .\" Copyright (C) 2011, Hewlett-Packard Development Company, L.P.
> .\" Written by Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
> .\" Licensed under GNU General Public License version 2 (GPLv2)
> .\"
> .\" shorthand for double quote that works everywhere.
> .ds q \N'34'
> .TH HPSA 4  2011-09-21 "Linux" "Linux Programmer's Manual"
> .SH NAME
> hpsa \- HP Smart Array SCSI driver
> .SH SYNOPSIS
> .nf
> modprobe hpsa [ hpsa_allow_any=1 ]
> .fi
> .SH DESCRIPTION
> .B hpsa
> is a SCSI driver for HP Smart Array RAID controllers.
> .SS Options
> .IR "hpsa_allow_any=1" :
> This option allows the driver to attempt to operate on
> any HP Smart Array hardware RAID controller,
> even if it is not explicitly known to the driver.
> This allows newer hardware to work with older drivers.
> Typically this is used to allow installation of
> operating systems from media which predates the
> RAID controller, though it may also be used to enable
> .B hpsa
> to drive older controllers that would normally be handled by the
> .BR cciss (4)
> driver.
> These older boards have not been tested and are
> not supported with
> .BR hpsa ,
> and
> .BR cciss (4)
> should still be used for these.
> .SS Supported Hardware
> The
> .B hpsa
> driver supports the following Smart Array boards:
> .nf
> 
>     Smart Array P700M
>     Smart Array P212
>     Smart Array P410
>     Smart Array P410i
>     Smart Array P411
>     Smart Array P812
>     Smart Array P712m
>     Smart Array P711m
>     StorageWorks P1210m
> 
> .fi
> .SS Configuration Details
> To configure HP Smart Array controllers, use the HP Array Configuration Utility
> (either
> .BR hpacuxe (8)
> or
> .BR hpacucli (8))
> or the Offline ROM-based Configuration Utility (ORCA)
> run from the Smart Array's option ROM at boot time.
> .SH FILES
> .SS Device Nodes
> Logical drives are accessed via the SCSI disk driver
> .RB ( sd (4)),
> tape drives via the SCSI tape driver
> .RB ( st (4)),
> and
> the RAID controller via the SCSI generic driver
> .RB ( sg (4)),
> with device nodes named
> .IR /dev/sd*,
> .IR /dev/st* ,
> and
> .IR /dev/sg* ,
> respectively.
> .SS HPSA-Specific Host Attribute Files in /sys
> .TP
> .I /sys/class/scsi_host/host*/rescan
> This is a write-only attribute.
> Writing to this
> attribute will cause the driver to scan for new, changed, or removed devices
> (e.g. hot-plugged tape drives, or newly configured or deleted logical drives,
> etc.) and notify the SCSI midlayer of any changes detected.
> Normally a rescan is triggered automatically
> by HP's Array Configuration Utility (either the GUI or the
> command-line variety);
> thus, for logical drive changes, the user should not
> normally have to use this attribute.
> This attribute may be useful when hot plugging devices like tape drives,
> or entire storage boxes containing pre-configured logical drives.
> .TP
> .I /sys/class/scsi_host/host*/firmware_revision
> This attribute contains the firmware version of the Smart Array.
> 
> For example:
> 
> .nf
>     # \fBcd /sys/class/scsi_host/host4\fP
>     # \fBcat firmware_revision\fP
>     7.14
> .fi
> 
> .SS HPSA-Specific Disk Attribute Files in /sys
> .TP
> .I /sys/class/scsi_disk/c:b:t:l/device/unique_id
> This attribute contains a 32 hex-digit unique ID for each logical drive
> .nf
> 
> For example:
> 
>     # \fBcd /sys/class/scsi_disk/4:0:0:0/device\fP
>     # \fBcat unique_id\fP
>     600508B1001044395355323037570F77
> .fi
> .TP
> .I /sys/class/scsi_disk/c:b:t:l/device/raid_level
> This attribute contains the RAID level of each logical drive.
> .nf
> 
> For example:
> 
>     # \fBcd /sys/class/scsi_disk/4:0:0:0/device\fP
>     # \fBcat raid_level\fP
>     RAID 0
> .fi
> .TP
> .I /sys/class/scsi_disk/c:b:t:l/device/lunid
> This attribute contains the 16 hex-digit (8 byte) LUN ID by which a
> logical drive or
> physical device can be addressed.
> .IR c : b : t : l
> are the controller, bus, target and lun of the device.
> .nf
> 
> For example:
> 
>     # \fBcd /sys/class/scsi_disk/4:0:0:0/device\fP
>     # \fBcat lunid\fP
>     0x0000004000000000
> .fi
> .SS Supported ioctl() operations
> For compatibility with applications written for the
> .BR cciss (4)
> driver, many, but
> not all of the ioctls supported by the
> .BR cciss (4)
> driver are also supported by the
> .B hpsa
> driver.
> The data structures used by these ioctls are described in
> the kernel source file
> .IR include/linux/cciss_ioctl.h .
> .TP
> .BR CCISS_DEREGDISK ", " CCISS_REGNEWDISK ", " CCISS_REGNEWD
> These three ioctls all do exactly the same thing,
> which is to cause the driver to rescan for new devices.
> This does exactly the same thing as writing to the
> hpsa-specific host "rescan" attribute.
> .TP
> .B CCISS_GETPCIINFO
> Returns PCI domain, bus, device and function and "board ID" (PCI subsystem ID).
> .TP
> .B CCISS_GETDRIVVER
> Returns driver version in three bytes encoded as:
> .sp
>     (major_version << 16) | (minor_version << 8) |
>         (subminor_version)
> .TP
> .BR CCISS_PASSTHRU ", " CCISS_BIG_PASSTHRU
> Allows "BMIC" and "CISS" commands to be passed through to the Smart Array.
> These are used extensively by the HP Array Configuration Utility, SNMP storage
> agents, etc.
> See
> .I cciss_vol_status
> at
> .I http://cciss.sf.net
> for some examples.
> .SH "SEE ALSO"
> .BR cciss (4),
> .BR sd (4),
> .BR st (4),
> .BR cciss_vol_status (8),
> .BR hpacucli (8),
> .BR hpacuxe (8),
> .IR http://cciss.sf.net ,
> and the Linux kernel source files
> .I Documentation/scsi/hpsa.txt
> and
> .I Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
> .\" .SH AUTHORS
> .\" Don Brace, Steve Cameron, Tom Lawler, Mike Miller, Scott Teel
> .\" and probably some other people.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
