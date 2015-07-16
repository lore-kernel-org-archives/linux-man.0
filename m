From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ldconfig.8: wsfix
Date: Fri, 17 Jul 2015 00:05:34 +0200
Message-ID: <55A82AAE.5010504@gmail.com>
References: <1436339698-19824-1-git-send-email-ville.skytta@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436339698-19824-1-git-send-email-ville.skytta-X3B1VOXEql0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Ville_Skytt=E4?= <ville.skytta-X3B1VOXEql0@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Ville. Applied.

Cheers,

Michael

On 07/08/2015 09:14 AM, Ville Skytt=E4 wrote:
> ---
>  man8/ldconfig.8 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man8/ldconfig.8 b/man8/ldconfig.8
> index 14956bd..233647e 100644
> --- a/man8/ldconfig.8
> +++ b/man8/ldconfig.8
> @@ -131,7 +131,7 @@ instead of
>  .IR /etc/ld.so.conf .
>  .\" FIXME glibc 2.7 added -i
>  .TP
> -.BR \-i ", " \-\-ignore\-aux\-cache=09
> +.BR \-i ", " \-\-ignore\-aux\-cache
>  (Since glibc 2.7)
>  .\"             commit 27d9ffda17df4d2388687afd12897774fde39bcc
>  Ignore auxiliary cache file.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
