From: Sami Kerola <kerolasa-X3B1VOXEql0@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=5D=2033=20files=3A=20use=20UR=20macro=20where=20applicable?=
Date: Sun,  5 Aug 2012 10:08:48 +0200
Message-ID: <1344154128-24241-1-git-send-email-kerolasa@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sami Kerola <kerolasa-X3B1VOXEql0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The .UR http://example.com paired with .UE will create links which one
can interact, if pager allows that.  One way to see the effct is ask
man command to use browser display e.g., man -H man7/uri.7

Signed-off-by: Sami Kerola <kerolasa-X3B1VOXEql0@public.gmane.org>
---
 man2/capget.2              |  5 +++--
 man2/futex.2               |  8 +++++---
 man2/sched_setscheduler.2  |  5 +++--
 man2/spu_create.2          |  5 +++--
 man2/spu_run.2             |  5 +++--
 man2/vfork.2               |  6 ++++--
 man3/getnameinfo.3         |  8 +++++---
 man3/netlink.3             |  7 +++++--
 man4/cciss.4               |  5 +++--
 man4/console_codes.4       |  8 +++++---
 man4/dsp56k.4              |  5 +++--
 man4/hpsa.4                |  8 +++++---
 man4/sk98lin.4             | 10 +++++++---
 man5/filesystems.5         |  8 +++++---
 man5/protocols.5           |  5 +++--
 man7/aio.7                 |  5 +++--
 man7/capabilities.7        |  8 +++++---
 man7/charsets.7            |  6 ++++--
 man7/feature_test_macros.7 |  6 ++++--
 man7/futex.7               |  5 +++--
 man7/hier.7                |  6 ++++--
 man7/iso_8859-16.7         |  5 +++--
 man7/iso_8859-2.7          |  5 +++--
 man7/koi8-r.7              |  5 +++--
 man7/libc.7                |  5 +++--
 man7/man.7                 |  8 +++++---
 man7/netlink.7             | 16 +++++++++-------
 man7/numa.7                |  5 +++--
 man7/standards.7           | 21 ++++++++++++++-------
 man7/unicode.7             | 15 ++++++++++-----
 man7/units.7               | 10 +++++-----
 man7/uri.7                 | 31 ++++++++++++++++++-------------
 man7/x25.7                 |  5 +++--
 33 files changed, 164 insertions(+), 101 deletions(-)

diff --git a/man2/capget.2 b/man2/capget.2
index 76608b5..408e910 100644
--- a/man2/capget.2
+++ b/man2/capget.2
@@ -8,7 +8,7 @@
 .\"     64-bit capability sets in kernel 2.6.2[45].
 .\" Modified 2009-01-26, andi kleen
 .\"
-.TH CAPGET 2 2010-09-20 "Linux" "Linux Programmer's Manual"
+.TH CAPGET 2 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 capget, capset \- set/get capabilities of thread(s)
 .SH SYNOPSIS
@@ -215,7 +215,8 @@ functions is provided by the
 .I libcap
 library and is available here:
 .br
-http://www.kernel.org/pub/linux/libs/security/linux-privs
+.UR http://www.kernel.org\:/pub\:/linux\:/libs\:/security\:/linux-priv=
s
+.UE
 .SH "SEE ALSO"
 .BR clone (2),
 .BR gettid (2),
diff --git a/man2/futex.2 b/man2/futex.2
index 1fdb71f..0235cbc 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -14,7 +14,7 @@
 .\" material in the kernel source file Documentation/pi-futex.txt.
 .\" 2.6.25 adds FUTEX_WAKE_BITSET, FUTEX_WAIT_BITSET
 .\"
-.TH FUTEX 2 2010-08-29 "Linux" "Linux Programmer's Manual"
+.TH FUTEX 2 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 futex \- Fast Userspace Locking system call
 .SH SYNOPSIS
@@ -266,8 +266,10 @@ read the sources of the futex userspace library re=
ferenced below.
 \fIFuss, Futexes and Furwocks: Fast Userlevel Locking in Linux\fP
 (proceedings of the Ottawa Linux Symposium 2002), online at
 .br
-http://kernel.org/doc/ols/2002/ols2002-pages-479-495.pdf
+.UR http://kernel.org\:/doc\:/ols\:/2002\:/ols2002-pages-479-495.pdf
+.UE
 .PP
 Futex example library, futex-*.tar.bz2 at
 .br
-ftp://ftp.nl.kernel.org/pub/linux/kernel/people/rusty/.
+.UR ftp://ftp.nl.kernel.org\:/pub\:/linux\:/kernel\:/people\:/rusty/
+.UE
diff --git a/man2/sched_setscheduler.2 b/man2/sched_setscheduler.2
index 863fc50..436320d 100644
--- a/man2/sched_setscheduler.2
+++ b/man2/sched_setscheduler.2
@@ -44,7 +44,7 @@
 .\"
 .\" Worth looking at: http://rt.wiki.kernel.org/index.php
 .\"
-.TH SCHED_SETSCHEDULER 2 2011-09-19 "Linux" "Linux Programmer's Manual=
"
+.TH SCHED_SETSCHEDULER 2 2012-08-05 "Linux" "Linux Programmer's Manual=
"
 .SH NAME
 sched_setscheduler, sched_getscheduler \-
 set and get scheduling policy/parameters
@@ -485,7 +485,8 @@ patch-\fIkernelversion\fP-rt\fIpatchversion\fP
 .in
 .PP
 and can be downloaded from
-.IR http://www.kernel.org/pub/linux/kernel/projects/rt/ .
+.UR http://www.kernel.org\:/pub\:/linux\:/kernel\:/projects\:/rt/
+.UE .
=20
 Without the patches and prior to their full inclusion into the mainlin=
e
 kernel, the kernel configuration offers only the three preemption clas=
ses
diff --git a/man2/spu_create.2 b/man2/spu_create.2
index a47f4d5..a7f3200 100644
--- a/man2/spu_create.2
+++ b/man2/spu_create.2
@@ -21,7 +21,7 @@
 .\" 2007-07-10, some polishing by mtk
 .\" 2007-09-28, updates for newer kernels by Jeremy Kerr <jk-mnsaURCQ41tQFI55V6+gNQ@public.gmane.org=
g>
 .\"
-.TH SPU_CREATE 2 2012-07-13 Linux "Linux Programmer's Manual"
+.TH SPU_CREATE 2 2012-08-05 Linux "Linux Programmer's Manual"
 .SH NAME
 spu_create \- create a new spu context
 .SH SYNOPSIS
@@ -258,7 +258,8 @@ Note however, that
 is meant to be used from libraries that implement a more abstract
 interface to SPUs, not to be used from regular applications.
 See
-.I http://www.bsc.es/projects/deepcomputing/linuxoncell/
+.UR http://www.bsc.es\:/projects\:/deepcomputing\:/linuxoncell/
+.UE
 for the recommended libraries.
 .SH EXAMPLE
 See
diff --git a/man2/spu_run.2 b/man2/spu_run.2
index c3ec295..5536b75 100644
--- a/man2/spu_run.2
+++ b/man2/spu_run.2
@@ -22,7 +22,7 @@
 .\" 2007-09-28, updates for newer kernels, added example
 .\"             by Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
 .\"
-.TH SPU_RUN 2 2012-07-13 Linux "Linux Programmer's Manual"
+.TH SPU_RUN 2 2012-08-05 Linux "Linux Programmer's Manual"
 .SH NAME
 spu_run \- execute an SPU context
 .SH SYNOPSIS
@@ -200,7 +200,8 @@ Note however, that
 is meant to be used from libraries that implement a more abstract
 interface to SPUs, not to be used from regular applications.
 See
-.I http://www.bsc.es/projects/deepcomputing/linuxoncell/
+.UR http://www.bsc.es\:/projects\:/deepcomputing\:/linuxoncell/
+.UE
 for the recommended libraries.
 .SH EXAMPLE
 The following is an example of running a simple, one-instruction SPU
diff --git a/man2/vfork.2 b/man2/vfork.2
index 94d25f8..e485645 100644
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -23,7 +23,7 @@
 .\" 1999-11-10: Merged text taken from the page contributed by
 .\" Reed H. Petty (rhp-VSgbLoB6MtCsTnJN9+BGXg@public.gmane.org)
 .\"
-.TH VFORK 2 2012-02-08 "Linux" "Linux Programmer's Manual"
+.TH VFORK 2 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 vfork \- create a child process and block parent
 .SH SYNOPSIS
@@ -239,7 +239,9 @@ system call appeared in 3.0BSD.
 In 4.4BSD it was made synonymous to
 .BR fork (2)
 but NetBSD introduced it again,
-cf. http://www.netbsd.org/Documentation/kernel/vfork.html .
+cf.
+.UR http://www.netbsd.org\:/Documentation\:/kernel\:/vfork.html
+.UE .
 In Linux, it has been equivalent to
 .BR fork (2)
 until 2.2.0-pre6 or so.
diff --git a/man3/getnameinfo.3 b/man3/getnameinfo.3
index 576c497..fd5df7c 100644
--- a/man3/getnameinfo.3
+++ b/man3/getnameinfo.3
@@ -4,7 +4,7 @@
 .\" 2004-12-14, mtk, Added EAI_OVERFLOW error
 .\" 2004-12-14 Fixed description of error return
 .\"
-.TH GETNAMEINFO 3 2009-12-03 "GNU" "Linux Programmer's Manual"
+.TH GETNAMEINFO 3 2012-08-05 "GNU" "Linux Programmer's Manual"
 .SH NAME
 getnameinfo \- address-to-name translation in protocol-independent man=
ner
 .SH SYNOPSIS
@@ -292,11 +292,13 @@ RFC\ 2553, March 1999.
 Tatsuya Jinmei and Atsushi Onoe,
 .IR "An Extension of Format for IPv6 Scoped Addresses" ,
 internet draft, work in progress.
-ftp://ftp.ietf.org/internet\-drafts/draft\-ietf\-ipngwg\-scopedaddr\-f=
ormat\-02.txt
+.UR ftp://ftp.ietf.org\:/internet\-drafts\:/draft\-ietf\-ipngwg\-scope=
daddr\-format\-02.txt
+.UE
 .LP
 Craig Metz,
 .IR "Protocol Independence Using the Sockets API" ,
 Proceedings of the freenix track:
 2000 USENIX annual technical conference, June 2000.
 .ad l
-http://www.usenix.org/publications/library/proceedings/usenix2000/free=
nix/metzprotocol.html
+.UR http://www.usenix.org\:/publications\:/library\:/proceedings\:/use=
nix2000\:/freenix\:/metzprotocol.html
+.UE
diff --git a/man3/netlink.3 b/man3/netlink.3
index 2725ae2..771fb8b 100644
--- a/man3/netlink.3
+++ b/man3/netlink.3
@@ -1,7 +1,7 @@
 .\" This manpage copyright 1998 by Andi Kleen. Subject to the GPL.
 .\" Based on the original comments from Alexey Kuznetsov
 .\" $Id: netlink.3,v 1.1 1999/05/14 17:17:24 freitag Exp $
-.TH NETLINK 3 1999-05-14 "GNU" "Linux Programmer's Manual"
+.TH NETLINK 3 2012-08-05 "GNU" "Linux Programmer's Manual"
 .SH NAME
 netlink \- Netlink macros
 .SH SYNOPSIS
@@ -88,4 +88,7 @@ than via the low-level kernel interface.
 .SH "SEE ALSO"
 .BR netlink (7)
 .br
-and ftp://ftp.inr.ac.ru/ip-routing/iproute2* for libnetlink
+and
+.UR ftp://ftp.inr.ac.ru\:/ip-routing\:/iproute2*
+.UE
+for libnetlink
diff --git a/man4/cciss.4 b/man4/cciss.4
index 5b2ce35..e35c8c1 100644
--- a/man4/cciss.4
+++ b/man4/cciss.4
@@ -4,7 +4,7 @@
 .\"
 .\" shorthand for double quote that works everywhere.
 .ds q \N'34'
-.TH CCISS 4  2011-09-21 "Linux" "Linux Programmer's Manual"
+.TH CCISS 4 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 cciss \- HP Smart Array block driver
 .SH SYNOPSIS
@@ -351,7 +351,8 @@ for example) before I/O can proceed again to a tape=
 drive that was reset.
 .BR hpsa (4),
 .BR hpacucli (8),
 .BR hpacuxe (8),
-.IR http://cciss.sf.net ,
+.UR http://cciss.sf.net
+.UE ,
 and the Linux kernel source files
 .I Documentation/blockdev/cciss.txt
 and
diff --git a/man4/console_codes.4 b/man4/console_codes.4
index c069069..8e147d3 100644
--- a/man4/console_codes.4
+++ b/man4/console_codes.4
@@ -18,7 +18,7 @@
 .\"
 .\" 2006-05-27, Several corrections - Thomas E. Dickey
 .\"
-.TH CONSOLE_CODES 4 2011-09-15 "Linux" "Linux Programmer's Manual"
+.TH CONSOLE_CODES 4 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 console_codes \- Linux console escape and control sequences
 .SH DESCRIPTION
@@ -587,7 +587,8 @@ That document, though terse, is much longer than th=
is manual page.
 For a chronological overview,
 .PP
 .in +4n
-http://invisible-island.net/xterm/xterm.log.html
+.UR http://invisible-island.net\:/xterm\:/xterm.log.html
+.UE
 .in
 .PP
 details changes to xterm.
@@ -595,7 +596,8 @@ details changes to xterm.
 The \fIvttest\fP program
 .PP
 .in +4n
-http://invisible-island.net/vttest/
+.UR http://invisible-island.net\:/vttest/
+.UE
 .in
 .PP
 demonstrates many of these control sequences.
diff --git a/man4/dsp56k.4 b/man4/dsp56k.4
index 0ecd71d..bfece8f 100644
--- a/man4/dsp56k.4
+++ b/man4/dsp56k.4
@@ -23,7 +23,7 @@
 .\"
 .\" Modified, Thu Jan 27 19:16:19 CET 2000, lars-zgYzP9v7iJcdnm+yROfE0A@public.gmane.org
 .\"
-.TH DSP56K 4 2000-03-01 "Linux" "Linux Programmer's Manual"
+.TH DSP56K 4 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 dsp56k \- DSP56001 interface device
 .SH SYNOPSIS
@@ -114,5 +114,6 @@ user-defined command handled by the program running=
 in the DSP56001.
 .SH "SEE ALSO"
 .IR linux/include/asm-m68k/dsp56k.h ,
 .IR linux/drivers/char/dsp56k.c ,
-.IR http://dsp56k.nocrew.org/ ,
+.UR http://dsp56k.nocrew.org/
+.UE ,
 DSP56000/DSP56001 Digital Signal Processor User's Manual
diff --git a/man4/hpsa.4 b/man4/hpsa.4
index fd3fffe..5f849af 100644
--- a/man4/hpsa.4
+++ b/man4/hpsa.4
@@ -4,7 +4,7 @@
 .\"
 .\" shorthand for double quote that works everywhere.
 .ds q \N'34'
-.TH HPSA 4  2011-09-21 "Linux" "Linux Programmer's Manual"
+.TH HPSA 4 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 hpsa \- HP Smart Array SCSI driver
 .SH SYNOPSIS
@@ -172,7 +172,8 @@ SNMP storage agents, etc.
 See
 .I cciss_vol_status
 at
-.I http://cciss.sf.net
+.UR http://cciss.sf.net
+.UE
 for some examples.
 .SH "SEE ALSO"
 .BR cciss (4),
@@ -181,7 +182,8 @@ for some examples.
 .BR cciss_vol_status (8),
 .BR hpacucli (8),
 .BR hpacuxe (8),
-.IR http://cciss.sf.net ,
+.UR http://cciss.sf.net
+.UE ,
 and the Linux kernel source files
 .I Documentation/scsi/hpsa.txt
 and
diff --git a/man4/sk98lin.4 b/man4/sk98lin.4
index a6d49de..e120ece 100644
--- a/man4/sk98lin.4
+++ b/man4/sk98lin.4
@@ -22,7 +22,7 @@
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =
02111,
 .\" USA.
 .\"
-.TH SK98LIN 4 2012-05-10 "Linux" "Linux Programmer's Manual"
+.TH SK98LIN 4 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sk98lin \- Marvell/SysKonnect Gigabit Ethernet driver v6.21
 .SH SYNOPSIS
@@ -153,11 +153,15 @@ Those features are only available after installat=
ion of open source modules
 which can be found on the Internet:
=20
 .IR VLAN \c
-: http://www.candelatech.com/~greear/vlan.html
+:
+.UR http://www.candelatech.com\:/~greear\:/vlan.html
+.UE
 .br
 .I Link
 .IR Aggregation \c
-: http://www.st.rim.or.jp/~yumo
+:
+.UR http://www.st.rim.or.jp\:/~yumo
+.UE
=20
 .br
 Note that Marvell/SysKonnect does not offer any support for these
diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 3d6de35..f2f4ca0 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -22,7 +22,7 @@
 .\"
 .\" 2007-12-14 mtk Added Reiserfs, XFS, JFS.
 .\"
-.TH FILESYSTEMS 5 2010-05-24 "Linux" "Linux Programmer's Manual"
+.TH FILESYSTEMS 5 2012-08-05 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
 filesystems \- Linux file-system types: minix, ext, ext2, ext3, ext4, =
Reiserfs,
@@ -177,7 +177,8 @@ To use
 .B smb
 fs, you need a special mount program, which can be found in the ksmbfs
 package, found at
-.IR ftp://sunsite.unc.edu/pub/Linux/system/Filesystems/smbfs .
+.UR ftp://sunsite.unc.edu\:/pub\:/Linux\:/system\:/Filesystems\:/smbfs
+.UE .
 .TP
 .B ncpfs
 is a network file system that supports the NCP protocol, used by
@@ -186,7 +187,8 @@ Novell NetWare.
 To use
 .BR ncpfs ,
 you need special programs, which can be found at
-.IR ftp://linux01.gwdg.de/pub/ncpfs .
+.UR ftp://linux01.gwdg.de\:/pub\:/ncpfs
+.UE .
 .SH "SEE ALSO"
 .BR proc (5),
 .BR fsck (8),
diff --git a/man5/protocols.5 b/man5/protocols.5
index 9c644f7..708caf7 100644
--- a/man5/protocols.5
+++ b/man5/protocols.5
@@ -25,7 +25,7 @@
 .\" 2002-09-22  Seth W. Klein  <sk-NPt7MJ34UWc+2B1zFQUDpg@public.gmane.org>
 .\"     * protocol numbers are now assigned by the IANA
 .\"
-.TH PROTOCOLS 5 2008-09-23 "Linux" "Linux Programmer's Manual"
+.TH PROTOCOLS 5 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 protocols \- protocols definition file
 .SH DESCRIPTION
@@ -80,4 +80,5 @@ The protocols definition file.
 .SH "SEE ALSO"
 .BR getprotoent (3)
=20
-http://www.iana.org/assignments/protocol-numbers
+.UR http://www.iana.org\:/assignments\:/protocol-numbers
+.UE
diff --git a/man7/aio.7 b/man7/aio.7
index f45d822..37562c1 100644
--- a/man7/aio.7
+++ b/man7/aio.7
@@ -21,7 +21,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied b=
y
 .\" the source, must acknowledge the copyright and authors of this wor=
k.
 .\"
-.TH AIO 7  2010-10-02 "Linux" "Linux Programmer's Manual"
+.TH AIO 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 aio \- POSIX asynchronous I/O overview
 .SH DESCRIPTION
@@ -456,4 +456,5 @@ main(int argc, char *argv[])
 .BR aio_return (3),
 .BR aio_write (3),
 .BR lio_listio (3),
-http://www.squid-cache.org/~adrian/Reprint-Pulavarty-OLS2003.pdf
+.UR http://www.squid-cache.org\:/~adrian\:/Reprint-Pulavarty-OLS2003.p=
df
+.UE
diff --git a/man7/capabilities.7 b/man7/capabilities.7
index caae733..61290ff 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -43,7 +43,7 @@
 .\"     other capabilities where the permitted or inheritable bit is s=
et.
 .\" 2011-09-07, mtk/Serge hallyn: Add CAP_SYSLOG
 .\"
-.TH CAPABILITIES 7 2012-07-18 "Linux" "Linux Programmer's Manual"
+.TH CAPABILITIES 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 capabilities \- overview of Linux capabilities
 .SH DESCRIPTION
@@ -1009,7 +1009,8 @@ prctl(PR_SET_SECUREBITS,
 .PP
 No standards govern capabilities, but the Linux capability implementat=
ion
 is based on the withdrawn POSIX.1e draft standard; see
-.IR http://wt.xpilot.org/publications/posix.1e/ .
+.UR http://wt.xpilot.org\:/publications\:/posix.1e/
+.UE .
 .SH NOTES
 Since kernel 2.5.27, capabilities are an optional kernel component,
 and can be enabled/disabled via the CONFIG_SECURITY_CAPABILITIES
@@ -1037,7 +1038,8 @@ and
 programs.
 It can be found at
 .br
-.IR http://www.kernel.org/pub/linux/libs/security/linux-privs .
+.UR http://www.kernel.org\:/pub\:/linux\:/libs\:/security\:/linux-priv=
s
+.UE .
=20
 Before kernel 2.6.24, and since kernel 2.6.24 if
 file capabilities are not enabled, a thread with the
diff --git a/man7/charsets.7 b/man7/charsets.7
index 3446cf7..8703cad 100644
--- a/man7/charsets.7
+++ b/man7/charsets.7
@@ -10,7 +10,7 @@
 .\" research by esr.  Portions derive from a writeup by Roman Czyborra=
=2E
 .\"
 .\" Last changed by David Starner <dstarner98-RXPF2eSzNizNLxjTenLetw@public.gmane.org>.
-.TH CHARSETS 7 2008-06-03 "Linux" "Linux Programmer's Manual"
+.TH CHARSETS 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 charsets \- programmer's view of character sets and internationalizati=
on
 .SH DESCRIPTION
@@ -229,7 +229,9 @@ integers, Unicode is usually encoded as 32-bit inte=
gers internally and
 either a series of 16-bit integers (UTF-16) (needing two 16-bit intege=
rs
 only when encoding certain rare characters) or a series of 8-bit bytes
 (UTF-8).
-Information on Unicode is available at <http://www.unicode.org>.
+Information on Unicode is available at
+.UR http://www.unicode.org
+.UE .
 .LP
 Linux represents Unicode using the 8-bit Unicode Transformation Format
 (UTF-8).
diff --git a/man7/feature_test_macros.7 b/man7/feature_test_macros.7
index c2bd747..135fa05 100644
--- a/man7/feature_test_macros.7
+++ b/man7/feature_test_macros.7
@@ -22,7 +22,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied b=
y
 .\" the source, must acknowledge the copyright and authors of this wor=
k.
 .\"
-.TH FEATURE_TEST_MACROS 7 2012-01-18 "Linux" "Linux Programmer's Manua=
l"
+.TH FEATURE_TEST_MACROS 7 2012-08-05 "Linux" "Linux Programmer's Manua=
l"
 .SH NAME
 feature_test_macros \- feature test macros
 .SH SYNOPSIS
@@ -223,7 +223,9 @@ This macro is recognized since glibc 2.16.
 Expose definitions for the alternative API specified by the
 LFS (Large File Summit) as a "transitional extension" to the
 Single UNIX Specification.
-(See http://opengroup.org/platform/lfs.html.)
+(See
+.UR http:\:/\:/opengroup.org\:/platform\:/lfs.html
+.UE )
 The alternative API consists of a set of new objects
 (i.e., functions and types) whose names are suffixed with "64"
 (e.g.,
diff --git a/man7/futex.7 b/man7/futex.7
index 241fee2..bafa141 100644
--- a/man7/futex.7
+++ b/man7/futex.7
@@ -5,7 +5,7 @@
 .\" <http://shell.ipoline.com/~elmert/comp/docbook2X/>
 .\" Please send any bug reports, improvements, comments, patches,
 .\" etc. to Steve Cheng <steve-FBZVco61RlBptKb40tBPwA@public.gmane.org>.
-.TH FUTEX 7 2002-12-31 "Linux" "Linux Programmer's Manual"
+.TH FUTEX 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 futex \- Fast Userspace Locking
 .SH SYNOPSIS
@@ -115,4 +115,5 @@ primitives: it is by no means the only one.
 .IR "Fuss, Futexes and Furwocks: Fast Userlevel Locking in Linux"
 (proceedings of the Ottawa Linux Symposium 2002),
 futex example library, futex-*.tar.bz2
-<ftp://ftp.kernel.org/pub/linux/kernel/people/rusty/>.
+.UR ftp://ftp.kernel.org\:/pub\:/linux\:/kernel\:/people\:/rusty/
+.UE .
diff --git a/man7/hier.7 b/man7/hier.7
index 8acfbfe..08bbea2 100644
--- a/man7/hier.7
+++ b/man7/hier.7
@@ -26,7 +26,7 @@
 .\" Modified Mon Feb  6 16:41:00 1999 by Nicol=E1s Lichtmaier <nick@de=
bian.org>
 .\" Modified Tue Feb  8 16:46:45 2000 by Chris Pepper <pepper-ISOD1lX8EAA@public.gmane.org>
 .\" Modified Fri Sep  7 20:32:45 2001 by Tammy Fox <tfox-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
-.TH HIER 7  2009-03-30 "Linux" "Linux Programmer's Manual"
+.TH HIER 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 hier \- Description of the file system hierarchy
 .SH DESCRIPTION
@@ -490,7 +490,9 @@ this directory holds temporary files stored for an =
unspecified duration.
 .I /var/yp
 Database files for NIS.
 .SH "CONFORMING TO"
-The Filesystem Hierarchy Standard, Version 2.2 <http://www.pathname.co=
m/fhs/>.
+The Filesystem Hierarchy Standard, Version 2.2
+.UR http://www.pathname.com\:/fhs/
+.UE .
 .SH BUGS
 This list is not exhaustive; different systems may be configured
 differently.
diff --git a/man7/iso_8859-16.7 b/man7/iso_8859-16.7
index f73c561..db6e509 100644
--- a/man7/iso_8859-16.7
+++ b/man7/iso_8859-16.7
@@ -21,7 +21,7 @@
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =
02111,
 .\" USA.
 .\"
-.TH ISO_8859-16 7 2003-03-05 "Linux" "Linux Programmer's Manual"
+.TH ISO_8859-16 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
 iso_8859-16 \- ISO 8859-16 character set encoded in octal, decimal,
@@ -175,4 +175,5 @@ _
 .P
 Additional information:
 .I ISO 8859-16 (Latin 10) Resources
-(http://bucovina.chem.tue.nl/fonturi/index-en.html).
+.UR http://bucovina.chem.tue.nl\:/fonturi\:/index-en.html
+.UE .
diff --git a/man7/iso_8859-2.7 b/man7/iso_8859-2.7
index 1f9fbff..f3b609e 100644
--- a/man7/iso_8859-2.7
+++ b/man7/iso_8859-2.7
@@ -24,7 +24,7 @@
 .\"
 .\" Slightly rearranged, aeb, 950713
 .\" Updated, dpo, 990531
-.TH ISO_8859-2 7 2007-11-25 "Linux" "Linux Programmer's Manual"
+.TH ISO_8859-2 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
 iso_8859-2 \- ISO 8859-2 character set encoded in octal, decimal,
@@ -177,4 +177,5 @@ _
 .P
 Additional information:
 .I ISO 8859-2 (Latin 2) Resources
-(http://sizif.mf.uni-lj.si/linux/cee/iso8859-2.html).
+.UR http://sizif.mf.uni-lj.si\:/linux\:/cee\:/iso8859-2.html
+.UE .
diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
index 1036621..a758e03 100644
--- a/man7/koi8-r.7
+++ b/man7/koi8-r.7
@@ -22,7 +22,7 @@
 .\" License along with this manual; if not, write to the Free
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =
02111,
 .\" USA.
-.TH KOI8-R 7 2010-10-24 "Linux" "Linux Programmer's Manual"
+.TH KOI8-R 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
 koi8-r \- Russian character set encoded in octal, decimal, and
@@ -192,4 +192,5 @@ _
 .BR iso-8859-5 (7),
 .BR koi8-u (7),
 RFC\ 1489,
-http://koi8.pp.ru/
+.UR http://koi8.pp.ru/
+.UE
diff --git a/man7/libc.7 b/man7/libc.7
index 747f8b9..15ecbf2 100644
--- a/man7/libc.7
+++ b/man7/libc.7
@@ -21,7 +21,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied b=
y
 .\" the source, must acknowledge the copyright and authors of this wor=
k.
 .\"
-.TH LIBC 7 2009-01-13 "Linux" "Linux Programmer's Manual"
+.TH LIBC 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 libc \- Overview of standard C libraries on Linux
 .SH DESCRIPTION
@@ -33,7 +33,8 @@ Because of some history (see below), use of the term =
"libc"
 to refer to the standard C library is somewhat ambiguous on Linux.
 .SS glibc
 By far the most widely used C library on Linux is the GNU C Library
-.RI ( http://www.gnu.org/software/libc/ ),
+.UR http://www.gnu.org\:/software\:/libc/
+.UE ,
 often referred to as
 .IR glibc .
 This is the C library that is nowadays used in all
diff --git a/man7/man.7 b/man7/man.7
index f928de3..f4d642b 100644
--- a/man7/man.7
+++ b/man7/man.7
@@ -29,7 +29,7 @@
 .\" Modified Tue Jul 27 20:12:02 2004 by Colin Watson <cjwatson@debian=
=2Eorg>
 .\" 2007-05-30, mtk: various rewrites and moved much text to new man-p=
ages.7.
 .\"
-.TH MAN 7 2011-10-05 "Linux" "Linux Programmer's Manual"
+.TH MAN 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 man \- macros to format man pages
 .SH SYNOPSIS
@@ -483,8 +483,10 @@ You can also use the new
 .B URL
 macro to identify links to related information.
 If you include URLs, use the full URL
-(e.g., <http://www.kernelnotes.org>) to ensure that tools
-can automatically find the URLs.
+(e.g.,
+.UR http://www.kernelnotes.org
+.UE )
+to ensure that tools can automatically find the URLs.
 .PP
 Tools processing these files should open the file and examine the firs=
t
 nonwhitespace character.
diff --git a/man7/netlink.7 b/man7/netlink.7
index 35016a2..9fd470f 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -4,7 +4,7 @@
 .\" Based on the original comments from Alexey Kuznetsov
 .\" Modified 2005-12-27 by Hasso Tepper <hasso-262Luud3QqmzQB+pC5nmwQ@public.gmane.org>
 .\" $Id: netlink.7,v 1.8 2000/06/22 13:23:00 ak Exp $
-.TH NETLINK  7 2012-07-28 "Linux" "Linux Programmer's Manual"
+.TH NETLINK  7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 netlink \- Communication between kernel and userspace (AF_NETLINK)
 .SH SYNOPSIS
@@ -467,10 +467,12 @@ for (nh =3D (struct nlmsghdr *) buf; NLMSG_OK (nh=
, len);
 .BR capabilities (7),
 .BR rtnetlink (7)
 .PP
-ftp://ftp.inr.ac.ru/ip-routing/iproute2*
-for information about libnetlink.
-
-http://people.suug.ch/~tgr/libnl/
-for information about libnl.
-
+.UR ftp://ftp.inr.ac.ru\:/ip-routing\:/iproute2*
+information about libnetlink
+.UE
+.br
+.UR http://people.suug.ch\:/~tgr\:/libnl/
+information about libnl
+.UE
+.br
 RFC 3549 "Linux Netlink as an IP Services Protocol"
diff --git a/man7/numa.7 b/man7/numa.7
index 64af9a8..8356f98 100644
--- a/man7/numa.7
+++ b/man7/numa.7
@@ -24,7 +24,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied b=
y
 .\" the source, must acknowledge the copyright and authors of this wor=
k.
 .\"
-.TH NUMA 7 2008-08-15 "Linux" "Linux Programmer's Manual"
+.TH NUMA 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 numa \- overview of Non-Uniform Memory Architecture
 .SH DESCRIPTION
@@ -169,7 +169,8 @@ package is recommended.
 The
 .I numactl
 package is available at
-.IR ftp://oss.sgi.com/www/projects/libnuma/download/ .
+.UR ftp://oss.sgi.com\:/www\:/projects\:/libnuma\:/download/
+.UE .
 The package is also included in some Linux distributions.
 Some distributions include the development library and header
 in the separate
diff --git a/man7/standards.7 b/man7/standards.7
index 73f736c..e1dcb88 100644
--- a/man7/standards.7
+++ b/man7/standards.7
@@ -22,7 +22,7 @@
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =
02111,
 .\" USA.
 .\"
-.TH STANDARDS 7 2009-06-01 "Linux" "Linux Programmer's Manual"
+.TH STANDARDS 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 standards \- C and UNIX Standards
 .SH DESCRIPTION
@@ -84,7 +84,9 @@ and is considered the definitive System V release.
 .TP
 .B SVID 4
 System V Interface Definition version 4, issued in 1995.
-Available online at http://www.sco.com/developers/devspecs/ .
+Available online at
+.UR http://www.sco.com\:/developers\:/devspecs/
+.UE .
 .TP
 .B C89
 This was the first C language standard, ratified by ANSI
@@ -104,7 +106,8 @@ and is thus occasionally referred to as
 This revision of the C language standard was ratified by ISO in 1999
 .RI ( "ISO/IEC 9899:1999" ).
 Available online at
-http://www.open-std.org/jtc1/sc22/wg14/www/standards.
+.UR http://www.open-std.org\:/jtc1\:/sc22\:/wg14\:/www\:/standards
+.UE .
 .TP
 .B POSIX.1-1990
 "Portable Operating System Interface for Computing Environments".
@@ -171,15 +174,18 @@ This standard appeared in 1997.
 Systems conforming to this standard can be branded
 .IR "UNIX 98" .
 See also
-http://www.UNIX-systems.org/version2/ .)
+.UR http://www.UNIX-systems.org\:/version2/
+.UE .)
 .TP
 .B POSIX.1-2001, SUSv3
 This was a 2001 revision and consolidation of the
 POSIX.1, POSIX.2, and SUS standards into a single document,
 conducted under the auspices of the Austin group
-(http://www.opengroup.org/austin/ .)
+.UR http://www.opengroup.org\:/austin/
+.UE .
 The standard is available online at
-http://www.unix-systems.org/version3/ ,
+.UR http://www.unix-systems.org\:/version3/
+.UE ,
 and the interfaces that it describes are also available in the Linux
 manual pages package under sections 1p and 3p (e.g., "man 3p open").
=20
@@ -249,7 +255,8 @@ lists POSIX.1-2001, it can be assumed that the inte=
rface also
 conforms to POSIX.1-2008, unless otherwise noted.
=20
 Further information can be found on the Austin group web site,
-http://www.opengroup.org/austin/ .
+.UR http://www.opengroup.org\:/austin/
+.UE .
 .SH "SEE ALSO"
 .BR feature_test_macros (7),
 .BR libc (7),
diff --git a/man7/unicode.7 b/man7/unicode.7
index 2f6a916..b353c4e 100644
--- a/man7/unicode.7
+++ b/man7/unicode.7
@@ -27,7 +27,7 @@
 .\" 2001-05-11  Markus Kuhn <mgk25-kDbDZe0LBGWFxr2TtlUqVg@public.gmane.org>
 .\"      Update
 .\"
-.TH UNICODE 7 2001-05-11 "GNU" "Linux Programmer's Manual"
+.TH UNICODE 7 2012-08-05 "GNU" "Linux Programmer's Manual"
 .SH NAME
 Unicode \- universal character set
 .SH DESCRIPTION
@@ -244,7 +244,9 @@ for Standardization, Geneva, 2000.
=20
 This is the official specification of
 .BR UCS .
-Available as a PDF file on CD-ROM from http://www.iso.ch/.
+Available as a PDF file on CD-ROM from
+.UR http://www.iso.ch/
+.UE .
 .TP
 *
 The Unicode Standard, Version 3.0.
@@ -265,13 +267,15 @@ which improved wide and multibyte character suppo=
rt even further.
 *
 Unicode Technical Reports.
 .RS
-http://www.unicode.org/unicode/reports/
+.UR http://www.unicode.org\:/unicode\:/reports/
+.UE
 .RE
 .TP
 *
 Markus Kuhn: UTF-8 and Unicode FAQ for UNIX/Linux.
 .RS
-http://www.cl.cam.ac.uk/~mgk25/unicode.html
+.UR http://www.cl.cam.ac.uk\:/~mgk25\:/unicode.html
+.UE
=20
 Provides subscription information for the
 .I linux-utf8
@@ -282,7 +286,8 @@ Unicode under Linux.
 *
 Bruno Haible: Unicode HOWTO.
 .RS
-ftp://ftp.ilog.fr/pub/Users/haible/utf8/Unicode-HOWTO.html
+.UR ftp://ftp.ilog.fr\:/pub\:/Users\:/haible\:/utf8\:/Unicode-HOWTO.ht=
ml
+.UE
 .RE
 .SH BUGS
 When this man page was last revised, the GNU C Library support for
diff --git a/man7/units.7 b/man7/units.7
index 87e7fb6..f4889ee 100644
--- a/man7/units.7
+++ b/man7/units.7
@@ -21,7 +21,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied b=
y
 .\" the source, must acknowledge the copyright and authors of this wor=
k.
 .\"
-.TH UNITS 7 2001-12-22 "Linux" "Linux Programmer's Manual"
+.TH UNITS 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 units, kilo, kibi, mega, mebi, giga, gibi \- decimal and binary prefix=
es
 .SH DESCRIPTION
@@ -61,7 +61,8 @@ in an ASCII context where this Greek letter is not av=
ailable.
 See also
 .sp
 .RS
-http://physics.nist.gov/cuu/Units/prefixes.html
+.UR http://physics.nist.gov\:/cuu\:/Units\:/prefixes.html
+.UE
 .RE
 .SS Binary prefixes
 The binary prefixes resemble the decimal ones,
@@ -85,9 +86,8 @@ Ei	exbi	2^60 =3D 1152921504606846976
=20
 See also
 .sp
-.RS
-http://physics.nist.gov/cuu/Units/binary.html
-.RE
+.UR http://physics.nist.gov\:/cuu\:/Units\:/binary.html
+.UE
 .SS Discussion
 Before these binary prefixes were introduced, it was fairly
 common to use k=3D1000 and K=3D1024, just like b=3Dbit, B=3Dbyte.
diff --git a/man7/uri.7 b/man7/uri.7
index 087632a..9e7d7f7 100644
--- a/man7/uri.7
+++ b/man7/uri.7
@@ -44,7 +44,7 @@
 .\" Modified Fri Aug 21 23:00:00 1999 by David A. Wheeler (dwheeler@dw=
heeler.com)
 .\" Modified Tue Mar 14 2000 by David A. Wheeler (dwheeler-OyCmK+MLziTQFizaE/u3fw@public.gmane.org=
m)
 .\"
-.TH URI 7 2000-03-14 "Linux" "Linux Programmer's Manual"
+.TH URI 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 uri, url, urn \- uniform resource identifier (URI), including a URL or=
 URN
 .SH SYNOPSIS
@@ -170,7 +170,9 @@ may be too long to store as a URI, so they use a di=
fferent
 interaction mechanism (called POST) which does
 not include the data in the URI.
 See the Common Gateway Interface specification at
-<http://www.w3.org/CGI> for more information.
+.UR http://www.w3.org\:/CGI
+.UE
+for more information.
 .PP
 .B "ftp \- File Transfer Protocol (FTP)"
 .PP
@@ -238,7 +240,7 @@ An example is <news:comp.lang.ada>.
 A
 .I message-id
 corresponds to the Message-ID of
-.UR http://www.ietf.org/rfc/rfc1036.txt
+.UR http://www.ietf.org\:/rfc\:/rfc1036.txt
 IETF RFC\ 1036,
 .UE
 without the enclosing "<"
@@ -378,7 +380,7 @@ Lightweight Directory Access Protocol (LDAP), a pro=
tocol for querying
 a set of servers for hierarchically organized information
 (such as people and computing resources).
 See
-.UR http://www.ietf.org/rfc/rfc2255.txt
+.UR http://www.ietf.org\:/rfc\:/rfc2255.txt
 RFC\ 2255
 .UE
 for more information on the LDAP URL scheme.
@@ -391,7 +393,7 @@ If empty, the client determines which the LDAP serv=
er to use.
 .IP dn
 the LDAP Distinguished Name, which identifies
 the base object of the LDAP search (see
-.UR http://www.ietf.org/rfc/rfc2253.txt
+.UR http://www.ietf.org\:/rfc\:/rfc2253.txt
 RFC\ 2253
 .UE
 section 3).
@@ -409,7 +411,7 @@ specifies the search filter (subset of entries
 to return).
 If omitted, all entries should be returned.
 See
-.UR http://www.ietf.org/rfc/rfc2254.txt
+.UR http://www.ietf.org\:/rfc\:/rfc2254.txt
 RFC\ 2254
 .UE
 section 4.
@@ -451,7 +453,7 @@ ldap://host.com:6666/o=3DUniversity%20of%20Michigan=
,c=3DUS??sub?(cn=3DBabs%20Jensen)
 .PP
 This scheme designates a WAIS database, search, or document
 (see
-.UR http://www.ietf.org/rfc/rfc1625.txt
+.UR http://www.ietf.org\:/rfc\:/rfc1625.txt
 IETF RFC\ 1625
 .UE
 for more information on WAIS).
@@ -551,7 +553,8 @@ This latter system, called the 'new' or 'logical' q=
uoting system by
 is preferred practice in Great Britain and hackers worldwide
 (see the
 Jargon File's section on Hacker Writing Style,
-.IR http://www.fwi.uva.nl/~mes/jargon/h/HackerWritingStyle.html ,
+.UR http://www.fwi.uva.nl\:/~mes\:/jargon\:/h\:/HackerWritingStyle.htm=
l
+.UE ,
 for more information).
 Older documents suggested inserting the prefix "URL:"
 just before the URI, but this form has never caught on.
@@ -579,10 +582,12 @@ Don't use abbreviated URIs as hypertext links ins=
ide a document;
 use the standard format as described here.
 .SH "CONFORMING TO"
 .PP
-.I http://www.ietf.org/rfc/rfc2396.txt
-(IETF RFC\ 2396),
-.I http://www.w3.org/TR/REC-html40
-(HTML 4.0).
+.UR http://www.ietf.org\:/rfc\:/rfc2396.txt
+(IETF RFC\ 2396)
+.UE ,
+.UR http://www.w3.org\:/TR\:/REC-html40
+(HTML 4.0)
+.UE .
 .SH NOTES
 Any tool accepting URIs (e.g., a web browser) on a Linux system should
 be able to handle (directly or indirectly) all of the
@@ -702,6 +707,6 @@ tools) and invokes the right tool for any URI.
 .BR man2html (1),
 .BR mailaddr (7),
 .BR utf-8 (7),
-.UR http://www.ietf.org/rfc/rfc2255.txt
+.UR http://www.ietf.org\:/rfc\:/rfc2255.txt
 IETF RFC\ 2255
 .UE
diff --git a/man7/x25.7 b/man7/x25.7
index 6baca72..acf2478 100644
--- a/man7/x25.7
+++ b/man7/x25.7
@@ -4,7 +4,7 @@
 .\" and in case of nontrivial modification author and date
 .\" of the modification is added to the header.
 .\" $Id: x25.7,v 1.4 1999/05/18 10:35:12 freitag Exp $
-.TH X25 7 2012-05-10 "Linux" "Linux Programmer's Manual"
+.TH X25 7 2012-08-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 x25 \- ITU-T X.25 / ISO-8208 protocol interface.
 .SH SYNOPSIS
@@ -118,5 +118,6 @@ Jonathan Simon Naylor:
 \(lqThe Re-Analysis and Re-Implementation of X.25.\(rq
 The URL is
 .RS
-.I ftp://ftp.pspt.fi/pub/ham/linux/ax25/x25doc.tgz
+.UR ftp://ftp.pspt.fi\:/pub\:/ham\:/linux\:/ax25\:/x25doc.tgz
+.UE
 .RE
--=20
1.7.11.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
