From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] strftime.3: tfix
Date: Tue, 15 Mar 2016 06:22:16 +1300
Message-ID: <56E6F348.1090902@gmail.com>
References: <1457955469.3192.3.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457955469.3192.3.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2016 12:37 AM, Nikola Forr=C3=B3 wrote:
> Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Thanks, Nikola. Patch applied.

Cheers,

Michael


> ---
>  man3/strftime.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man3/strftime.3 b/man3/strftime.3
> index 3dfa9c6..23f9b0b 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -80,7 +80,7 @@ are copied verbatim from
>  to
>  .IR s .
>  However, the characters
> -of conversion specifications are replaced as whown in the list below=
=2E
> +of conversion specifications are replaced as shown in the list below=
=2E
>  In this list, the field(s) employed from the
>  .I tm
>  structure are also shown.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
