From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] filesystems.5: srcfix
Date: Fri, 06 Mar 2015 14:36:42 +0100
Message-ID: <54F9AD6A.2040905@gmail.com>
References: <1425643881-6581-1-git-send-email-saulery@free.fr> <1425643881-6581-2-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425643881-6581-2-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:11 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Remove useless quotes
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index 34d2aa1..006408d 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -50,7 +50,7 @@ it; see
> =20
>  Below a short description of a few of the available filesystems.
>  .TP 10
> -.B "minix"
> +.B minix
>  is the filesystem used in the Minix operating system, the first to r=
un
>  under Linux.
>  It has a number of shortcomings, including a 64MB partition size
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
