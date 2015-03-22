From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] hier.7: SGML and XML directories are separated in
 FHS 2.3
Date: Sun, 22 Mar 2015 16:51:46 +0100
Message-ID: <550EE512.9080604@gmail.com>
References: <1426374917-11484-1-git-send-email-saulery@free.fr> <1426374917-11484-4-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426374917-11484-4-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 12:15 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael

> ---
>  man7/hier.7 | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/man7/hier.7 b/man7/hier.7
> index df98f7e..70ada3c 100644
> --- a/man7/hier.7
> +++ b/man7/hier.7
> @@ -76,7 +76,7 @@ in
>  .IR /opt .
>  .TP
>  .I /etc/sgml
> -This directory contains the configuration files for SGML and XML (op=
tional).
> +This directory contains the configuration files for SGML (optional).
>  .TP
>  .I /etc/skel
>  When a new user account is created, files from this directory are
> @@ -85,6 +85,9 @@ usually copied into the user's home directory.
>  .I /etc/X11
>  Configuration files for the X11 window system (optional).
>  .TP
> +.I /etc/xml
> +This directory contains the configuration files for XML (optional).
> +.TP
>  .I /home
>  On machines with home directories for users, these are usually benea=
th
>  this directory, directly or not.
> @@ -352,7 +355,7 @@ same OS.
>  The message catalogs for native language support go here (optional).
>  .TP
>  .I /usr/share/sgml
> -Files for SGML and XML (optional).
> +Files for SGML (optional).
>  .TP
>  .I /usr/share/terminfo
>  The database for terminfo (optional).
> @@ -360,6 +363,9 @@ The database for terminfo (optional).
>  .I /usr/share/tmac
>  Troff macros that are not distributed with groff (optional).
>  .TP
> +.I /usr/share/xml
> +Files for XML (optional).
> +.TP
>  .I /usr/share/zoneinfo
>  Files for timezone information (optional).
>  .TP
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
