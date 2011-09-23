From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] madvise.2: ffix
Date: Fri, 23 Sep 2011 07:19:17 +0200
Message-ID: <CAKgNAkg3kGq5im34k9e6tZoYAD1kN4z1cngTfShivsPZmPttkw@mail.gmail.com>
References: <1316721541-3504-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316721541-3504-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

HI David,

On Thu, Sep 22, 2011 at 9:59 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
>
> Signed-off-by: David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Thanks. Applied for 3.34. And I did a global search to catch a couple
of similar instances.

Cheers,

Michael

> ---
> =A0man2/madvise.2 | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man2/madvise.2 b/man2/madvise.2
> index 59e6846..77e5aad 100644
> --- a/man2/madvise.2
> +++ b/man2/madvise.2
> @@ -201,7 +201,7 @@ The
> =A0and
> =A0.BR MADV_UNMERGEABLE
> =A0operations are only available if the kernel was configured with
> -.BR CONFIG_KSM.
> +.BR CONFIG_KSM .
> =A0.TP
> =A0.BR MADV_UNMERGEABLE " (since Linux 2.6.32)"
> =A0Undo the effect of an earlier
> @@ -239,7 +239,7 @@ The
> =A0and
> =A0.BR MADV_NOHUGEPAGE
> =A0operations are only available if the kernel was configured with
> -.BR CONFIG_TRANSPARENT_HUGEPAGE.
> +.BR CONFIG_TRANSPARENT_HUGEPAGE .
> =A0.TP
> =A0.BR MADV_NOHUGEPAGE " (since Linux 2.6.38)"
> =A0Ensures that memory in the address range specified by
> --
> 1.7.6.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
