From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] rcmd.3: Add missing condition concerning .rhosts file
Date: Fri, 8 Jan 2016 17:24:05 +0100
Message-ID: <568FE2A5.3020809@gmail.com>
References: <1451924313.4749.4.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451924313.4749.4.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Nikola,

On 01/04/2016 05:18 PM, Nikola Forr=C3=B3 wrote:
> The list of conditions determining if iruserok() and ruserok()
> functions automatically fail is incomplete. According to glibc
> source code, the functions also fail if the .rhosts file
> is hardlinked anywhere.

Just to better document the patch, could you point to the=20
relevant location in the glibc source code?

Thanks,

Michael

> ---
>  man3/rcmd.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man3/rcmd.3 b/man3/rcmd.3
> index 33eae3c..f32fe52 100644
> --- a/man3/rcmd.3
> +++ b/man3/rcmd.3
> @@ -200,8 +200,8 @@ in the local user's home directory is checked to =
see if the request for
>  service is allowed.
>  .PP
>  If this file does not exist, is not a regular file, is owned by anyo=
ne
> -other than the user or the superuser, or is writable by anyone other
> -than the owner, the check automatically fails.
> +other than the user or the superuser, is writable by anyone other
> +than the owner, or is hardlinked anywhere, the check automatically f=
ails.
>  Zero is returned if the machine name is listed in the
>  .IR hosts.equiv
>  file, or the host and remote username are found in the
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
