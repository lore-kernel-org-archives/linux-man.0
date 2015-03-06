From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] filesystems.5: wfix
Date: Fri, 06 Mar 2015 14:45:06 +0100
Message-ID: <54F9AF62.70602@gmail.com>
References: <1425643881-6581-1-git-send-email-saulery@free.fr> <1425643881-6581-4-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425643881-6581-4-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:11 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>


Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> XIA filesystem Linux module name is xiafs
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index 1d6feed..5638d49 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -27,7 +27,7 @@
>  .nh
>  .SH NAME
>  filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4,=
 reiserfs,
> -xfs, jfs, xia, msdos,
> +xfs, jfs, xiafs, msdos,
>  umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
>  .SH DESCRIPTION
>  When, as is customary, the
> @@ -104,7 +104,7 @@ extending the Minix filesystem code.
>  It provides the basic most
>  requested features without undue complexity.
>  The
> -.B xia
> +.B xiafs
>  filesystem is no longer actively developed or maintained.
>  It was removed from the kernel in 2.1.21.
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
