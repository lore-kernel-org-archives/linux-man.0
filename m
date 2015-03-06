From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] filesystems.5: Specifies the scope of this list and
 its limits.
Date: Fri, 06 Mar 2015 14:39:49 +0100
Message-ID: <54F9AE25.4090800@gmail.com>
References: <1425643881-6581-1-git-send-email-saulery@free.fr> <1425643881-6581-7-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425643881-6581-7-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:11 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Applied.

Cheers,

Michael


> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index 2380a00..37bff37 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -48,7 +48,9 @@ In order to use a filesystem, you have to
>  it; see
>  .BR mount (8).
> =20
> -Below a short description of a few of the available filesystems.
> +Below a short description of the available or historically available
> +filesystems in Linux kernel. See kernel documentation for a comprehe=
nsive
> +description of all options and limitations.
>  .TP 10
>  .B minix
>  is the filesystem used in the Minix operating system, the first to r=
un
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
