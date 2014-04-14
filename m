From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] locale.7: tfix
Date: Mon, 14 Apr 2014 12:25:43 +0200
Message-ID: <534BB7A7.1000603@gmail.com>
References: <1397169620-10086-1-git-send-email-taffit@debian.org> <1397169620-10086-2-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397169620-10086-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David.

Applied.

Cheers,

Michael


On 04/11/2014 12:40 AM, David Pr=E9vot wrote:
> ---
>  man7/locale.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man7/locale.7 b/man7/locale.7
> index 1c7710f..0a91c3b 100644
> --- a/man7/locale.7
> +++ b/man7/locale.7
> @@ -103,7 +103,7 @@ or
>  .TP
>  .BR LC_IDENTIFICATION " (GNU extension, since glibc 2.2)"
>  .\" See ISO/IEC Technical Report 14652
> -Change settings that relate to the metdata for the locale.
> +Change settings that relate to the metadata for the locale.
>  Applications that need this information can use
>  .BR nl_langinfo (3)
>  to retrieve nonstandard elements, such as
> @@ -111,7 +111,7 @@ to retrieve nonstandard elements, such as
>  (title of this locale document)
>  and
>  .B _NL_IDENTIFICATION_TERRITORY
> -(geograpical territory to which this locale document applies),
> +(geographical territory to which this locale document applies),
>  which might return strings such as "English locale for the USA"
>  and "USA".
>  (Other element names are listed in
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
