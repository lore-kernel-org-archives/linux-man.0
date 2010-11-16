From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] Another typo in getrlimit.2
Date: Tue, 16 Nov 2010 06:21:46 +0100
Message-ID: <AANLkTik-szHoeSucP6WdPy30QCHAYUovfZL+G9UqN-C8@mail.gmail.com>
References: <AANLkTi==MHZoOnGupH5RxXXCG5oFzL04p9y3P=JY2MLq@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi==MHZoOnGupH5RxXXCG5oFzL04p9y3P=JY2MLq-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Denis,

On Mon, Nov 15, 2010 at 10:56 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Hello Michael,
>
> Here it is.

Thanks. Applied for 3.32.

Cheers,

Michael



> diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
> index 805d232..1d2d47a 100644
> --- a/man2/getrlimit.2
> +++ b/man2/getrlimit.2
> @@ -454,7 +454,7 @@ was greater than
> =A0An unprivileged process tried to raise the hard limit; the
> =A0.B CAP_SYS_RESOURCE
> =A0capability is required to do this.
> -Or, the the caller tried to increase the hard
> +Or, the caller tried to increase the hard
> =A0.B RLIMIT_NOFILE
> =A0limit above the current kernel maximum
> =A0.RB ( NR_OPEN ).
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
