From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Spelling error in getutent(3)
Date: Sat, 7 Jul 2012 06:15:39 +0200
Message-ID: <CAKgNAkj7Nen4XcH6Fe9DQkOYc1DDN99E6CSALBfKejOny3zD6A@mail.gmail.com>
References: <CAEJt7hYcqy=c1g_H3Neg6+xuvFSo4_XDJfK2me7bWAtVJN6S8A@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEJt7hYcqy=c1g_H3Neg6+xuvFSo4_XDJfK2me7bWAtVJN6S8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Henry Hu <henry.hu.sh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Jul 5, 2012 at 9:10 PM, Henry Hu <henry.hu.sh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> I've just spotted an error in man page getutent(3).
>
> In the last paragraph of the section "CONFORMING TO", it says
>
> Linux glibc on the other hand does not use a parallel utmpx file since its
> utmp structure is already large enough.  The "x" functions listed above are
> just aliases for their counterparts without the "x" (e.g., getutxent() is
> an alias for gettutent()).
>
> It seems like that the last "gettutent" should be "getutent".

Yes. Fixed for 3.42.

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
