From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man gettimeofday: first arg cannot be NULL
Date: Wed, 18 Apr 2012 06:41:34 +1200
Message-ID: <CAKgNAkhrFDJhVFEi8_vaTBM+Zp=GYvafp6Aa7gd14+H17t4Dvw@mail.gmail.com>
References: <20100310165810.GC2165@comppasch2>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100310165810.GC2165@comppasch2>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org" <fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Mar 11, 2010 at 5:58 AM, fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
<fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi,
>
> in man 2 gettimeofday (2009-03-25), section DESCRIPTION, it
> is said:
>
> "If either tv or tz is NULL, ..."
>
> However, if the first arg is NULL, the compiler (gcc 4.3.4)
> issues a warning that it shouldn't be NULL.

True. For man-pages-3.39, I added this text to the man page:

==
(However, compilation warnings will result if
.I tv
is NULL.)
==

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
