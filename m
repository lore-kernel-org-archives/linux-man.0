From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memchr.3: tfix
Date: Wed, 2 May 2012 15:46:55 +1200
Message-ID: <CAKgNAkgt2wbz4H32x426obX8+Gd7FLdQhVwBzE9o0-US7LwRvg@mail.gmail.com>
References: <1335927051-17321-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335927051-17321-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

On Wed, May 2, 2012 at 2:50 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
> =A0man3/memchr.3 | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/memchr.3 b/man3/memchr.3
> index 246815d..82fd5b4 100644
> --- a/man3/memchr.3
> +++ b/man3/memchr.3
> @@ -88,7 +88,7 @@ lies somewhere in the memory area starting at the l=
ocation pointed to by
> =A0.IR s ,
> =A0and so performs an optimized search for
> =A0.IR c
> -(i.e., no use of a count argument argument to limit the range of the=
 search).
> +(i.e., no use of a count argument to limit the range of the search).
> =A0If an instance of
> =A0.I c
> =A0is not found, the results are unpredictable.
> --
> 1.7.10
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
