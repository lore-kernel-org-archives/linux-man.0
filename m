From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] makedev(3): point people at sys/sysmacros.h
Date: Wed, 20 Apr 2016 14:38:43 +0200
Message-ID: <57177853.8020006@gmail.com>
References: <20160418164908.GR5369@vapier.lan>
 <1461045163-21248-1-git-send-email-vapier@gentoo.org>
 <5717687D.2060300@gmail.com>
 <CAKCAbMiMNtMmCP4EPZnZ5DpSNaNc=SDbbdKKZmoRybmWHyOoTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKCAbMiMNtMmCP4EPZnZ5DpSNaNc=SDbbdKKZmoRybmWHyOoTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/20/2016 01:47 PM, Zack Weinberg wrote:
> On Wed, Apr 20, 2016 at 7:31 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 04/19/2016 06:52 AM, Mike Frysinger wrote:
>>> Defining these functions via sys/types.h violates POSIX namespace
>>> requirements,
>>
>> What do the previous lines mean? Violate namespace requirements how?
> 
> I think it's technically not true that they violate POSIX namespace
> requirements, since they're only defined in the non-conforming modes.
> 
> The reason I originally proposed the change is that libstdc++
> force-enables _GNU_SOURCE, which means people writing in C++ _can't_
> avoid these nonstandard macros by using a strict conformance mode.

Thanks for the explanation, Zack. I applied Mike's patch.

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
