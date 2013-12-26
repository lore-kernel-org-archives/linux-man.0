From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ftw.3: tfix
Date: Fri, 27 Dec 2013 07:42:13 +1300
Message-ID: <52BC7885.6040705@gmail.com>
References: <1387140313-28199-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387140313-28199-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/16/13 09:45, David Pr=E9vot wrote:

Thanks, David. Applied.

Cheers,

Michael


> ---
>  man3/ftw.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man3/ftw.3 b/man3/ftw.3
> index aaf1639..ba88100 100644
> --- a/man3/ftw.3
> +++ b/man3/ftw.3
> @@ -267,7 +267,7 @@ is a directory, and \fBFTW_DEPTH\fP was specified=
 in \fIflags\fP.
>  .B FTW_DEPTH
>  was not specified in
>  .IR flags ,
> -then directories will always be visitied with
> +then directories will always be visited with
>  .I typeflag
>  set to
>  .BR FTW_D .)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
