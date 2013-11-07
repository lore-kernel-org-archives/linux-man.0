From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fexecve.3: ffix
Date: Fri, 08 Nov 2013 05:55:26 +1300
Message-ID: <527BC5FE.4060508@gmail.com>
References: <1383100652-7236-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383100652-7236-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael


On 10/30/13 15:37, David Pr=E9vot wrote:
> ---
>  man3/fexecve.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man3/fexecve.3 b/man3/fexecve.3
> index f228f00..03a00da 100644
> --- a/man3/fexecve.3
> +++ b/man3/fexecve.3
> @@ -114,7 +114,7 @@ Simply opening the file, checksumming the content=
s, and then doing an
>  would not suffice, since, between the two steps, the filename,
>  or a directory prefix of the pathname, could have been exchanged
>  (by, for example, modifying the target of a symbolic link).
> -.BR fexecve()
> +.BR fexecve ()
>  does not mitigate the problem that the
>  .I contents
>  of a file could be changed between the checksumming and the call to
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
