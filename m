From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man5/filesystems.5: updated list and descriptions of supported
 filesystems
Date: Tue, 03 Mar 2015 13:14:25 +0100
Message-ID: <54F5A5A1.7060401@gmail.com>
References: <1425373111-3584-1-git-send-email-saulery@free.fr> <1425373111-3584-2-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425373111-3584-2-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane,

On 03/03/2015 09:58 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

I appreciate the work your doing on man pages, but it would=20
be helpful if you could do the following:

1. When making sizable updates to existing pages, give
   me a little warning, telling me of the planned changes;
   then I could make suggestions such as I do in the next
   point before you embark on the work.

2, Patches like this are way too "busy" for me to easily=20
   deal with. You are doing multiple things in one patch:

       + Placing the existing entries in alphabetical order
       + Adding very many new filesystems in a single patch.

   All of the above seems very fine to me, but... at the
   very least, this should be a patch that does those two
   steps separately, in the above order. Then I can more easily
   distinguish what's being moved around versus what's being=20
   added.

   I think it would also be better to split the additions=20
   into logically related pieces. In the most extreme case, one
   patch per filesystem, but maybe it can be done more=20
   efficiently than that.

3. Read man-pages(7) quite closely. One of the things it notes=20
   is that new sentences should start on new source lines
   (and when breaking long sentences, breaking after punctuation
   [.,;:] is preferred).

Could you do the following:

a) Submit a patch that places the existing entries into alphabetical
   order, making if necessary rewordings to the text to reflect
   any order changes. (I'm not sure whether any such rewordings are=20
   needed)

b) Send me a *list* of the filesystems you propose to add,=20
   possibly with suggestions on how those FSes could be added=20
   in patches that add multiple related FSes.

c) Then we can see about the best way of adding those new FSes...

Does the above make sense?

Thanks,

Michael



 =20
> Sync with:
>=20
> - https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.gi=
t/tree/Documentation/filesystems
> - http://www.tldp.org/HOWTO/Filesystems-HOWTO.html
> - http://v9fs.sourceforge.net/
> - https://launchpad.net/9p-linux
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 497 +++++++++++++++++++++++++++++++++++++++++++=
+---------
>  1 file changed, 413 insertions(+), 84 deletions(-)
>=20
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index 34d2aa1..3e35938 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -26,9 +26,13 @@
>  .TH FILESYSTEMS 5 2014-01-15 "Linux" "Linux Programmer's Manual"
>  .nh
>  .SH NAME
> -filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4,=
 Reiserfs,
> -XFS, JFS, xia, msdos,
> -umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
> +filesystems \- Linux filesystem types: adfs, afs, affs, befs, bfs, b=
trfs,
> +ceph, cifs, coda, coherent, configfs, cramfs, debugfs, devpts, dlmfs=
,
> +ecryptfs, efivarfs, exofs, ext, ext2, ext3, ext4, f2fs, fat, gfs2, h=
fs,
> +hfsplus, hpfs, iso9660, jfs, logfs, minix, msdos, ncpfs, nfs, nilfs2=
, ntfs,
> +ocfs2, omfs, pohmelfs, proc, qnx6, ramfs, reiserfs, romfs, smbfs, sp=
ufs,
> +squashfs, sysfs, sysv, tmpfs, ubifs, udf, ufs, umsdos, v9fs, vfat, u=
sbfs,
> +xenix, xfs, xiafs
>  .SH DESCRIPTION
>  When, as is customary, the
>  .B proc
> @@ -42,20 +46,150 @@ see
>  for more details.
>  If you need a currently unsupported filesystem, insert the correspon=
ding
>  module or recompile the kernel.
> -
>  In order to use a filesystem, you have to
>  .I mount
>  it; see
>  .BR mount (8).
> -
> -Below a short description of a few of the available filesystems.
> +.sp
> +Below a short description of the available or historically available
> +filesystems in Linux kernel. See kernel documentation for a comprehe=
nsive
> +description of all options and limitations.
>  .TP 10
> -.B "minix"
> -is the filesystem used in the Minix operating system, the first to r=
un
> -under Linux.
> -It has a number of shortcomings, including a 64MB partition size
> -limit, short filenames, and a single timestamp.
> -It remains useful for floppies and RAM disks.
> +.B adfs
> +is the Acorn Advanced Disc Filing System, the standard filesystem of=
 the
> +RiscOS operating system which runs on Acorn's ARM-based Risc PC syst=
ems and
> +the Acorn Archimedes range of machines, that was integrated into Lin=
ux in
> +kernel 2.1.
> +.TP
> +.B afs
> +is the distributed AFS (Andrew File System) fs. It is under developm=
ent and
> +does not yet provide the full feature set. It does not yet support p=
ioctl()
> +system call.
> +.TP
> +.B affs
> +is the Amiga Fast File System (AFFS) used on hard disks by Amiga(tm)=
 systems
> +since AmigaOS Version 1.3 (34.20), that was integrated into Linux in=
 kernel
> +2.1. It supports six flavors of the file system and
> +.B muFS
> +(multi user File System) equivalents:
> +.RS
> +.TP
> +.B DOS\[rs]0
> +The old or original filesystem, not really suited for hard disks and=
 normally
> +not used on them, either. Supported read/write.
> +.TP
> +.B DOS\[rs]1
> +The original Fast File System. Supported read/write.
> +.TP
> +.B DOS\[rs]2
> +The old "international" filesystem. International means that a bug h=
as
> +been fixed so that accented ("international") letters in file names =
are
> +case-insensitive, as they ought to be. Supported read/write.
> +.TP
> +.B DOS\[rs]3
> +The "international" Fast File System. Supported read/write.
> +.TP
> +.B DOS\[rs]4
> +The original filesystem with directory cache. The directory cache sp=
eeds
> +up directory accesses on floppies considerably, but slows down file
> +creation/deletion. Doesn't make much sense on hard disks. Supported =
read only.
> +.TP
> +.B DOS\[rs]5
> +The Fast File System with directory cache. Supported read only.
> +.RE
> +
> +.TP
> +.B befs
> +is the journaling filesystem of BeOS. It's alpha version (read-only)=
=2E
> +
> +.TP
> +.B bfs
> +is the SCO UnixWare Boot Filesystem (read-only), that was integrated=
 into Linux in kernel
> +2.3.25.
> +
> +.TP
> +.B btrfs
> +is a copy on write filesystem for Linux aimed at implementing advanc=
ed
> +features while focusing on fault tolerance, repair and easy administ=
ration.
> +Initially developed by Oracle,
> +.B btrfs
> +is licensed under the GPL and open for contribution from anyone.
> +
> +.TP
> +.B ceph
> +is the Ceph Distributed File System.
> +.B ceph
> +is a distributed network file system designed to provide good perfor=
mance,
> +reliability, and scalability.
> +
> +.TP
> +.B cifs
> +is the Common Internet File System (CIFS) protocol which is the succ=
essor to
> +.BR smbfs ,
> +the Server Message Block (SMB) protocol, the native file sharing mec=
hanism for
> +most early PC operating systems.
> +
> +.TP
> +.B coda
> +is the Coda Distributed File System, historically implemented in a B=
SD file
> +system in Mach 2.6.
> +
> +.TP
> +.B coherent
> +See
> +.BR sysfs .
> +
> +.TP
> +.B configfs
> +is a ram-based filesystem that provides the converse of sysfs's func=
tionality.
> +Where sysfs is a filesystem-based view of kernel objects,
> +.B configfs
> +is a filesystem-based manager of kernel objects, or config_items.
> +
> +.TP
> +.B cramfs
> +is a filesystem onto a small ROM.
> +.B cramfs
> +is designed to be simple and small, and to compress things well.=20
> +
> +.TP
> +.B debugfs
> +is a simple way for kernel developers to make any information availa=
ble to
> +user space, specially for debugging purpose. See also
> +.BR proc " and " sysfs .
> +
> +.TP
> +.B devpts
> +is an interface to pseudo terminal (pty) devices. It is typically mo=
unted at
> +.IR /dev/pts .
> +See
> +.BR pty (7).
> +
> +.TP
> +.B dlmfs
> +is the userspace interface to the OCFS2 DLM.
> +
> +.TP
> +.B ecryptfs
> +is a stacked cryptographic filesystem for Linux, currently undergoin=
g
> +development.
> +
> +.TP
> +.B efivarfs
> +is a (U)EFI variable filesystem. The
> +.B efivarfs
> +filesystem was created to address the shortcomings of using entries =
in sysfs
> +to maintain EFI variables.
> +
> +.TP
> +.B exofs
> +is a file system that uses an OSD and exports the API of a normal Li=
nux
> +file system. Users access
> +.B exofs
> +like any other local file system, and
> +.B exofs
> +will in turn issue commands to the local OSD initiator.
> +
>  .TP
>  .B ext
>  is an elaborate extension of the
> @@ -65,78 +199,73 @@ It has been completely superseded by the second =
version
>  of the extended filesystem
>  .RB ( ext2 )
>  and has been removed from the kernel (in 2.1.21).
> +
>  .TP
>  .B ext2
>  is the high performance disk filesystem used by Linux for fixed disk=
s
>  as well as removable media.
>  The second extended filesystem was designed as an extension of the
>  extended filesystem
> -.RB ( ext ).
> +.RB ( ext ),
> +originally released in January 1993.
>  .B ext2
>  offers the best performance (in terms of speed and CPU usage) of
> -the filesystems supported under Linux.
> +the filesystems supported under Linux (see=20
> +.BR ext2 (5)).
> +
>  .TP
>  .B ext3
> -is a journaling version of the ext2 filesystem.
> +is a journaling version of the
> +.B ext2
> +filesystem, originally released in September 1999 for the 2.2 branch=
, and
> +ported to 2.4 Linux kernels.
>  It is easy to
> -switch back and forth between ext2 and ext3.
> +switch back and forth between
> +.BR ext2 " and " ext3 (see
> +.BR ext3 (5)).
> +
>  .TP
>  .B ext4
> -is a set of upgrades to ext3 including substantial performance and
> +is a set of upgrades to
> +.B ext3
> +including substantial performance and
>  reliability enhancements,
> -plus large increases in volume, file, and directory size limits.
> -.TP
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
> +plus large increases in volume, file, and directory size limits (64 =
bit) (see
> +.BR ext4 (5)).
> +
>  .TP
> -.B xiafs
> -was designed and implemented to be a stable, safe filesystem by
> -extending the Minix filesystem code.
> -It provides the basic most
> -requested features without undue complexity.
> -The
> -.B xia
> -filesystem is no longer actively developed or maintained.
> -It was removed from the kernel in 2.1.21.
> +.B f2fs
> +is the Flash-Friendly File System (F2FS), a file system exploiting N=
AND flash
> +memory-based storage devices, which is based on Log-structured File =
System
> +(LFS). The design has been focused on addressing the fundamental iss=
ues in
> +LFS, which are snowball effect of wandering tree and high cleaning o=
verhead.
> +
>  .TP
> -.B msdos
> -is the filesystem used by DOS, Windows, and some OS/2 computers.
> -.B msdos
> -filenames can be no longer than 8 characters, followed by an
> -optional period and 3 character extension.
> +.B fat
> +is the File Allocation Table (FAT), a filesystem originally designed=
 in 1977
> +for use on floppy disks for DOS and Windows 9x.
> +.B fat
> +is not a separate filesystem, but a common part of the
> +.BR msdos ", " umsdos " and " vfat
> +filesystems.
>  .TP
> -.B umsdos
> -is an extended DOS filesystem used by Linux.
> -It adds capability for
> -long filenames, UID/GID, POSIX permissions, and special files
> -(devices, named pipes, etc.)  under the DOS filesystem, without
> -sacrificing compatibility with DOS.
> +.B gfs2
> +is the Global File System 2, a cluster file system, that was integra=
ted into
> +Linux in kernel 2.6.19.
> +
>  .TP
> -.B vfat
> -is an extended DOS filesystem used by Microsoft Windows95 and Window=
s NT.
> -VFAT adds the capability to use long filenames under the MSDOS files=
ystem.
> +.B hfs
> +is the Macintosh Hierarchical File System filesystem (HFS). It's the
> +filesystem used by the Mac Plus and all later Macintosh models.
> +
>  .TP
> -.B ntfs
> -replaces Microsoft Window's FAT filesystems (VFAT, FAT32).
> -It has reliability, performance, and space-utilization enhancements
> -plus features like ACLs, journaling, encryption, and so on.
> +.B hfsplus
> +is the extended version of HFS filesystem first introduced in MacOS =
8.1.
> +
>  .TP
> -.B proc
> -is a pseudo filesystem which is used as an interface to kernel data
> -structures rather than reading and interpreting
> -.IR /dev/kmem .
> -In particular, its files do not take disk space.
> -See
> -.BR proc (5).
> +.B hpfs
> +is the High Performance Filesystem, used in OS/2. This filesystem is=
 read-only
> +under Linux due to the lack of available documentation.
>  .TP
>  .B iso9660
>  is a CD-ROM filesystem type conforming to the ISO 9660 standard.
> @@ -160,41 +289,241 @@ It is automatically recognized within the
>  .B iso9660
>  filesystem support under Linux.
>  .RE
> +
>  .TP
> -.B hpfs
> -is the High Performance Filesystem, used in OS/2.
> -This filesystem is
> -read-only under Linux due to the lack of available documentation.
> +.B jfs
> +is the IBM's Journaled File System (JFS), a journaling filesystem, d=
eveloped
> +by IBM, that was integrated into Linux in kernel 2.4.24.
> +
>  .TP
> -.B sysv
> -is an implementation of the SystemV/Coherent filesystem for Linux.
> -It implements all of Xenix FS, SystemV/386 FS, and Coherent FS.
> +.B logfs
> +is the LogFS Flash Filesystem, a Linux log-structured and scalable f=
lash
> +file system, intended for use on large devices of flash memory, that=
 was
> +integrated into Linux in kernel 2.6.34.
> +
>  .TP
> -.B nfs
> -is the network filesystem used to access disks located on remote com=
puters.
> +.B minix
> +is the filesystem used in the Minix operating system, the first to r=
un
> +under Linux.
> +It has a number of shortcomings, including a 64MB partition size
> +limit, short filenames, and a single timestamp.
> +It remains useful for floppies and RAM disks.
> +
>  .TP
> -.B smb
> -is a network filesystem that supports the SMB protocol, used by
> -Windows for Workgroups, Windows NT, and Lan Manager.
> -.sp
> -To use
> -.B smb
> -fs, you need a special mount program, which can be found in the ksmb=
fs
> -package, found at
> -.UR ftp://sunsite.unc.edu\:/pub\:/Linux\:/system\:/Filesystems\:/smb=
fs
> -.UE .
> +.B msdos
> +is the filesystem used by DOS, Windows, and some OS/2 computers.
> +.B msdos
> +filenames can be no longer than 8 characters, followed by an
> +optional period and 3 character extension.
> +
>  .TP
>  .B ncpfs
>  is a network filesystem that supports the NCP protocol, used by
> -Novell NetWare.
> +Novell NetWare (tm).
>  .sp
>  To use
>  .BR ncpfs ,
>  you need special programs, which can be found at
>  .UR ftp://linux01.gwdg.de\:/pub\:/ncpfs
>  .UE .
> +
> +.TP
> +.B nfs
> +is the Network FileSystem (NFS) used to access disks located on remo=
te
> +computers. There are four major versions of this filesystem. The NFS=
 version
> +2 protocol was first documented in RFC1094 (March 1989). Since then =
two more
> +major releases of NFS have been published, with NFSv3 being document=
ed in
> +RFC1813 (June 1995), and NFSv4 in RFC3530 (April 2003).
> +.sp
> +The Linux NFS client currently supports all the above published vers=
ions,
> +and work is in progress on adding support for minor version 1 of the=
 NFSv4
> +protocol.
> +
> +.TP
> +.B nilfs2
> +is a log-structured file system (LFS) supporting continuous snapshot=
ting. In
> +addition to versioning capability of the entire file system, users c=
an even
> +restore files mistakenly overwritten or destroyed just a few seconds=
 ago.
> +Since NILFS2 can keep consistency like conventional LFS, it achieves=
 quick
> +recovery after system crashes.
> +
> +.TP
> +.B ntfs
> +is the New Technology File System (NTFS), the successor of Microsoft
> +Window's FAT filesystems since Windows NT. It has reliability, perfo=
rmance,
> +and space-utilization enhancements plus features like ACLs, journali=
ng,
> +encryption, and so on.
> +
> +.TP
> +.B ocfs2
> +is the Oracle Cluster File System 2 (OCFS2), is a general purpose ex=
tent based
> +shared disk cluster file system with many similarities to
> +.BR ext3 .
> +It supports 64 bit inode numbers, and has automatically extending me=
tadata
> +groups which may also make it attractive for non-clustered use.
> +
> +.TP
> +.B omfs
> +is the Optimized MPEG Filesystem (OMFS), a filesystem created by Son=
icBlue for
> +use in the ReplayTV DVR and Rio Karma MP3 player.
> +
> +.TP
> +.B pohmelfs
> +is the Parallel Optimized Host Message Exchange Layered File System
> +(POHMELFS), a distributed network filesystem of Elliptics which supp=
orts
> +multiple copies, automatic recovery, read load balancing, quorum wri=
te and
> +many other features.
> +
> +.TP
> +.B proc
> +is a pseudo filesystem which is used as an interface to kernel data
> +structures rather than reading and interpreting
> +.IR /dev/kmem .
> +In particular, its files do not take disk space.
> +See
> +.BR proc (5).
> +
> +.TP
> +.B qnx6
> +is the QNX6 Filesystem, the filesystem used by QNX operating systems=
=2E It got
> +introduced in QNX 6.4.0 and is used default since 6.4.1.
> +
> +.TP
> +.B ramfs
> +is the the 'in memory' filesystems
> +.BR ramfs ", " rootfs " and " initramfs .
> +.B ramfs
> +is a very simple filesystem that exports Linux's disk caching mechan=
isms (the
> +page cache and dentry cache) as a dynamically resizable RAM-based fi=
lesystem.
> +
> +.TP
> +.B reiserfs
> +is a journaling filesystem, designed by Hans Reiser,
> +that was integrated into Linux in kernel 2.4.1.
> +
> +.TP
> +.B romfs
> +is the Rom FileSystem, a quite dumb, read only filesystem, mainly fo=
r initial
> +RAM disks of installation disks.
> +
> +.TP
> +.B smbfs
> +is a network filesystem that supports the Server Message Block (SMB)=
 protocol,
> +used by Windows for Workgroups, Windows NT, and Lan Manager.
> +.sp
> +To use
> +.BR smbfs ,
> +you need a special mount program, which can be found in the ksmbfs
> +package, found at
> +.UR ftp://sunsite.unc.edu\:/pub\:/Linux\:/system\:/Filesystems\:/smb=
fs
> +.UE .
> +
> +.TP
> +.B spufs
> +is the SPU file system, a filesystem used on PowerPC machines that i=
mplement
> +the Cell Broadband Engine Architecture in order to access Synergisti=
c
> +Processor Units (SPUs).
> +
> +.TP
> +.B squashfs
> +is a compressed read-only file system for Linux.
> +.B squashfs
> +is intended for general read-only filesystem use, for archival use a=
nd in
> +constrained block device/memory systems (e.g. embedded systems) wher=
e low
> +overhead is needed.
> +
> +.TP
> +.B sysfs
> +is the a ram-based filesystem initially based on
> +.BR ramfs .
> +It provides a means to export kernel data structures, their attribut=
es, and
> +the linkages between them to userspace.
> +
> +.TP
> +.B sysv
> +is an implementation of the SystemV/V7/Xenix/Coherent filesystem for=
 Linux.
> +It implements all of Xenix FS, SystemV/386 FS, and Coherent FS.
> +
> +.TP
> +.B tmpfs
> +is a Linux file system which keeps all files in virtual memory. Ever=
ything in
> +.B tmpfs
> +is temporary in the sense that no files will be created on your hard
> +drive. If you unmount a
> +.B tmpfs
> +instance, everything stored therein is lost.
> +
> +.TP
> +.B ubifs
> +is the Unsorted Block Images FileSystem (UBIFS), a flash file system=
=2E
> +
> +.TP
> +.B udf
> +is the Universal Disk Format (UDF), a format designed for incrementa=
l
> +writing on optical discs.
> +
> +.TP
> +.B ufs
> +is the Unix File System (UFS) used by many Unix and Unix-like operat=
ing
> +systems. It is a distant descendant of the original filesystem used =
by Version
> +7 Unix. Features of some implementations are undocumented, so its ha=
rd to
> +recognize type of ufs automatically.
> +
> +.TP
> +.B umsdos
> +is an extended DOS filesystem used by Linux. It adds capability for =
long
> +filenames, UID/GID, POSIX permissions, and special files (devices, n=
amed
> +pipes, etc.) under the DOS filesystem, without sacrificing compatibi=
lity with
> +DOS.
> +
> +.TP
> +.B usbfs
> +is the USB Device Filesystem, an obsolete filesystem for USB key.
> +
> +.TP
> +.B vfat
> +is an extended DOS filesystem used by Microsoft Windows95 and Window=
s NT.
> +.B vfat
> +adds the capability to use long filenames under the MSDOS filesystem=
=2E
> +
> +.TP
> +.B v9fs
> +is a Unix implementation of the Plan 9 9p remote filesystem protocol
> +originally developed by Ron Minnich and Maya Gokhale, that was integ=
rated into
> +Linux in kernel 2.6.14. Normal plan9 servers will work with
> +.BR v9fs ,
> +but for
> +folks looking for a Linux-based server we have moved towards support=
 the
> +.BR npfs / spfs
> +libraries and applications.
> +
> +.TP
> +.B xenix
> +See
> +.BR sysfs .
> +
> +.TP
> +.B xfs
> +is a 64-bit journaling filesystem, developed by Silicon Graphics, In=
c (SGI) in
> +1993, that was integrated into Linux in kernel 2.4.20. It was the de=
fault file
> +system in the SGI's IRIX operating system starting with its version =
5.3
> +
> +.TP
> +.B xiafs
> +was designed and implemented to be a stable, safe filesystem by
> +extending the Minix filesystem code.
> +It provides the basic most
> +requested features without undue complexity.
> +.B xiafs
> +is no longer actively developed or maintained.
> +It was removed from the kernel in 2.1.21.
> +
>  .SH SEE ALSO
> +.BR ext2 (5),
> +.BR ext3 (5),
> +.BR ext4 (5),
>  .BR proc (5),
> +.BR pty (7),
>  .BR fsck (8),
>  .BR mkfs (8),
>  .BR mount (8)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
