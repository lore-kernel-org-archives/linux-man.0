From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ioctl_list.2: complete overhaul needed
Date: Tue, 11 Nov 2014 08:14:48 +0100
Message-ID: <5461B768.7040603@gmail.com>
References: <545F8D2E.5030308@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545F8D2E.5030308-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Heinrich,

On 11/09/2014 04:50 PM, Heinrich Schuchardt wrote:
> 
> Hello Michael,
> 
> the current ioctl_list.2 man-page descripton starts
> "This  is  Ioctl List 1.3.27, a list of ioctl calls in Linux/i386 kernel 
> 1.3.27."
> So the man-page represents the state of Sep 14th, 1995.
> It enumerates only 421 out of over 1200 calls.

Yep. There's no doubt that the man page is in a sorry state.
(But, I think a few of those other ioctls are documented in some 
section 4 and section 7 pages.)

> The list contains hex values of different constants. I just wonder for 
> which architecture (alpha, i386, mips, or sparc at that time). No 
> information is supplied.
> 
> Current values depend on the architecture, e.g.
> 
> On amd64
> 0x82307201      VFAT_IOCTL_READDIR_BOTH
> 0x82307202      VFAT_IOCTL_READDIR_SHORT
> 0x80047210      FAT_IOCTL_GET_ATTRIBUTES
> 0x40047211      FAT_IOCTL_SET_ATTRIBUTES
> 0x80047213      FAT_IOCTL_GET_VOLUME_ID
> 
> On mips
> 0x42187201      VFAT_IOCTL_READDIR_BOTH
> 0x42187202      VFAT_IOCTL_READDIR_SHORT
> 0x40047210      FAT_IOCTL_GET_ATTRIBUTES
> 0x80047211      FAT_IOCTL_SET_ATTRIBUTES
> 0x40047213      FAT_IOCTL_GET_VOLUME_ID
>
> Hence hex values should be removed.

It sounds like you are right that the hex values should be 
removed. But, how did you determine those different
hex values above? Grepping the sources, it's not
obvious that amd64 and mips should be different.
 
> I further suggest to remove all documentation of structure details.

Could you elaborate this point a little. Some examples, and
why you think they should be removed. I'm not disagreeing, just
looking to clarify what you mean.

> The following command can be used to create the raw data for a new list
> 
> grep -GHrn -B3 -A3 --regexp="\s_IO[R|W|RW]\?[_BAD]\?\s*(" \
> include/uapi | \
> sed ':a;N;$!ba;s/\\\s*\n[^-]*-[^-]*-/ /g' | \
> sort | \
> grep --regexp="\s_IO[R|W|RW]\?[BAD]\?\s*(" | grep -n ''

Thanks -- that's very helpful!

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
