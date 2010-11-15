From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] Typo in getrlimit.2
Date: Mon, 15 Nov 2010 07:52:20 +0100
Message-ID: <AANLkTik8cBDS=-n5vw-hAR2d_heuw1jSOA+WruSbt0+S@mail.gmail.com>
References: <AANLkTi=tkCZbdnfsFG3kiOedgMD3akj6ji5NiiasYygS@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=tkCZbdnfsFG3kiOedgMD3akj6ji5NiiasYygS-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Denis,

On Mon, Nov 15, 2010 at 7:49 AM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hello Michael,
>
> Here is a trivial patch.

Thanks. Applied for 3.32.

Cheers,

Michael


> diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
> index 805d232..1a71cb9 100644
> --- a/man2/getrlimit.2
> +++ b/man2/getrlimit.2
> @@ -466,7 +466,7 @@ for the process specified by
> =A0Could not find a process with the ID specified in
> =A0.IR pid .
> =A0.SH VERSIONS
> -.BR The
> +The
> =A0.BR prlimit ()
> =A0system call is available since Linux 2.6.36.
> =A0Library support is available since glibc 2.13.
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
