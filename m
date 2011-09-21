From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add man page for the hpsa driver
Date: Wed, 21 Sep 2011 06:46:39 +0200
Message-ID: <CAKgNAkj-95+_F7uugWcEmngCz16_jiD9OG_=UAAqhzW=Emcfjw@mail.gmail.com>
References: <20110812142351.21226.69362.stgit@beardog.cce.hp.com> <CAKgNAkixAfS_CtQvBZz0c+fD9=adw8YtoJm=q7R4wWkXNGVwVw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=000e0cd6a8b232814a04ad6c442b
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkixAfS_CtQvBZz0c+fD9=adw8YtoJm=q7R4wWkXNGVwVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Stephen M. Cameron" <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mikem-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org, varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, stephenmcameron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

--000e0cd6a8b232814a04ad6c442b
Content-Type: text/plain; charset=ISO-8859-1

Hi Steve,

On Fri, Sep 9, 2011 at 4:38 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Stephen,
>
> On Fri, Aug 12, 2011 at 4:23 PM, Stephen M. Cameron
> <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org> wrote:
>> From: Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
>>
>> This patch applies against man-pages-3.32.
>>
>> I obtained the information in this man page as a consequence
>> of of being the main author of the hpsa driver.
>>
>> Signed-off-by: Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
>
> Thanks for the page. I've added it for the upcoming 3.33 release. But
> what license and copyright do you want to assign to the page? (See
> http://man7.org/linux/man-pages/licenses.html)

Hi Steve,

So, in the end, I didn't put this page out with the recent
man-pages-3.33 release, since I hadn't finished processing it.

Thank you also for this page. As with the ccis(4) page, the
fundamental content is great. I did some editing as follows:

1. I removed the AUTHORS section, since that's not used in man-pages.

2. I did some formatting fixes (to be consistent with man-pages
conventions) and some copyediting, rewording some long sentences, etc.
Hopefully, I did not change the meaning anywhere, but you should
carefully read the entire page to check.

Because of 2, could I ask you to please take a look at the revised
page, and send me back any fixes that are required (or an ACK if none
are required).

Cheers,

Michael


.\" Copyright (C) 2011, Hewlett-Packard Development Company, L.P.
.\" Written by Stephen M. Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
.\" Licensed under GNU General Public License version 2 (GPLv2)
.\"
.\" shorthand for double quote that works everywhere.
.ds q \N'34'
.TH HPSA 4  2011-09-21 "Linux" "Linux Programmer's Manual"
.SH NAME
hpsa \- HP Smart Array SCSI driver
.SH SYNOPSIS
.nf
modprobe hpsa [ hpsa_allow_any=1 ]
.fi
.SH DESCRIPTION
.B hpsa
is a SCSI driver for HP Smart Array RAID controllers.
.SS Options
.IR "hpsa_allow_any=1" :
This option allows the driver to attempt to operate on
any HP Smart Array hardware RAID controller,
even if it is not explicitly known to the driver.
This allows newer hardware to work with older drivers.
Typically this is used to allow installation of
operating systems from media which predates the
RAID controller, though it may also be used to enable
.B hpsa
to drive older controllers that would normally be handled by the
.BR cciss (4)
driver.
These older boards have not been tested and are
not supported with
.BR hpsa ,
and
.BR cciss (4)
should still be used for these.
.SS Supported Hardware
The
.B hpsa
driver supports the following Smart Array boards:
.nf

    Smart Array P700M
    Smart Array P212
    Smart Array P410
    Smart Array P410i
    Smart Array P411
    Smart Array P812
    Smart Array P712m
    Smart Array P711m
    StorageWorks P1210m

.fi
.SS Configuration Details
To configure HP Smart Array controllers, use the HP Array Configuration Utility
(either
.BR hpacuxe (8)
or
.BR hpacucli (8))
or the Offline ROM-based Configuration Utility (ORCA)
run from the Smart Array's option ROM at boot time.
.SH FILES
.SS Device Nodes
Logical drives are accessed via the SCSI disk driver
.RB ( sd (4)),
tape drives via the SCSI tape driver
.RB ( st (4)),
and
the RAID controller via the SCSI generic driver
.RB ( sg (4)),
with device nodes named
.IR /dev/sd*,
.IR /dev/st* ,
and
.IR /dev/sg* ,
respectively.
.SS HPSA-Specific Host Attribute Files in /sys
.TP
.I /sys/class/scsi_host/host*/rescan
This is a write-only attribute.
Writing to this
attribute will cause the driver to scan for new, changed, or removed devices
(e.g. hot-plugged tape drives, or newly configured or deleted logical drives,
etc.) and notify the SCSI midlayer of any changes detected.
Normally a rescan is triggered automatically
by HP's Array Configuration Utility (either the GUI or the
command-line variety);
thus, for logical drive changes, the user should not
normally have to use this attribute.
This attribute may be useful when hot plugging devices like tape drives,
or entire storage boxes containing pre-configured logical drives.
.TP
.I /sys/class/scsi_host/host*/firmware_revision
This attribute contains the firmware version of the Smart Array.

For example:

.nf
    # \fBcd /sys/class/scsi_host/host4\fP
    # \fBcat firmware_revision\fP
    7.14
.fi

.SS HPSA-Specific Disk Attribute Files in /sys
.TP
.I /sys/class/scsi_disk/c:b:t:l/device/unique_id
This attribute contains a 32 hex-digit unique ID for each logical drive
.nf

For example:

    # \fBcd /sys/class/scsi_disk/4:0:0:0/device\fP
    # \fBcat unique_id\fP
    600508B1001044395355323037570F77
.fi
.TP
.I /sys/class/scsi_disk/c:b:t:l/device/raid_level
This attribute contains the RAID level of each logical drive.
.nf

For example:

    # \fBcd /sys/class/scsi_disk/4:0:0:0/device\fP
    # \fBcat raid_level\fP
    RAID 0
.fi
.TP
.I /sys/class/scsi_disk/c:b:t:l/device/lunid
This attribute contains the 16 hex-digit (8 byte) LUN ID by which a
logical drive or
physical device can be addressed.
.IR c : b : t : l
are the controller, bus, target and lun of the device.
.nf

For example:

    # \fBcd /sys/class/scsi_disk/4:0:0:0/device\fP
    # \fBcat lunid\fP
    0x0000004000000000
.fi
.SS Supported ioctl() operations
For compatibility with applications written for the
.BR cciss (4)
driver, many, but
not all of the ioctls supported by the
.BR cciss (4)
driver are also supported by the
.B hpsa
driver.
The data structures used by these ioctls are described in
the kernel source file
.IR include/linux/cciss_ioctl.h .
.TP
.BR CCISS_DEREGDISK ", " CCISS_REGNEWDISK ", " CCISS_REGNEWD
These three ioctls all do exactly the same thing,
which is to cause the driver to rescan for new devices.
This does exactly the same thing as writing to the
hpsa-specific host "rescan" attribute.
.TP
.B CCISS_GETPCIINFO
Returns PCI domain, bus, device and function and "board ID" (PCI subsystem ID).
.TP
.B CCISS_GETDRIVVER
Returns driver version in three bytes encoded as:
.sp
    (major_version << 16) | (minor_version << 8) |
        (subminor_version)
.TP
.BR CCISS_PASSTHRU ", " CCISS_BIG_PASSTHRU
Allows "BMIC" and "CISS" commands to be passed through to the Smart Array.
These are used extensively by the HP Array Configuration Utility, SNMP storage
agents, etc.
See
.I cciss_vol_status
at
.I http://cciss.sf.net
for some examples.
.SH "SEE ALSO"
.BR cciss (4),
.BR sd (4),
.BR st (4),
.BR cciss_vol_status (8),
.BR hpacucli (8),
.BR hpacuxe (8),
.IR http://cciss.sf.net ,
and the Linux kernel source files
.I Documentation/scsi/hpsa.txt
and
.I Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
.\" .SH AUTHORS
.\" Don Brace, Steve Cameron, Tom Lawler, Mike Miller, Scott Teel
.\" and probably some other people.

--000e0cd6a8b232814a04ad6c442b
Content-Type: application/octet-stream; name="hpsa.4"
Content-Disposition: attachment; filename="hpsa.4"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gsttuqpp0

LlwiIENvcHlyaWdodCAoQykgMjAxMSwgSGV3bGV0dC1QYWNrYXJkIERldmVsb3BtZW50IENvbXBh
bnksIEwuUC4KLlwiIFdyaXR0ZW4gYnkgU3RlcGhlbiBNLiBDYW1lcm9uIDxzY2FtZXJvbkBiZWFy
ZG9nLmNjZS5ocC5jb20+Ci5cIiBMaWNlbnNlZCB1bmRlciBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSB2ZXJzaW9uIDIgKEdQTHYyKQouXCIgCi5cIiBzaG9ydGhhbmQgZm9yIGRvdWJsZSBxdW90
ZSB0aGF0IHdvcmtzIGV2ZXJ5d2hlcmUuCi5kcyBxIFxOJzM0JwouVEggSFBTQSA0ICAyMDExLTA5
LTIxICJMaW51eCIgIkxpbnV4IFByb2dyYW1tZXIncyBNYW51YWwiCi5TSCBOQU1FCmhwc2EgXC0g
SFAgU21hcnQgQXJyYXkgU0NTSSBkcml2ZXIKLlNIIFNZTk9QU0lTCi5uZgptb2Rwcm9iZSBocHNh
IFsgaHBzYV9hbGxvd19hbnk9MSBdCi5maQouU0ggREVTQ1JJUFRJT04KLkIgaHBzYQppcyBhIFND
U0kgZHJpdmVyIGZvciBIUCBTbWFydCBBcnJheSBSQUlEIGNvbnRyb2xsZXJzLgouU1MgT3B0aW9u
cwouSVIgImhwc2FfYWxsb3dfYW55PTEiIDoKVGhpcyBvcHRpb24gYWxsb3dzIHRoZSBkcml2ZXIg
dG8gYXR0ZW1wdCB0byBvcGVyYXRlIG9uCmFueSBIUCBTbWFydCBBcnJheSBoYXJkd2FyZSBSQUlE
IGNvbnRyb2xsZXIsCmV2ZW4gaWYgaXQgaXMgbm90IGV4cGxpY2l0bHkga25vd24gdG8gdGhlIGRy
aXZlci4KVGhpcyBhbGxvd3MgbmV3ZXIgaGFyZHdhcmUgdG8gd29yayB3aXRoIG9sZGVyIGRyaXZl
cnMuClR5cGljYWxseSB0aGlzIGlzIHVzZWQgdG8gYWxsb3cgaW5zdGFsbGF0aW9uIG9mCm9wZXJh
dGluZyBzeXN0ZW1zIGZyb20gbWVkaWEgd2hpY2ggcHJlZGF0ZXMgdGhlClJBSUQgY29udHJvbGxl
ciwgdGhvdWdoIGl0IG1heSBhbHNvIGJlIHVzZWQgdG8gZW5hYmxlCi5CIGhwc2EKdG8gZHJpdmUg
b2xkZXIgY29udHJvbGxlcnMgdGhhdCB3b3VsZCBub3JtYWxseSBiZSBoYW5kbGVkIGJ5IHRoZQou
QlIgY2Npc3MgKDQpCmRyaXZlci4KVGhlc2Ugb2xkZXIgYm9hcmRzIGhhdmUgbm90IGJlZW4gdGVz
dGVkIGFuZCBhcmUKbm90IHN1cHBvcnRlZCB3aXRoCi5CUiBocHNhICwKYW5kCi5CUiBjY2lzcyAo
NCkKc2hvdWxkIHN0aWxsIGJlIHVzZWQgZm9yIHRoZXNlLgouU1MgU3VwcG9ydGVkIEhhcmR3YXJl
ClRoZQouQiBocHNhCmRyaXZlciBzdXBwb3J0cyB0aGUgZm9sbG93aW5nIFNtYXJ0IEFycmF5IGJv
YXJkczoKLm5mCgogICAgU21hcnQgQXJyYXkgUDcwME0KICAgIFNtYXJ0IEFycmF5IFAyMTIKICAg
IFNtYXJ0IEFycmF5IFA0MTAKICAgIFNtYXJ0IEFycmF5IFA0MTBpCiAgICBTbWFydCBBcnJheSBQ
NDExCiAgICBTbWFydCBBcnJheSBQODEyCiAgICBTbWFydCBBcnJheSBQNzEybQogICAgU21hcnQg
QXJyYXkgUDcxMW0KICAgIFN0b3JhZ2VXb3JrcyBQMTIxMG0KCi5maQouU1MgQ29uZmlndXJhdGlv
biBEZXRhaWxzClRvIGNvbmZpZ3VyZSBIUCBTbWFydCBBcnJheSBjb250cm9sbGVycywgdXNlIHRo
ZSBIUCBBcnJheSBDb25maWd1cmF0aW9uIFV0aWxpdHkKKGVpdGhlcgouQlIgaHBhY3V4ZSAoOCkK
b3IKLkJSIGhwYWN1Y2xpICg4KSkKb3IgdGhlIE9mZmxpbmUgUk9NLWJhc2VkIENvbmZpZ3VyYXRp
b24gVXRpbGl0eSAoT1JDQSkKcnVuIGZyb20gdGhlIFNtYXJ0IEFycmF5J3Mgb3B0aW9uIFJPTSBh
dCBib290IHRpbWUuCi5TSCBGSUxFUwouU1MgRGV2aWNlIE5vZGVzCkxvZ2ljYWwgZHJpdmVzIGFy
ZSBhY2Nlc3NlZCB2aWEgdGhlIFNDU0kgZGlzayBkcml2ZXIKLlJCICggc2QgKDQpKSwKdGFwZSBk
cml2ZXMgdmlhIHRoZSBTQ1NJIHRhcGUgZHJpdmVyCi5SQiAoIHN0ICg0KSksCmFuZAp0aGUgUkFJ
RCBjb250cm9sbGVyIHZpYSB0aGUgU0NTSSBnZW5lcmljIGRyaXZlcgouUkIgKCBzZyAoNCkpLAp3
aXRoIGRldmljZSBub2RlcyBuYW1lZAouSVIgL2Rldi9zZCosCi5JUiAvZGV2L3N0KiAsCmFuZAou
SVIgL2Rldi9zZyogLApyZXNwZWN0aXZlbHkuCi5TUyBIUFNBLVNwZWNpZmljIEhvc3QgQXR0cmli
dXRlIEZpbGVzIGluIC9zeXMKLlRQCi5JIC9zeXMvY2xhc3Mvc2NzaV9ob3N0L2hvc3QqL3Jlc2Nh
bgpUaGlzIGlzIGEgd3JpdGUtb25seSBhdHRyaWJ1dGUuCldyaXRpbmcgdG8gdGhpcwphdHRyaWJ1
dGUgd2lsbCBjYXVzZSB0aGUgZHJpdmVyIHRvIHNjYW4gZm9yIG5ldywgY2hhbmdlZCwgb3IgcmVt
b3ZlZCBkZXZpY2VzCihlLmcuIGhvdC1wbHVnZ2VkIHRhcGUgZHJpdmVzLCBvciBuZXdseSBjb25m
aWd1cmVkIG9yIGRlbGV0ZWQgbG9naWNhbCBkcml2ZXMsCmV0Yy4pIGFuZCBub3RpZnkgdGhlIFND
U0kgbWlkbGF5ZXIgb2YgYW55IGNoYW5nZXMgZGV0ZWN0ZWQuCk5vcm1hbGx5IGEgcmVzY2FuIGlz
IHRyaWdnZXJlZCBhdXRvbWF0aWNhbGx5CmJ5IEhQJ3MgQXJyYXkgQ29uZmlndXJhdGlvbiBVdGls
aXR5IChlaXRoZXIgdGhlIEdVSSBvciB0aGUKY29tbWFuZC1saW5lIHZhcmlldHkpOwp0aHVzLCBm
b3IgbG9naWNhbCBkcml2ZSBjaGFuZ2VzLCB0aGUgdXNlciBzaG91bGQgbm90Cm5vcm1hbGx5IGhh
dmUgdG8gdXNlIHRoaXMgYXR0cmlidXRlLgpUaGlzIGF0dHJpYnV0ZSBtYXkgYmUgdXNlZnVsIHdo
ZW4gaG90IHBsdWdnaW5nIGRldmljZXMgbGlrZSB0YXBlIGRyaXZlcywKb3IgZW50aXJlIHN0b3Jh
Z2UgYm94ZXMgY29udGFpbmluZyBwcmUtY29uZmlndXJlZCBsb2dpY2FsIGRyaXZlcy4KLlRQCi5J
IC9zeXMvY2xhc3Mvc2NzaV9ob3N0L2hvc3QqL2Zpcm13YXJlX3JldmlzaW9uClRoaXMgYXR0cmli
dXRlIGNvbnRhaW5zIHRoZSBmaXJtd2FyZSB2ZXJzaW9uIG9mIHRoZSBTbWFydCBBcnJheS4KCkZv
ciBleGFtcGxlOgoKLm5mCiAgICAjIFxmQmNkIC9zeXMvY2xhc3Mvc2NzaV9ob3N0L2hvc3Q0XGZQ
CiAgICAjIFxmQmNhdCBmaXJtd2FyZV9yZXZpc2lvblxmUAogICAgNy4xNAouZmkKCi5TUyBIUFNB
LVNwZWNpZmljIERpc2sgQXR0cmlidXRlIEZpbGVzIGluIC9zeXMKLlRQCi5JIC9zeXMvY2xhc3Mv
c2NzaV9kaXNrL2M6Yjp0OmwvZGV2aWNlL3VuaXF1ZV9pZApUaGlzIGF0dHJpYnV0ZSBjb250YWlu
cyBhIDMyIGhleC1kaWdpdCB1bmlxdWUgSUQgZm9yIGVhY2ggbG9naWNhbCBkcml2ZQoubmYKCkZv
ciBleGFtcGxlOgoKICAgICMgXGZCY2QgL3N5cy9jbGFzcy9zY3NpX2Rpc2svNDowOjA6MC9kZXZp
Y2VcZlAKICAgICMgXGZCY2F0IHVuaXF1ZV9pZFxmUAogICAgNjAwNTA4QjEwMDEwNDQzOTUzNTUz
MjMwMzc1NzBGNzcKLmZpCi5UUAouSSAvc3lzL2NsYXNzL3Njc2lfZGlzay9jOmI6dDpsL2Rldmlj
ZS9yYWlkX2xldmVsClRoaXMgYXR0cmlidXRlIGNvbnRhaW5zIHRoZSBSQUlEIGxldmVsIG9mIGVh
Y2ggbG9naWNhbCBkcml2ZS4KLm5mCgpGb3IgZXhhbXBsZToKCiAgICAjIFxmQmNkIC9zeXMvY2xh
c3Mvc2NzaV9kaXNrLzQ6MDowOjAvZGV2aWNlXGZQCiAgICAjIFxmQmNhdCByYWlkX2xldmVsXGZQ
CiAgICBSQUlEIDAKLmZpCi5UUAouSSAvc3lzL2NsYXNzL3Njc2lfZGlzay9jOmI6dDpsL2Rldmlj
ZS9sdW5pZApUaGlzIGF0dHJpYnV0ZSBjb250YWlucyB0aGUgMTYgaGV4LWRpZ2l0ICg4IGJ5dGUp
IExVTiBJRCBieSB3aGljaCBhIGxvZ2ljYWwgZHJpdmUgb3IKcGh5c2ljYWwgZGV2aWNlIGNhbiBi
ZSBhZGRyZXNzZWQuCi5JUiBjIDogYiA6IHQgOiBsCmFyZSB0aGUgY29udHJvbGxlciwgYnVzLCB0
YXJnZXQgYW5kIGx1biBvZiB0aGUgZGV2aWNlLgoubmYKCkZvciBleGFtcGxlOgoKICAgICMgXGZC
Y2QgL3N5cy9jbGFzcy9zY3NpX2Rpc2svNDowOjA6MC9kZXZpY2VcZlAKICAgICMgXGZCY2F0IGx1
bmlkXGZQCiAgICAweDAwMDAwMDQwMDAwMDAwMDAKLmZpCi5TUyBTdXBwb3J0ZWQgaW9jdGwoKSBv
cGVyYXRpb25zCkZvciBjb21wYXRpYmlsaXR5IHdpdGggYXBwbGljYXRpb25zIHdyaXR0ZW4gZm9y
IHRoZQouQlIgY2Npc3MgKDQpCmRyaXZlciwgbWFueSwgYnV0Cm5vdCBhbGwgb2YgdGhlIGlvY3Rs
cyBzdXBwb3J0ZWQgYnkgdGhlCi5CUiBjY2lzcyAoNCkKZHJpdmVyIGFyZSBhbHNvIHN1cHBvcnRl
ZCBieSB0aGUKLkIgaHBzYQpkcml2ZXIuClRoZSBkYXRhIHN0cnVjdHVyZXMgdXNlZCBieSB0aGVz
ZSBpb2N0bHMgYXJlIGRlc2NyaWJlZCBpbgp0aGUga2VybmVsIHNvdXJjZSBmaWxlCi5JUiBpbmNs
dWRlL2xpbnV4L2NjaXNzX2lvY3RsLmggLgouVFAKLkJSIENDSVNTX0RFUkVHRElTSyAiLCAiIEND
SVNTX1JFR05FV0RJU0sgIiwgIiBDQ0lTU19SRUdORVdEClRoZXNlIHRocmVlIGlvY3RscyBhbGwg
ZG8gZXhhY3RseSB0aGUgc2FtZSB0aGluZywKd2hpY2ggaXMgdG8gY2F1c2UgdGhlIGRyaXZlciB0
byByZXNjYW4gZm9yIG5ldyBkZXZpY2VzLgpUaGlzIGRvZXMgZXhhY3RseSB0aGUgc2FtZSB0aGlu
ZyBhcyB3cml0aW5nIHRvIHRoZQpocHNhLXNwZWNpZmljIGhvc3QgInJlc2NhbiIgYXR0cmlidXRl
LgouVFAKLkIgQ0NJU1NfR0VUUENJSU5GTwpSZXR1cm5zIFBDSSBkb21haW4sIGJ1cywgZGV2aWNl
IGFuZCBmdW5jdGlvbiBhbmQgImJvYXJkIElEIiAoUENJIHN1YnN5c3RlbSBJRCkuCi5UUAouQiBD
Q0lTU19HRVREUklWVkVSClJldHVybnMgZHJpdmVyIHZlcnNpb24gaW4gdGhyZWUgYnl0ZXMgZW5j
b2RlZCBhczoKLnNwCiAgICAobWFqb3JfdmVyc2lvbiA8PCAxNikgfCAobWlub3JfdmVyc2lvbiA8
PCA4KSB8CiAgICAgICAgKHN1Ym1pbm9yX3ZlcnNpb24pCi5UUAouQlIgQ0NJU1NfUEFTU1RIUlUg
IiwgIiBDQ0lTU19CSUdfUEFTU1RIUlUKQWxsb3dzICJCTUlDIiBhbmQgIkNJU1MiIGNvbW1hbmRz
IHRvIGJlIHBhc3NlZCB0aHJvdWdoIHRvIHRoZSBTbWFydCBBcnJheS4KVGhlc2UgYXJlIHVzZWQg
ZXh0ZW5zaXZlbHkgYnkgdGhlIEhQIEFycmF5IENvbmZpZ3VyYXRpb24gVXRpbGl0eSwgU05NUCBz
dG9yYWdlCmFnZW50cywgZXRjLgpTZWUKLkkgY2Npc3Nfdm9sX3N0YXR1cwphdAouSSBodHRwOi8v
Y2Npc3Muc2YubmV0CmZvciBzb21lIGV4YW1wbGVzLgouU0ggIlNFRSBBTFNPIgouQlIgY2Npc3Mg
KDQpLAouQlIgc2QgKDQpLAouQlIgc3QgKDQpLAouQlIgY2Npc3Nfdm9sX3N0YXR1cyAoOCksCi5C
UiBocGFjdWNsaSAoOCksCi5CUiBocGFjdXhlICg4KSwKLklSIGh0dHA6Ly9jY2lzcy5zZi5uZXQg
LAphbmQgdGhlIExpbnV4IGtlcm5lbCBzb3VyY2UgZmlsZXMKLkkgRG9jdW1lbnRhdGlvbi9zY3Np
L2hwc2EudHh0CmFuZAouSSBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1wY2kt
ZGV2aWNlcy1jY2lzcwouXCIgLlNIIEFVVEhPUlMKLlwiIERvbiBCcmFjZSwgU3RldmUgQ2FtZXJv
biwgVG9tIExhd2xlciwgTWlrZSBNaWxsZXIsIFNjb3R0IFRlZWwKLlwiIGFuZCBwcm9iYWJseSBz
b21lIG90aGVyIHBlb3BsZS4K
--000e0cd6a8b232814a04ad6c442b--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
