From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] securetty.5: Note that the pam_securetty module also
 uses this file
Date: Sun, 08 Mar 2015 09:21:58 +0100
Message-ID: <54FC06A6.7070206@gmail.com>
References: <20090510105952.GA19341@nekral.nekral.homelinux.net> <1425744418-26003-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425744418-26003-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 528015-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/07/2015 05:06 PM, St=C3=A9phane Aulery wrote:
> Debian Bug #528015 reported by "Nicolas FRANCOIS (Nekral)" <nicolas.f=
rancois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org>
>=20
> See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D528015
>=20
> This patch is a modified version of the one proposed without specific=
 part to
> Debian.

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/securetty.5 | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/man5/securetty.5 b/man5/securetty.5
> index 99f6c57..88f9fb6 100644
> --- a/man5/securetty.5
> +++ b/man5/securetty.5
> @@ -29,17 +29,26 @@ securetty \- file which lists terminals from whic=
h root can log in
>  .SH DESCRIPTION
>  The file
>  .I /etc/securetty
> -is used by (some versions of)
> -.BR login (1).
> -The file contains the device names of terminal lines
> +contains the names of terminals
>  (one per line, without leading
>  .IR /dev/ )
> +which are considered secure for the transmission of certain authenti=
cation
> +tokens.
> +.P
> +It is used by (some versions of)
> +.BR login (1)
> +to restrict the terminals
>  on which root is allowed to login.
>  See
>  .BR login.defs (5)
>  if you use the shadow suite.
> +.P
> +On PAM enabled systems, it is used for the same purpose by
> +.BR pam_securetty (8)
> +to restrict the terminals on which empty passwords are accepted.
>  .SH FILES
>  .I /etc/securetty
>  .SH SEE ALSO
>  .BR login (1),
> -.BR login.defs (5)
> +.BR login.defs (5),
> +.BR pam_securetty (8)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
