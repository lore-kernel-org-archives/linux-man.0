From: Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 3 Feb 2015 02:48:34 -0700
Message-ID: <775BBA28-BEDF-4F53-A845-D11F4337026B@dilger.ca>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com> <1422042884-10824-1-git-send-email-xypron.glpk@gmx.de> <5984550D-1518-490C-9A3F-3F9B1FA2EA00@dilger.ca> <CAKgNAki1EnYx+chg1eouwF54youb_tjQ+hW9Ea_M_=cvccu1nA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki1EnYx+chg1eouwF54youb_tjQ+hW9Ea_M_=cvccu1nA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Ogawa Hirofumi <hirofumi-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>, Linux Filesystem Development List <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Feb 3, 2015, at 2:21 AM, Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 3 February 2015 at 09:49, Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org> wrote:
>> On Jan 23, 2015, at 12:54 PM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
>>> +The bits of the bit mask are
>>> +.TP
>>> +.B ATTR_RO
>>> +This bit specifies that the file or directory is read-only.
>> 
>> It's too bad that these constants have such generic names. It would
>> be better to use MSDOS_ATTR_* or FAT_ATTR_*, since these are also
>> exposed to userspace, but are only used by FAT.
> 
> Agreed. Too late now, I guess, though.

It wouldn't be unreasonable to #define FAT_ATTR_* versions of these
constants for use with new kernels, and eventually deprecate the
ATTR_* usage as older kernels become obsoleted.  Once the FAT_ATTR_*
versions had been around for a year or three (enough for a major vendor
release cycle to get them into some large fraction of users hands) they
could start being documented in the man pages and the old versions
documented only for backward compatibility (as with old APIs like
strcpy(3) or mktemp(3)).

Given that FAT ioctls are not widely used by applications, the
actual ABI (numeric constants) isn't changing, and the workaround
is simple, I'd expect that the time before deprecating the old
constants could be fairly short.

Cheers, Andreas





--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
