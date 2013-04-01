From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 11:30:06 +0200
Message-ID: <CAKgNAkit-qRPErHDzGEJ_yedA+O97bFxDsqWJMZOhCZ9DPvOtw@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <CAKgNAki_8bOsuKTJLx3iMLeSvVXHo0bZf8zSUQ08RR7+D33xgQ@mail.gmail.com>
 <201304010319.45019.vapier@gentoo.org> <201304010437.52901.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304010437.52901.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 1, 2013 at 10:37 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Monday 01 April 2013 03:19:43 Mike Frysinger wrote:
>> for ARM OABI, there is no such padding, and the proposed example is wrong
>> and will not work.
>>
>> for ARM EABI, the ABI requires that 64bit values be passed in register
>> pairs. since the kernel people wanted to avoid an assembly trampoline to
>> unpack the 64bit value with EABI, you have to call it as proposed:
>>       syscall(readahead, fd, _pad, high32, low32)
>>
>> for MIPS, only the O32 ABI has this behavior.
>>
>> for PPC, only the 32bit ABI has this behavior.
>>
>> otherwise, i don't believe anyone else does this -- they just pass things
>> along in registers w/out padding.
>
> in random grepping of code bases (uClibc), i believe the xtensa arch also does
> 64bit register pair aligning.  a cursory scan of the kernel seems to back this
> up.

Also SuperH?

For my own education: which part of the kernel sources backed this up?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
