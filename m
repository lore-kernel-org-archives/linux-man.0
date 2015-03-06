From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] filesystems.5: ffix
Date: Fri, 06 Mar 2015 14:44:57 +0100
Message-ID: <54F9AF59.3090600@gmail.com>
References: <1425643881-6581-1-git-send-email-saulery@free.fr> <1425643881-6581-3-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425643881-6581-3-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:11 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>=20
> All filesystems in lowercase

This isn't write, I think. XFS and JFS, names based on acronyms, are
normally are written all caps, and Reiserfs, taken from a proper name
is I think usually with an initial cap.

Unfortunately, after this patches 3-5 did not apply. I remedied this
by applying this patch, then the others, then reversing this patch=20
with a manual edit.

Thanks,

Michael

> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index 006408d..1d6feed 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -26,8 +26,8 @@
>  .TH FILESYSTEMS 5 2014-01-15 "Linux" "Linux Programmer's Manual"
>  .nh
>  .SH NAME
> -filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4,=
 Reiserfs,
> -XFS, JFS, xia, msdos,
> +filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4,=
 reiserfs,
> +xfs, jfs, xia, msdos,
>  umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
>  .SH DESCRIPTION
>  When, as is customary, the
> @@ -86,15 +86,15 @@ is a set of upgrades to ext3 including substantia=
l performance and
>  reliability enhancements,
>  plus large increases in volume, file, and directory size limits.
>  .TP
> -.B Reiserfs
> +.B reiserfs
>  is a journaling filesystem, designed by Hans Reiser,
>  that was integrated into Linux in kernel 2.4.1.
>  .TP
> -.B XFS
> +.B xfs
>  is a journaling filesystem, developed by SGI,
>  that was integrated into Linux in kernel 2.4.20.
>  .TP
> -.B JFS
> +.B jfs
>  is a journaling filesystem, developed by IBM,
>  that was integrated into Linux in kernel 2.4.24.
>  .TP
> @@ -123,7 +123,7 @@ sacrificing compatibility with DOS.
>  .TP
>  .B vfat
>  is an extended DOS filesystem used by Microsoft Windows95 and Window=
s NT.
> -VFAT adds the capability to use long filenames under the MSDOS files=
ystem.
> +vfat adds the capability to use long filenames under the MSDOS files=
ystem.
>  .TP
>  .B ntfs
>  replaces Microsoft Window's FAT filesystems (VFAT, FAT32).
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
