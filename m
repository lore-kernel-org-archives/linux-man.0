From: =?UTF-8?Q?St=C3=A9phane?= Aulery <saulery@free.fr>
Subject: Bug#171681: man5/filesystems.5: updated list and descriptions of supported filesystems
Date: Tue, 16 Feb 2016 22:35:15 +0100
Message-ID: <56C39613.6030908@free.fr>
References: <1425373111-3584-1-git-send-email-saulery@free.fr>
 <1425373111-3584-2-git-send-email-saulery@free.fr>
 <54F5A5A1.7060401@gmail.com> <20150309182939.GA13767@free.fr>
 <54FE87DD.8090003@gmail.com> <20150310234652.GA2988@free.fr>
 <54FFD76C.9080708@gmail.com>
Reply-To: saulery@free.fr, 171681@bugs.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-bugs-dist=glddb-debian-bugs-dist=m.gmane.org@lists.debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.171681.B171681.1455658576597@bugs.debian.org>
In-Reply-To: <54FFD76C.9080708@gmail.com>
List-URL: <https://lists.debian.org/debian-bugs-dist/>
List-Post: <mailto:debian-bugs-dist@lists.debian.org>
List-Help: <mailto:debian-bugs-dist-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=unsubscribe>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, "Dr. Tobias Quathamer" <toddy@debian.org>
Cc: 171681@bugs.debian.org
List-Id: linux-man@vger.kernel.org

Hello Tobias and Michael,

I quote yours previous private reply about debian bug #171681 on the=20
manpage list with my next post about it and a copy of the last patch.


Le 15/02/2016 19:02, Dr. Tobias Quathamer a =C3=A9crit :
 > Am 15.02.2016 um 14:26 schrieb St=C3=A9phane Aulery:
 >>
 >>For bug #171681 I did a lot of work to list all supported file systems=
.
 >>Michel refused the patch because it was too big, and it was too
 >>difficult to verify. I still have to send little by little and I think
 >>rework to thoroughly check every detail of descriptions. At the moment=
 I
 >>am not available for this work before several more months.
 >>
 >>If this interests you I can give you my patch in the hope that you can
 >>get things done faster. If so, I do some archeology tonight.
 > Hi St=C3=A9phane and Michael,
 >
 > sure, why not. If Michael is not opposed to the patch in general, just
 > opposed to a huge patch, I could try to split it into smaller pieces
 > which are easier to review.
 >
 > In any case, I think it would be an improvement to add at least some o=
f
 > the more common filesystems to that manpage.
 >
 > So if it's not too much work for you, you could send me your patch so
 > far. However, I cannot promise that I have the time to work on this.


About this bug I had send this first patch to M. Kerrisk. He rejected=20
it. Too long for a good review. See this thread on=20
linux-man@vger.kernel.org [1].

I started to break my patch and some passages were corrected (see=20
patches accepted from March 2015) [2].

The list is long and it must be controlled because my initial patch was=20
only to add all FS. Then I wanted to check every description with the=20
kernel doc.

(PS: Sorry, I changed my PC before a disaster and yet, my copy of git is=20
on a USB key that I do not have with me. I can not do more to help.)

[1] http://thread.gmane.org/gmane.linux.man/8476/focus=3D8477
[2]=20
http://git.kernel.org/cgit/docs/man-pages/man-pages.git/log/man5/filesyst=
ems.5

Regards


-------------------------------------------------------------------------=
--------


Le 11/03/2015 06:49, Michael Kerrisk (man-pages) a =C3=A9crit :
> On 03/11/2015 12:46 AM, St=C3=A9phane Aulery wrote:
>> Le mardi 10 mars 2015 =C3=A0 06:57:49, Michael Kerrisk (man-pages) a =C3=
=A9crit :
>>> On 03/09/2015 07:29 PM, St=C3=A9phane Aulery wrote:
>>>>
>>>> Le mardi 03 mars 2015 =C3=A0 01:14:25, Michael Kerrisk (man-pages) a=
 =C3=A9crit :
>>>>>
>>>>> b) Send me a *list* of the filesystems you propose to add,
>>>>>     possibly with suggestions on how those FSes could be added
>>>>>     in patches that add multiple related FSes.
>>>>
>>>> Here is a list:
>>>>
>>>> adfs, afs, affs (five variants: DOS/0, DOS/1, DOS/2, DOS/3, DOS/4, D=
OS/5),
>>>> befs, bfs, btrfs, ceph, cifs, coda, coherent, configfs, cramfs, debu=
gfs,
>>>> devpts, dlmfs, ecryptfs, efivarfs, exofs, f2fs, fat, gfs2, hfs, hfsp=
lus,
>>>> logfs, nilfs2, ocfs2, omfs, pohmelfs, qnx6, ramfs, reiserfs, romfs, =
spufs,
>>>> spufs, squashfs, sysfs, tmpfs, ubifs, udf, ufs, v9fs, usbfs, xenix
>>>
>>> Any ideas about ways of grouping these? I'd rather not receive one
>>> patch with them all...
>>
>> No idea of grouping. In packages of two or three?
>
> Okay -- if nothing better, that will do.





-------- Message transf=C3=A9r=C3=A9 --------
Sujet : man5/filesystems.5: updated list and descriptions of supported=20
filesystems
Date : Tue,  3 Mar 2015 09:58:31 +0100
De : saulery@free.fr
Pour : mtk.manpages@gmail.com
Copie =C3=A0 : linux-man@vger.kernel.org, St=C3=A9phane Aulery <saulery@f=
ree.fr>

From: St=C3=A9phane Aulery <saulery@free.fr>

Sync with:

-=20
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree=
/Documentation/filesystems
- http://www.tldp.org/HOWTO/Filesystems-HOWTO.html
- http://v9fs.sourceforge.net/
- https://launchpad.net/9p-linux

Signed-off-by: St=C3=A9phane Aulery <saulery@free.fr>
---
  man5/filesystems.5 | 497=20
++++++++++++++++++++++++++++++++++++++++++++---------
  1 file changed, 413 insertions(+), 84 deletions(-)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 34d2aa1..3e35938 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -26,9 +26,13 @@
  .TH FILESYSTEMS 5 2014-01-15 "Linux" "Linux Programmer's Manual"
  .nh
  .SH NAME
-filesystems \- Linux filesystem types: minix, ext, ext2, ext3, ext4,=20
Reiserfs,
-XFS, JFS, xia, msdos,
-umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
+filesystems \- Linux filesystem types: adfs, afs, affs, befs, bfs, btrfs=
,
+ceph, cifs, coda, coherent, configfs, cramfs, debugfs, devpts, dlmfs,
+ecryptfs, efivarfs, exofs, ext, ext2, ext3, ext4, f2fs, fat, gfs2, hfs,
+hfsplus, hpfs, iso9660, jfs, logfs, minix, msdos, ncpfs, nfs, nilfs2, nt=
fs,
+ocfs2, omfs, pohmelfs, proc, qnx6, ramfs, reiserfs, romfs, smbfs, spufs,
+squashfs, sysfs, sysv, tmpfs, ubifs, udf, ufs, umsdos, v9fs, vfat, usbfs=
,
+xenix, xfs, xiafs
  .SH DESCRIPTION
  When, as is customary, the
  .B proc
@@ -42,20 +46,150 @@ see
  for more details.
  If you need a currently unsupported filesystem, insert the correspondin=
g
  module or recompile the kernel.
-
  In order to use a filesystem, you have to
  .I mount
  it; see
  .BR mount (8).
-
-Below a short description of a few of the available filesystems.
+.sp
+Below a short description of the available or historically available
+filesystems in Linux kernel. See kernel documentation for a comprehensiv=
e
+description of all options and limitations.
  .TP 10
-.B "minix"
-is the filesystem used in the Minix operating system, the first to run
-under Linux.
-It has a number of shortcomings, including a 64MB partition size
-limit, short filenames, and a single timestamp.
-It remains useful for floppies and RAM disks.
+.B adfs
+is the Acorn Advanced Disc Filing System, the standard filesystem of the
+RiscOS operating system which runs on Acorn's ARM-based Risc PC systems =
and
+the Acorn Archimedes range of machines, that was integrated into Linux i=
n
+kernel 2.1.
+.TP
+.B afs
+is the distributed AFS (Andrew File System) fs. It is under development =
and
+does not yet provide the full feature set. It does not yet support pioct=
l()
+system call.
+.TP
+.B affs
+is the Amiga Fast File System (AFFS) used on hard disks by Amiga(tm)=20
systems
+since AmigaOS Version 1.3 (34.20), that was integrated into Linux in ker=
nel
+2.1. It supports six flavors of the file system and
+.B muFS
+(multi user File System) equivalents:
+.RS
+.TP
+.B DOS\[rs]0
+The old or original filesystem, not really suited for hard disks and=20
normally
+not used on them, either. Supported read/write.
+.TP
+.B DOS\[rs]1
+The original Fast File System. Supported read/write.
+.TP
+.B DOS\[rs]2
+The old "international" filesystem. International means that a bug has
+been fixed so that accented ("international") letters in file names are
+case-insensitive, as they ought to be. Supported read/write.
+.TP
+.B DOS\[rs]3
+The "international" Fast File System. Supported read/write.
+.TP
+.B DOS\[rs]4
+The original filesystem with directory cache. The directory cache speeds
+up directory accesses on floppies considerably, but slows down file
+creation/deletion. Doesn't make much sense on hard disks. Supported=20
read only.
+.TP
+.B DOS\[rs]5
+The Fast File System with directory cache. Supported read only.
+.RE
+
+.TP
+.B befs
+is the journaling filesystem of BeOS. It's alpha version (read-only).
+
+.TP
+.B bfs
+is the SCO UnixWare Boot Filesystem (read-only), that was integrated=20
into Linux in kernel
+2.3.25.
+
+.TP
+.B btrfs
+is a copy on write filesystem for Linux aimed at implementing advanced
+features while focusing on fault tolerance, repair and easy administrati=
on.
+Initially developed by Oracle,
+.B btrfs
+is licensed under the GPL and open for contribution from anyone.
+
+.TP
+.B ceph
+is the Ceph Distributed File System.
+.B ceph
+is a distributed network file system designed to provide good performanc=
e,
+reliability, and scalability.
+
+.TP
+.B cifs
+is the Common Internet File System (CIFS) protocol which is the=20
successor to
+.BR smbfs ,
+the Server Message Block (SMB) protocol, the native file sharing=20
mechanism for
+most early PC operating systems.
+
+.TP
+.B coda
+is the Coda Distributed File System, historically implemented in a BSD f=
ile
+system in Mach 2.6.
+
+.TP
+.B coherent
+See
+.BR sysfs .
+
+.TP
+.B configfs
+is a ram-based filesystem that provides the converse of sysfs's=20
functionality.
+Where sysfs is a filesystem-based view of kernel objects,
+.B configfs
+is a filesystem-based manager of kernel objects, or config_items.
+
+.TP
+.B cramfs
+is a filesystem onto a small ROM.
+.B cramfs
+is designed to be simple and small, and to compress things well.
+
+.TP
+.B debugfs
+is a simple way for kernel developers to make any information available =
to
+user space, specially for debugging purpose. See also
+.BR proc " and " sysfs .
+
+.TP
+.B devpts
+is an interface to pseudo terminal (pty) devices. It is typically=20
mounted at
+.IR /dev/pts .
+See
+.BR pty (7).
+
+.TP
+.B dlmfs
+is the userspace interface to the OCFS2 DLM.
+
+.TP
+.B ecryptfs
+is a stacked cryptographic filesystem for Linux, currently undergoing
+development.
+
+.TP
+.B efivarfs
+is a (U)EFI variable filesystem. The
+.B efivarfs
+filesystem was created to address the shortcomings of using entries in=20
sysfs
+to maintain EFI variables.
+
+.TP
+.B exofs
+is a file system that uses an OSD and exports the API of a normal Linux
+file system. Users access
+.B exofs
+like any other local file system, and
+.B exofs
+will in turn issue commands to the local OSD initiator.
+
  .TP
  .B ext
  is an elaborate extension of the
@@ -65,78 +199,73 @@ It has been completely superseded by the second vers=
ion
  of the extended filesystem
  .RB ( ext2 )
  and has been removed from the kernel (in 2.1.21).
+
  .TP
  .B ext2
  is the high performance disk filesystem used by Linux for fixed disks
  as well as removable media.
  The second extended filesystem was designed as an extension of the
  extended filesystem
-.RB ( ext ).
+.RB ( ext ),
+originally released in January 1993.
  .B ext2
  offers the best performance (in terms of speed and CPU usage) of
-the filesystems supported under Linux.
+the filesystems supported under Linux (see
+.BR ext2 (5)).
+
  .TP
  .B ext3
-is a journaling version of the ext2 filesystem.
+is a journaling version of the
+.B ext2
+filesystem, originally released in September 1999 for the 2.2 branch, an=
d
+ported to 2.4 Linux kernels.
  It is easy to
-switch back and forth between ext2 and ext3.
+switch back and forth between
+.BR ext2 " and " ext3 (see
+.BR ext3 (5)).
+
  .TP
  .B ext4
-is a set of upgrades to ext3 including substantial performance and
+is a set of upgrades to
+.B ext3
+including substantial performance and
  reliability enhancements,
-plus large increases in volume, file, and directory size limits.
-.TP
-.B Reiserfs
-is a journaling filesystem, designed by Hans Reiser,
-that was integrated into Linux in kernel 2.4.1.
-.TP
-.B XFS
-is a journaling filesystem, developed by SGI,
-that was integrated into Linux in kernel 2.4.20.
-.TP
-.B JFS
-is a journaling filesystem, developed by IBM,
-that was integrated into Linux in kernel 2.4.24.
+plus large increases in volume, file, and directory size limits (64=20
bit) (see
+.BR ext4 (5)).
+
  .TP
-.B xiafs
-was designed and implemented to be a stable, safe filesystem by
-extending the Minix filesystem code.
-It provides the basic most
-requested features without undue complexity.
-The
-.B xia
-filesystem is no longer actively developed or maintained.
-It was removed from the kernel in 2.1.21.
+.B f2fs
+is the Flash-Friendly File System (F2FS), a file system exploiting NAND=20
flash
+memory-based storage devices, which is based on Log-structured File Syst=
em
+(LFS). The design has been focused on addressing the fundamental issues =
in
+LFS, which are snowball effect of wandering tree and high cleaning=20
overhead.
+
  .TP
-.B msdos
-is the filesystem used by DOS, Windows, and some OS/2 computers.
-.B msdos
-filenames can be no longer than 8 characters, followed by an
-optional period and 3 character extension.
+.B fat
+is the File Allocation Table (FAT), a filesystem originally designed in=20
1977
+for use on floppy disks for DOS and Windows 9x.
+.B fat
+is not a separate filesystem, but a common part of the
+.BR msdos ", " umsdos " and " vfat
+filesystems.
  .TP
-.B umsdos
-is an extended DOS filesystem used by Linux.
-It adds capability for
-long filenames, UID/GID, POSIX permissions, and special files
-(devices, named pipes, etc.)  under the DOS filesystem, without
-sacrificing compatibility with DOS.
+.B gfs2
+is the Global File System 2, a cluster file system, that was integrated=20
into
+Linux in kernel 2.6.19.
+
  .TP
-.B vfat
-is an extended DOS filesystem used by Microsoft Windows95 and Windows NT=
.
-VFAT adds the capability to use long filenames under the MSDOS filesyste=
m.
+.B hfs
+is the Macintosh Hierarchical File System filesystem (HFS). It's the
+filesystem used by the Mac Plus and all later Macintosh models.
+
  .TP
-.B ntfs
-replaces Microsoft Window's FAT filesystems (VFAT, FAT32).
-It has reliability, performance, and space-utilization enhancements
-plus features like ACLs, journaling, encryption, and so on.
+.B hfsplus
+is the extended version of HFS filesystem first introduced in MacOS 8.1.
+
  .TP
-.B proc
-is a pseudo filesystem which is used as an interface to kernel data
-structures rather than reading and interpreting
-.IR /dev/kmem .
-In particular, its files do not take disk space.
-See
-.BR proc (5).
+.B hpfs
+is the High Performance Filesystem, used in OS/2. This filesystem is=20
read-only
+under Linux due to the lack of available documentation.
  .TP
  .B iso9660
  is a CD-ROM filesystem type conforming to the ISO 9660 standard.
@@ -160,41 +289,241 @@ It is automatically recognized within the
  .B iso9660
  filesystem support under Linux.
  .RE
+
  .TP
-.B hpfs
-is the High Performance Filesystem, used in OS/2.
-This filesystem is
-read-only under Linux due to the lack of available documentation.
+.B jfs
+is the IBM's Journaled File System (JFS), a journaling filesystem,=20
developed
+by IBM, that was integrated into Linux in kernel 2.4.24.
+
  .TP
-.B sysv
-is an implementation of the SystemV/Coherent filesystem for Linux.
-It implements all of Xenix FS, SystemV/386 FS, and Coherent FS.
+.B logfs
+is the LogFS Flash Filesystem, a Linux log-structured and scalable flash
+file system, intended for use on large devices of flash memory, that was
+integrated into Linux in kernel 2.6.34.
+
  .TP
-.B nfs
-is the network filesystem used to access disks located on remote compute=
rs.
+.B minix
+is the filesystem used in the Minix operating system, the first to run
+under Linux.
+It has a number of shortcomings, including a 64MB partition size
+limit, short filenames, and a single timestamp.
+It remains useful for floppies and RAM disks.
+
  .TP
-.B smb
-is a network filesystem that supports the SMB protocol, used by
-Windows for Workgroups, Windows NT, and Lan Manager.
-.sp
-To use
-.B smb
-fs, you need a special mount program, which can be found in the ksmbfs
-package, found at
-.UR ftp://sunsite.unc.edu\:/pub\:/Linux\:/system\:/Filesystems\:/smbfs
-.UE .
+.B msdos
+is the filesystem used by DOS, Windows, and some OS/2 computers.
+.B msdos
+filenames can be no longer than 8 characters, followed by an
+optional period and 3 character extension.
+
  .TP
  .B ncpfs
  is a network filesystem that supports the NCP protocol, used by
-Novell NetWare.
+Novell NetWare (tm).
  .sp
  To use
  .BR ncpfs ,
  you need special programs, which can be found at
  .UR ftp://linux01.gwdg.de\:/pub\:/ncpfs
  .UE .
+
+.TP
+.B nfs
+is the Network FileSystem (NFS) used to access disks located on remote
+computers. There are four major versions of this filesystem. The NFS=20
version
+2 protocol was first documented in RFC1094 (March 1989). Since then two=20
more
+major releases of NFS have been published, with NFSv3 being documented i=
n
+RFC1813 (June 1995), and NFSv4 in RFC3530 (April 2003).
+.sp
+The Linux NFS client currently supports all the above published versions=
,
+and work is in progress on adding support for minor version 1 of the NFS=
v4
+protocol.
+
+.TP
+.B nilfs2
+is a log-structured file system (LFS) supporting continuous=20
snapshotting. In
+addition to versioning capability of the entire file system, users can e=
ven
+restore files mistakenly overwritten or destroyed just a few seconds ago=
.
+Since NILFS2 can keep consistency like conventional LFS, it achieves qui=
ck
+recovery after system crashes.
+
+.TP
+.B ntfs
+is the New Technology File System (NTFS), the successor of Microsoft
+Window's FAT filesystems since Windows NT. It has reliability, performan=
ce,
+and space-utilization enhancements plus features like ACLs, journaling,
+encryption, and so on.
+
+.TP
+.B ocfs2
+is the Oracle Cluster File System 2 (OCFS2), is a general purpose=20
extent based
+shared disk cluster file system with many similarities to
+.BR ext3 .
+It supports 64 bit inode numbers, and has automatically extending metada=
ta
+groups which may also make it attractive for non-clustered use.
+
+.TP
+.B omfs
+is the Optimized MPEG Filesystem (OMFS), a filesystem created by=20
SonicBlue for
+use in the ReplayTV DVR and Rio Karma MP3 player.
+
+.TP
+.B pohmelfs
+is the Parallel Optimized Host Message Exchange Layered File System
+(POHMELFS), a distributed network filesystem of Elliptics which supports
+multiple copies, automatic recovery, read load balancing, quorum write a=
nd
+many other features.
+
+.TP
+.B proc
+is a pseudo filesystem which is used as an interface to kernel data
+structures rather than reading and interpreting
+.IR /dev/kmem .
+In particular, its files do not take disk space.
+See
+.BR proc (5).
+
+.TP
+.B qnx6
+is the QNX6 Filesystem, the filesystem used by QNX operating systems.=20
It got
+introduced in QNX 6.4.0 and is used default since 6.4.1.
+
+.TP
+.B ramfs
+is the the 'in memory' filesystems
+.BR ramfs ", " rootfs " and " initramfs .
+.B ramfs
+is a very simple filesystem that exports Linux's disk caching=20
mechanisms (the
+page cache and dentry cache) as a dynamically resizable RAM-based=20
filesystem.
+
+.TP
+.B reiserfs
+is a journaling filesystem, designed by Hans Reiser,
+that was integrated into Linux in kernel 2.4.1.
+
+.TP
+.B romfs
+is the Rom FileSystem, a quite dumb, read only filesystem, mainly for=20
initial
+RAM disks of installation disks.
+
+.TP
+.B smbfs
+is a network filesystem that supports the Server Message Block (SMB)=20
protocol,
+used by Windows for Workgroups, Windows NT, and Lan Manager.
+.sp
+To use
+.BR smbfs ,
+you need a special mount program, which can be found in the ksmbfs
+package, found at
+.UR ftp://sunsite.unc.edu\:/pub\:/Linux\:/system\:/Filesystems\:/smbfs
+.UE .
+
+.TP
+.B spufs
+is the SPU file system, a filesystem used on PowerPC machines that=20
implement
+the Cell Broadband Engine Architecture in order to access Synergistic
+Processor Units (SPUs).
+
+.TP
+.B squashfs
+is a compressed read-only file system for Linux.
+.B squashfs
+is intended for general read-only filesystem use, for archival use and i=
n
+constrained block device/memory systems (e.g. embedded systems) where lo=
w
+overhead is needed.
+
+.TP
+.B sysfs
+is the a ram-based filesystem initially based on
+.BR ramfs .
+It provides a means to export kernel data structures, their attributes, =
and
+the linkages between them to userspace.
+
+.TP
+.B sysv
+is an implementation of the SystemV/V7/Xenix/Coherent filesystem for Lin=
ux.
+It implements all of Xenix FS, SystemV/386 FS, and Coherent FS.
+
+.TP
+.B tmpfs
+is a Linux file system which keeps all files in virtual memory.=20
Everything in
+.B tmpfs
+is temporary in the sense that no files will be created on your hard
+drive. If you unmount a
+.B tmpfs
+instance, everything stored therein is lost.
+
+.TP
+.B ubifs
+is the Unsorted Block Images FileSystem (UBIFS), a flash file system.
+
+.TP
+.B udf
+is the Universal Disk Format (UDF), a format designed for incremental
+writing on optical discs.
+
+.TP
+.B ufs
+is the Unix File System (UFS) used by many Unix and Unix-like operating
+systems. It is a distant descendant of the original filesystem used by=20
Version
+7 Unix. Features of some implementations are undocumented, so its hard t=
o
+recognize type of ufs automatically.
+
+.TP
+.B umsdos
+is an extended DOS filesystem used by Linux. It adds capability for long
+filenames, UID/GID, POSIX permissions, and special files (devices, named
+pipes, etc.) under the DOS filesystem, without sacrificing=20
compatibility with
+DOS.
+
+.TP
+.B usbfs
+is the USB Device Filesystem, an obsolete filesystem for USB key.
+
+.TP
+.B vfat
+is an extended DOS filesystem used by Microsoft Windows95 and Windows NT=
.
+.B vfat
+adds the capability to use long filenames under the MSDOS filesystem.
+
+.TP
+.B v9fs
+is a Unix implementation of the Plan 9 9p remote filesystem protocol
+originally developed by Ron Minnich and Maya Gokhale, that was=20
integrated into
+Linux in kernel 2.6.14. Normal plan9 servers will work with
+.BR v9fs ,
+but for
+folks looking for a Linux-based server we have moved towards support the
+.BR npfs / spfs
+libraries and applications.
+
+.TP
+.B xenix
+See
+.BR sysfs .
+
+.TP
+.B xfs
+is a 64-bit journaling filesystem, developed by Silicon Graphics, Inc=20
(SGI) in
+1993, that was integrated into Linux in kernel 2.4.20. It was the=20
default file
+system in the SGI's IRIX operating system starting with its version 5.3
+
+.TP
+.B xiafs
+was designed and implemented to be a stable, safe filesystem by
+extending the Minix filesystem code.
+It provides the basic most
+requested features without undue complexity.
+.B xiafs
+is no longer actively developed or maintained.
+It was removed from the kernel in 2.1.21.
+
  .SH SEE ALSO
+.BR ext2 (5),
+.BR ext3 (5),
+.BR ext4 (5),
  .BR proc (5),
+.BR pty (7),
  .BR fsck (8),
  .BR mkfs (8),
  .BR mount (8)
--=20
2.1.4

--=20
St=C3=A9phane Aulery
