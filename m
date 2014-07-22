From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stat.2: nfix
Date: Tue, 22 Jul 2014 07:17:20 +0200
Message-ID: <53CDF3E0.2070407@gmail.com>
References: <1405549510-8000-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405549510-8000-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. APplied.

Cheers,

Michael

On 07/17/2014 12:25 AM, David Pr=E9vot wrote:
> ---
>  man2/stat.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/stat.2 b/man2/stat.2
> index b70797d..1570568 100644
> --- a/man2/stat.2
> +++ b/man2/stat.2
> @@ -337,7 +337,7 @@ if (S_ISREG(sb.st_mode)) {
>  .fi
>  .PP
>  The definitions of most of the above file type test macros
> -are provided if any of the following feature test macros are defined=
:
> +are provided if any of the following feature test macros is defined:
>  .BR _BSD_SOURCE
>  (in glibc 2.19 and earlier),
>  .BR _SVID_SOURCE
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
