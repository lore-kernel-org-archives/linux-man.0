From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] filesystems.5: ffix
Date: Sun, 08 Mar 2015 08:59:43 +0100
Message-ID: <54FC016F.3080300@gmail.com>
References: <1425737746-23494-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425737746-23494-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/07/2015 03:15 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>


Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Order the list of filesystems by name
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 156 ++++++++++++++++++++++++++-----------------=
----------
>  1 file changed, 78 insertions(+), 78 deletions(-)
>=20
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index 41a5adb..0c66f9e 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -26,9 +26,9 @@
>  .TH FILESYSTEMS 5 2014-01-15 "Linux" "Linux Programmer's Manual"
>  .nh
>  .SH NAME
> -filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4,=
 Reiserfs,
> -XFS, JFS, xiafs, msdos,
> -umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
> +filesystems \- Linux filesystem types: ext, ext2, ext3, ext4, hpfs, =
iso9660,
> +JFS, minix, msdos, ncpfs nfs, ntfs, proc, Reiserfs, smb, sysv, umsdo=
s, vfat,
> +XFS, xiafs,
>  .SH DESCRIPTION
>  When, as is customary, the
>  .B proc
> @@ -52,13 +52,6 @@ Below a short description of the available or hist=
orically available
>  filesystems in Linux kernel. See kernel documentation for a comprehe=
nsive
>  description of all options and limitations.
>  .TP 10
> -.B minix
> -is the filesystem used in the Minix operating system, the first to r=
un
> -under Linux.
> -It has a number of shortcomings, including a 64MB partition size
> -limit, short filenames, and a single timestamp.
> -It remains useful for floppies and RAM disks.
> -.TP
>  .B ext
>  is an elaborate extension of the
>  .B minix
> @@ -95,58 +88,10 @@ reliability enhancements,
>  plus large increases in volume, file, and directory size limits.
>  .RB See " ext4 " (5).
>  .TP
> -.B Reiserfs
> -is a journaling filesystem, designed by Hans Reiser,
> -that was integrated into Linux in kernel 2.4.1.
> -.TP
> -.B XFS
> -is a journaling filesystem, developed by SGI,
> -that was integrated into Linux in kernel 2.4.20.
> -.TP
> -.B JFS
> -is a journaling filesystem, developed by IBM,
> -that was integrated into Linux in kernel 2.4.24.
> -.TP
> -.B xiafs
> -was designed and implemented to be a stable, safe filesystem by
> -extending the Minix filesystem code.
> -It provides the basic most
> -requested features without undue complexity.
> -The
> -.B xiafs
> -filesystem is no longer actively developed or maintained.
> -It was removed from the kernel in 2.1.21.
> -.TP
> -.B msdos
> -is the filesystem used by DOS, Windows, and some OS/2 computers.
> -.B msdos
> -filenames can be no longer than 8 characters, followed by an
> -optional period and 3 character extension.
> -.TP
> -.B umsdos
> -is an extended DOS filesystem used by Linux.
> -It adds capability for
> -long filenames, UID/GID, POSIX permissions, and special files
> -(devices, named pipes, etc.)  under the DOS filesystem, without
> -sacrificing compatibility with DOS.
> -.TP
> -.B vfat
> -is an extended DOS filesystem used by Microsoft Windows95 and Window=
s NT.
> -.B vfat
> -adds the capability to use long filenames under the MSDOS filesystem=
=2E
> -.TP
> -.B ntfs
> -replaces Microsoft Window's FAT filesystems (VFAT, FAT32).
> -It has reliability, performance, and space-utilization enhancements
> -plus features like ACLs, journaling, encryption, and so on.
> -.TP
> -.B proc
> -is a pseudo filesystem which is used as an interface to kernel data
> -structures rather than reading and interpreting
> -.IR /dev/kmem .
> -In particular, its files do not take disk space.
> -See
> -.BR proc (5).
> +.B hpfs
> +is the High Performance Filesystem, used in OS/2.
> +This filesystem is
> +read-only under Linux due to the lack of available documentation.
>  .TP
>  .B iso9660
>  is a CD-ROM filesystem type conforming to the ISO 9660 standard.
> @@ -171,18 +116,53 @@ It is automatically recognized within the
>  filesystem support under Linux.
>  .RE
>  .TP
> -.B hpfs
> -is the High Performance Filesystem, used in OS/2.
> -This filesystem is
> -read-only under Linux due to the lack of available documentation.
> +.B JFS
> +is a journaling filesystem, developed by IBM,
> +that was integrated into Linux in kernel 2.4.24.
>  .TP
> -.B sysv
> -is an implementation of the SystemV/Coherent filesystem for Linux.
> -It implements all of Xenix FS, SystemV/386 FS, and Coherent FS.
> +.B minix
> +is the filesystem used in the Minix operating system, the first to r=
un
> +under Linux.
> +It has a number of shortcomings, including a 64MB partition size
> +limit, short filenames, and a single timestamp.
> +It remains useful for floppies and RAM disks.
> +.TP
> +.B msdos
> +is the filesystem used by DOS, Windows, and some OS/2 computers.
> +.B msdos
> +filenames can be no longer than 8 characters, followed by an
> +optional period and 3 character extension.
> +.TP
> +.B ncpfs
> +is a network filesystem that supports the NCP protocol, used by
> +Novell NetWare.
> +.sp
> +To use
> +.BR ncpfs ,
> +you need special programs, which can be found at
> +.UR ftp://linux01.gwdg.de\:/pub\:/ncpfs
> +.UE .
>  .TP
>  .B nfs
>  is the network filesystem used to access disks located on remote com=
puters.
>  .TP
> +.B ntfs
> +replaces Microsoft Window's FAT filesystems (VFAT, FAT32).
> +It has reliability, performance, and space-utilization enhancements
> +plus features like ACLs, journaling, encryption, and so on.
> +.TP
> +.B proc
> +is a pseudo filesystem which is used as an interface to kernel data
> +structures rather than reading and interpreting
> +.IR /dev/kmem .
> +In particular, its files do not take disk space.
> +See
> +.BR proc (5).
> +.TP
> +.B Reiserfs
> +is a journaling filesystem, designed by Hans Reiser,
> +that was integrated into Linux in kernel 2.4.1.
> +.TP
>  .B smb
>  is a network filesystem that supports the SMB protocol, used by
>  Windows for Workgroups, Windows NT, and Lan Manager.
> @@ -194,15 +174,35 @@ package, found at
>  .UR ftp://sunsite.unc.edu\:/pub\:/Linux\:/system\:/Filesystems\:/smb=
fs
>  .UE .
>  .TP
> -.B ncpfs
> -is a network filesystem that supports the NCP protocol, used by
> -Novell NetWare.
> -.sp
> -To use
> -.BR ncpfs ,
> -you need special programs, which can be found at
> -.UR ftp://linux01.gwdg.de\:/pub\:/ncpfs
> -.UE .
> +.B sysv
> +is an implementation of the SystemV/Coherent filesystem for Linux.
> +It implements all of Xenix FS, SystemV/386 FS, and Coherent FS.
> +.TP
> +.B umsdos
> +is an extended DOS filesystem used by Linux.
> +It adds capability for
> +long filenames, UID/GID, POSIX permissions, and special files
> +(devices, named pipes, etc.)  under the DOS filesystem, without
> +sacrificing compatibility with DOS.
> +.TP
> +.B vfat
> +is an extended DOS filesystem used by Microsoft Windows95 and Window=
s NT.
> +.B vfat
> +adds the capability to use long filenames under the MSDOS filesystem=
=2E
> +.TP
> +.B XFS
> +is a journaling filesystem, developed by SGI,
> +that was integrated into Linux in kernel 2.4.20.
> +.TP
> +.B xiafs
> +was designed and implemented to be a stable, safe filesystem by
> +extending the Minix filesystem code.
> +It provides the basic most
> +requested features without undue complexity.
> +The
> +.B xiafs
> +filesystem is no longer actively developed or maintained.
> +It was removed from the kernel in 2.1.21.
>  .SH SEE ALSO
>  .BR ext2 (5),
>  .BR ext3 (5),
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
