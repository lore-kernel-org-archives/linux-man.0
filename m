From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pthread_sigqueue.3
Date: Sat, 17 Sep 2011 07:09:34 +0200
Message-ID: <CAKgNAkgDFA0ZWo1ORsLV2COxzbbboZ=a1bpqzGruXXeGMjCGKw@mail.gmail.com>
References: <1296803240.3716.15.camel@localhost>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1296803240.3716.15.camel@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: aqbanking-9jue/HkscOUb1SvskN2V4Q@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eric,

On Fri, Feb 4, 2011 at 8:07 AM, reste donewell <aqbanking-9jue/HkscOUb1SvskN2V4Q@public.gmane.org> wrote:
> Section Retun Value:
>
> current (3.32 (online version) )
>
> On success, pthread_create() returns 0; on error, it returns an error
> number.
>
> should be:
>
> On success, pthread_sigqueue() returns 0; on error, it returns an error
> number.

Thanks. This has by now been fixed for 3.33 as a consequence of a
separate report.

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
