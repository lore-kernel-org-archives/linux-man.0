From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] Trivial patch in man3/pthread_sigqueue.3
Date: Fri, 3 Dec 2010 06:50:57 +0100
Message-ID: <AANLkTi=5D+VJVYc-Oqhq1YuduVZLVEYHeKbKi6nZYwHq@mail.gmail.com>
References: <AANLkTi=bXMmNmHceP=VXrQAeuFH2pwnK0mL8gE0-QsNm@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=bXMmNmHceP=VXrQAeuFH2pwnK0mL8gE0-QsNm-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Nov 27, 2010 at 11:01 AM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Hello, here it is
>
> Denis

Thanks Denis. Applied for 3.32.

Cheers,

Michael


> diff --git a/man3/pthread_sigqueue.3 b/man3/pthread_sigqueue.3
> index ebf995d..c4faa40 100644
> --- a/man3/pthread_sigqueue.3
> +++ b/man3/pthread_sigqueue.3
> @@ -99,4 +99,4 @@ This function is a GNU extension.
> =A0.BR sigwait (2),
> =A0.BR pthread_sigmask (3),
> =A0.BR pthreads (7),
> -.br SIGNAL (7)
> +.BR signal (7)
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
