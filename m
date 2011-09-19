From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mlock.2: tfix
Date: Mon, 19 Sep 2011 07:09:14 +0200
Message-ID: <CAKgNAkjsLksMv98A+iHt2u2bUsqtq4w+CazOGF13nq_r2=CRpQ@mail.gmail.com>
References: <1316385558-17461-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316385558-17461-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Sep 19, 2011 at 12:39 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
>
> Signed-off-by: David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Thanks. Applied for 3.34.

Cheers,

Michael

> ---
> =A0man2/mlock.2 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man2/mlock.2 b/man2/mlock.2
> index a76690c..5db1b22 100644
> --- a/man2/mlock.2
> +++ b/man2/mlock.2
> @@ -161,7 +161,7 @@ The result of the addition
> =A0.IR start + len
> =A0was less than
> =A0.IR start
> -(e.g., the addition may have resuled in an overflow).
> +(e.g., the addition may have resulted in an overflow).
> =A0.TP
> =A0.B EINVAL
> =A0(Not on Linux)
> --
> 1.7.6.3
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
