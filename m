From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] charsets.7: Tidy up list
Date: Tue, 15 Jul 2014 06:24:20 +0200
Message-ID: <53C4ACF4.4010907@gmail.com>
References: <1405307953-24884-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405307953-24884-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC+=3D Marko]

On 07/14/2014 05:19 AM, David Pr=C3=A9vot wrote:
> Remove German from main list as Dutch and French were.

Hi David

Can you say a bit more about why this change is needed please.

Thanks,

Michael

> ---
>  man7/charsets.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man7/charsets.7 b/man7/charsets.7
> index 300d819..45d18ce 100644
> --- a/man7/charsets.7
> +++ b/man7/charsets.7
> @@ -68,7 +68,7 @@ Here are brief descriptions of each set:
>  .TP
>  8859-1 (Latin-1)
>  Latin-1 covers many West European languages such as Albanian, Basque=
,
> -Danish, English, Faroese, Galician, German, Icelandic, Irish, Italia=
n,
> +Danish, English, Faroese, Galician, Icelandic, Irish, Italian,
>  Norwegian, Portuguese, Spanish, and Swedish.
>  The lack of the ligatures Dutch =C4=B2/=C4=B3, French =C5=93, and ol=
d-style =E2=80=9EGerman=E2=80=9C
>  quotation marks was considered tolerable.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
