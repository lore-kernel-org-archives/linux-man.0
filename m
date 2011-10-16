From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wcrtomb.3: ffix
Date: Sun, 16 Oct 2011 07:20:49 +0200
Message-ID: <CAKgNAkigVADS=zhhCi2yjs0ZG-4h5FaRQYbWVqAnA3M2un-2aA@mail.gmail.com>
References: <1318641891-6313-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318641891-6313-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Oct 15, 2011 at 3:24 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
>
> Signed-off-by: David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Thanks David. Applied for 3.36.

Cheers,

Michael


> ---
> =A0man3/wcrtomb.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/wcrtomb.3 b/man3/wcrtomb.3
> index 4a80705..0727fbc 100644
> --- a/man3/wcrtomb.3
> +++ b/man3/wcrtomb.3
> @@ -36,7 +36,7 @@ that is, the number of bytes
> =A0written at \fIs\fP.
> =A0.PP
> =A0A different case is when \fIs\fP is not NULL,
> - but \fIwc\fP is a null wide character (L\(aq\\0\(aq).
> +but \fIwc\fP is a null wide character (L\(aq\\0\(aq).
> =A0In this
> =A0case the
> =A0.BR wcrtomb ()
> --
> 1.7.7
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
