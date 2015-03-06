From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/6] filesystems.5: ffix
Date: Fri, 06 Mar 2015 14:45:14 +0100
Message-ID: <54F9AF6A.3030402@gmail.com>
References: <1425643881-6581-1-git-send-email-saulery@free.fr> <1425643881-6581-5-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425643881-6581-5-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:11 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>


Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Highlight all file systems citations
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index 5638d49..cc43b71 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -77,12 +77,17 @@ offers the best performance (in terms of speed an=
d CPU usage) of
>  the filesystems supported under Linux.
>  .TP
>  .B ext3
> -is a journaling version of the ext2 filesystem.
> +is a journaling version of the
> +.B ext2
> +filesystem.
>  It is easy to
> -switch back and forth between ext2 and ext3.
> +switch back and forth between
> +.BR ext2 " and " ext3 .
>  .TP
>  .B ext4
> -is a set of upgrades to ext3 including substantial performance and
> +is a set of upgrades to
> +.B ext3
> +including substantial performance and
>  reliability enhancements,
>  plus large increases in volume, file, and directory size limits.
>  .TP
> @@ -123,7 +128,8 @@ sacrificing compatibility with DOS.
>  .TP
>  .B vfat
>  is an extended DOS filesystem used by Microsoft Windows95 and Window=
s NT.
> -vfat adds the capability to use long filenames under the MSDOS files=
ystem.
> +.B vfat
> +adds the capability to use long filenames under the MSDOS filesystem=
=2E
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
