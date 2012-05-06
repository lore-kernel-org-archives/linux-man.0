From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], stat(2): One table too wide for line length; use text
 blocks
Date: Sun, 6 May 2012 20:06:19 +0000
Message-ID: <20120506200619.GA1037@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Package: man-pages
Version: 3.40
Severity: minor
Tags: patch

  From "groff -ww" (or "man --warnings=w ..."):

warning: around line 442: table wider than line width

  GNU man uses line length of 78.

  Use text blocks.  Two spaces between sentences or better: start
each sentence in a new line.

  Patch:

--- stat.2	2012-04-26 22:58:36.000000000 +0000
+++ stat.2.new	2012-05-06 02:10:05.000000000 +0000
@@ -239,10 +239,10 @@
 FIFO (named pipe)?
 .TP
 .BR S_ISLNK (m)
-symbolic link? (Not in POSIX.1-1996.)
+symbolic link?  (Not in POSIX.1-1996.)
 .TP
 .BR S_ISSOCK (m)
-socket? (Not in POSIX.1-1996.)
+socket?  (Not in POSIX.1-1996.)
 .RE
 .PP
 The following flags are defined for the
@@ -438,16 +438,18 @@
 l l l l l.
 hex	name	ls	octal	description
 f000	S_IFMT		170000	mask for file type
-0000			000000	SCO out-of-service inode; BSD unknown
-				type; SVID-v2 and XPG2 have both
-				0 and 0100000 for ordinary file
+0000			000000	T{
+SCO out-of-service inode; BSD unknown type; SVID-v2 and XPG2
+have both 0 and 0100000 for ordinary file
+T}
 1000	S_IFIFO	p|	010000	FIFO (named pipe)
 2000	S_IFCHR	c	020000	character special (V7)
 3000	S_IFMPC		030000	multiplexed character special (V7)
 4000	S_IFDIR	d/	040000	directory (V7)
-5000	S_IFNAM		050000	XENIX named special file
-				with two subtypes, distinguished by
-				\fIst_rdev\fP values 1, 2
+5000	S_IFNAM		050000	T{
+XENIX named special file with two subtypes, distinguished by
+\fIst_rdev\fP values 1, 2
+T}
 0001	S_INSEM	s	000001	XENIX semaphore subtype of IFNAM
 0002	S_INSHD	m	000002	XENIX shared data subtype of IFNAM
 6000	S_IFBLK	b	060000	block special (V7)
@@ -456,26 +458,33 @@
 9000	S_IFCMP		110000	VxFS compressed
 9000	S_IFNWK	n	110000	network special (HP-UX)
 a000	S_IFLNK	l@	120000	symbolic link (BSD)
-b000	S_IFSHAD		130000	Solaris shadow inode for ACL
-				(not seen by userspace)
+b000	S_IFSHAD		130000	T{
+Solaris shadow inode for ACL (not seen by userspace)
+T}
 c000	S_IFSOCK	s=	140000	socket (BSD; also "S_IFSOC" on VxFS)
 d000	S_IFDOOR	D>	150000	Solaris door
 e000	S_IFWHT	w%	160000	BSD whiteout (not used for inode)
-0200	S_ISVTX		001000	sticky bit: save swapped text even
-				after use (V7)
-				reserved (SVID-v2)
-				On nondirectories: don't cache this
-				file (SunOS)
-				On directories: restricted deletion
-				flag (SVID-v4.2)
-0400	S_ISGID		002000	set-group-ID on execution (V7)
-				for directories: use BSD semantics for
-				propagation of GID
-0400	S_ENFMT		002000	System V file locking enforcement (shared
-				with S_ISGID)
+0200	S_ISVTX		001000	T{
+sticky bit: save swapped text even after use (V7)
+.br
+reserved (SVID-v2)
+.br
+On nondirectories: don't cache this file (SunOS)
+.br
+On directories: restricted deletion flag (SVID-v4.2)
+T}
+0400	S_ISGID		002000	T{
+set-group-ID on execution (V7)
+.br
+for directories: use BSD semantics for propagation of GID
+T}
+0400	S_ENFMT		002000	T{
+System V file locking enforcement (shared with S_ISGID)
+T}
 0800	S_ISUID		004000	set-user-ID on execution (V7)
-0800	S_CDF		004000	directory is a context dependent
-				file (HP-UX)
+0800	S_CDF		004000	T{
+directory is a context dependent file (HP-UX)
+T}
 .TE
 
 A sticky command appeared in Version 32V AT&T UNIX.

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
