From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: ffix
Date: Tue, 20 Mar 2012 07:42:09 +1300
Message-ID: <CAKgNAkg2CL1JKrnPArTfr=vO0K4VebE01JVsn7e-MgUc_Fjhiw@mail.gmail.com>
References: <1330398866-16965-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330398866-16965-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied for 3.38.

On Tue, Feb 28, 2012 at 4:14 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
> =A0man2/fallocate.2 | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index 9fe0620..2f84c91 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -49,7 +49,7 @@ and
> =A0The file size (as reported by
> =A0.BR stat (2))
> =A0will be changed if
> -.I "offset + len"
> +.IR offset + len
> =A0is greater than the file size.
> =A0This default behavior closely resembles the behavior of the
> =A0.BR posix_fallocate (3)
> @@ -68,7 +68,7 @@ flag is specified in
> =A0.IR mode ,
> =A0the behavior of the call is similar,
> =A0but the file size will not be changed even if
> -.I "offset + len"
> +.IR offset + len
> =A0is greater than the file size.
> =A0Preallocating zeroed blocks beyond the end of the file in this man=
ner
> =A0is useful for optimizing append workloads.
> --
> 1.7.9.1
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
