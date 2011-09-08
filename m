From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mprotect.2: fix off-by-one error in a memory range
Date: Thu, 8 Sep 2011 16:30:56 +0200
Message-ID: <CAKgNAkjLihWHySgo9Z1wYE4+tMdpKo8R5HWgU=qR7_ROgzzLhg@mail.gmail.com>
References: <4E5E4DCD.5080607@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4DCD.5080607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: Just a simple typo, maybe.
> See the address range in DESCRIPTION section.
>
>
> diff --git a/man2/mprotect.2 b/man2/mprotect.2
> --- a/man2/mprotect.2
> +++ b/man2/mprotect.2
> @@ -98,7 +98,7 @@ Internal kernel structures could not be allocated.
> .B ENOMEM
> Addresses in the range
> .RI [ addr ,
> -.IR addr + len ]
> +.IR addr + len \- 1 ]
> are invalid for the address space of the process,
> or specify one or more pages that are not mapped.
> (Before kernel 2.4.19, the error

Thanks Seonghun. Applied for man-pages-3.33.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
