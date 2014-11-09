From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Simple Bug in unix(7) man page
Date: Sun, 9 Nov 2014 21:17:58 +0100
Message-ID: <CAKgNAkhHw8wdzH42HkbWrTrC9CcO7g+=5S4TqO-SyGueU6V33Q@mail.gmail.com>
References: <CAPhGvuJvh-ssCnRWmqiJk7qq_v=LadrfSe9pcDXG=nWPH413qA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPhGvuJvh-ssCnRWmqiJk7qq_v=LadrfSe9pcDXG=nWPH413qA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Harvey <scott.harvey-nSGZJWG/ZnXz/TQy74m3OQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Scott,

On Sat, Nov 8, 2014 at 10:43 PM, Scott Harvey
<scott.harvey-nSGZJWG/ZnXz/TQy74m3OQ@public.gmane.org> wrote:
> Hello,
>
> Under the BUGS section this code snippet appears:
>
> if (getsockname(sfd, (struct sockaddr *) addrp, &addrlen)) != -1)
>               /* handle error */ ;
>
>
> This should be changed to == -1, or < 0, since getsockname(2) returns -1 on
> error.
>
> Looks like just a simple typo.

Yup. Thanks for reporting that. I applied a fix.

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
