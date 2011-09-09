From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add man page for the hpsa driver
Date: Fri, 9 Sep 2011 16:38:23 +0200
Message-ID: <CAKgNAkixAfS_CtQvBZz0c+fD9=adw8YtoJm=q7R4wWkXNGVwVw@mail.gmail.com>
References: <20110812142351.21226.69362.stgit@beardog.cce.hp.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110812142351.21226.69362.stgit-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Stephen M. Cameron" <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mikem-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org, varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Stephen,

On Fri, Aug 12, 2011 at 4:23 PM, Stephen M. Cameron
<scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org> wrote:
> From: Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
>
> This patch applies against man-pages-3.32.
>
> I obtained the information in this man page as a consequence
> of of being the main author of the hpsa driver.
>
> Signed-off-by: Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>

Thanks for the page. I've added it for the upcoming 3.33 release. But
what license and copyright do you want to assign to the page? (See
http://man7.org/linux/man-pages/licenses.html)

Cheers,

Michael


> ---
> =A0man4/hpsa.4 | =A0144 +++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 144 insertions(+), 0 deletions(-)
> =A0create mode 100644 man4/hpsa.4
>
> diff --git a/man4/hpsa.4 b/man4/hpsa.4
> new file mode 100644
> index 0000000..bade987
> --- /dev/null
> +++ b/man4/hpsa.4
> @@ -0,0 +1,144 @@
> +.\" shorthand for double quote that works everywhere.
> +.ds q \N'34'
> +.TH HPSA 4 "hpsa"
> +.SH NAME
> +hpsa \- HP Smart Array SCSI driver
> +.SH SYNOPSIS
> +.nf
> +modprobe hpsa [ hpsa_allow_any=3D1 ]
> +.fi
> +.SH DESCRIPTION
> +.B hpsa
> +is a SCSI driver for HP Smart Array RAID controllers.
> +.SH OPTIONS
> +.HP
> +hpsa_allow_any=3D1
> +This option allows the driver to attempt to operate on
> +any HP Smart Array hardware RAID controller even if it is
> +not explicitly known to the driver. =A0This allows newer hardware
> +to work with older drivers. =A0Typically this is used for example
> +to allow installation of OSes from media which predates the
> +RAID controller though it may also be used to enable hpsa to
> +drive older controllers that would normally be handled by the
> +cciss driver. =A0These older boards have not been tested and are
> +not supported with hpsa and cciss should still be used for these.
> +
> +.SH SUPPORTED HARDWARE
> +The
> +.B hpsa
> +driver supports the following Smart Array boards:
> +.nf
> +
> +Smart Array P700M
> +Smart Array P212
> +Smart Array P410
> +Smart Array P410i
> +Smart Array P411
> +Smart Array P812
> +Smart Array P712m
> +Smart Array P711m
> +StorageWorks P1210m
> +
> +.fi
> +.SH CONFIGURATION DETAILS
> +To configure HP Smart Array controllers, use the HP Array Configurat=
ion Utility
> +(either hpacuxe or hpacucli) or the Offline ROM-based Configuration =
Utility (ORCA)
> +run from the Smart Array's option ROM at boot time.
> +.SH FILES
> +.SS DEVICE NODES
> +Logical drives are accessed via the SCSI disk driver (sd),
> +tape drives via the SCSI tape driver (st), and
> +the RAID controller vi the SCSI generic driver (sg), with
> +device nodes named /dev/sd*, /dev/st*, and /dev/sg*, respectively.
> +.SS HPSA SPECIFIC HOST ATTRIBUTE FILES IN /sys
> +
> +.HP
> +/sys/class/scsi_host/host*/rescan
> +the host "rescan" attribute is a write only attribute. =A0Writing to=
 this
> +attribute will cause the driver to scan for new, changed, or removed=
 devices
> +(e.g. hot-plugged tape drives, or newly configured or deleted logica=
l drives,
> +etc.) and notify the SCSI midlayer of any changes detected. =A0Norma=
lly this is
> +triggered automatically by HP's Array Configuration Utility (either =
the GUI or
> +command line variety) so for logical drive changes, the user should =
not
> +normally have to use this. =A0It may be useful when hot plugging dev=
ices like
> +tape drives, or entire storage boxes containing pre-configured logic=
al drives.
> +
> +.HP
> +/sys/class/scsi_host/host*/firmware_revision
> +The "firmware_revision" attribute contains the firmware version of t=
he Smart Array.
> +For example:
> +.nf
> + =A0 =A0 =A0 root@host:/sys/class/scsi_host/host4# cat firmware_revi=
sion
> + =A0 =A0 =A0 7.14
> +.fi
> +
> +.SS HPSA SPECIFIC DISK ATTRIBUTE FILES IN /sys
> +
> +.HP
> +/sys/class/scsi_disk/c:b:t:l/device/unique_id
> +contains a 32 hex-digit unique ID for each logical drive
> +.nf
> +For example:
> +
> + =A0 =A0 =A0 =A0root@host:/sys/class/scsi_disk/4:0:0:0/device# cat u=
nique_id
> + =A0 =A0 =A0 =A0600508B1001044395355323037570F77
> +.fi
> +.HP
> +/sys/class/scsi_disk/c:b:t:l/device/raid_level
> +contains the RAID level of each logical drive.
> +.nf
> +For example:
> + =A0 =A0 =A0 =A0root@host:/sys/class/scsi_disk/4:0:0:0/device# cat r=
aid_level
> + =A0 =A0 =A0 =A0RAID 0
> +.fi
> +.HP
> +/sys/class/scsi_disk/c:b:t:l/device/lunid
> +(where c:b:t:l are the controller, bus, target and lun of the device=
)
> +contains 16 hex-digit (8 byte) LUN ID by which a logical drive or
> +physical device can be addressed.
> +.nf
> +For example:
> + =A0 =A0 =A0 =A0root@host:/sys/class/scsi_disk/4:0:0:0/device# cat l=
unid
> + =A0 =A0 =A0 =A00x0000004000000000
> +.fi
> +.SH SUPPORTED IOCTLS
> +For compatibility with applications written for the cciss driver, ma=
ny, but
> +not all of the ioctls supported by the cciss driver are also support=
ed by the
> +hpsa driver. =A0The data structures used by these are described in
> +include/linux/cciss_ioctl.h
> +.HP
> +CCISS_DEREGDISK
> +CCISS_REGNEWDISK
> +CCISS_REGNEWD
> +
> +The above three ioctls all do exactly the same thing, which is to ca=
use the driver
> +to rescan for new devices. =A0This does exactly the same thing as wr=
iting to the
> +hpsa specific host "rescan" attribute.
> +
> +.HP
> +CCISS_GETPCIINFO
> +Returns PCI domain, bus, device and function and "board ID" (PCI sub=
system ID).
> +
> +.HP
> +CCISS_GETDRIVVER
> +Returns driver version in three bytes encoded as:
> +(major_version << 16) | (minor_version << 8) | (subminor_version)
> +
> +.HP
> +CCISS_PASSTHRU
> +CCISS_BIG_PASSTHRU
> +Allows "BMIC" and "CISS" commands to be passed through to the Smart =
Array.
> +These are used extensively by the HP Array Configuration Utility, SN=
MP storage
> +agents, etc. =A0See cciss_vol_status at http://cciss.sf.net for some=
 examples.
> +
> +
> +.SH "SEE ALSO"
> +cciss(4), hpacucli(8), sd(4), st(4),
> +hpacuxe(8), cciss_vol_status(8), http://cciss.sf.net,
> +and from the linux kernel source, Documentation/scsi/hpsa.txt and
> +Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
> +.SH AUTHORS
> +Don Brace, Steve Cameron, Tom Lawler, Mike Miller, Scott Teel
> +and probably some other people.
> +
> +
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
