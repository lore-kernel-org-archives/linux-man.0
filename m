From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/5] ffix in SEE ALSO
Date: Sun, 23 Sep 2012 16:34:58 -0400
Message-ID: <1348432502-26050-1-git-send-email-taffit@debian.org>
References: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ@mail.gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Consistency fix in the SEE ALSO section containing other documents than
man-pages.
---
 man2/arch_prctl.2             |    2 +-
 man2/fcntl.2                  |    9 ++++-----
 man2/flock.2                  |    5 ++---
 man2/futex.2                  |    6 ++----
 man2/get_robust_list.2        |    2 +-
 man2/getpriority.2            |    4 ++--
 man2/ioprio_set.2             |    5 +++--
 man2/migrate_pages.2          |    6 +++---
 man2/mmap.2                   |    2 +-
 man2/mremap.2                 |    6 +++---
 man2/msync.2                  |    2 +-
 man2/sched_get_priority_max.2 |    2 +-
 man2/sched_rr_get_interval.2  |    4 ++--
 man2/sched_setparam.2         |    2 +-
 man2/sched_setscheduler.2     |    6 +++---
 man2/sched_yield.2            |    2 +-
 man2/select.2                 |    4 ++--
 man2/socket.2                 |    8 ++++----
 man2/subpage_prot.2           |    6 +++---
 man2/unshare.2                |    5 +++--
 man3/btree.3                  |   12 ++++++------
 man3/cmsg.3                   |    2 +-
 man3/dbopen.3                 |    4 ++--
 man3/dl_iterate_phdr.3        |    6 +++---
 man3/dlopen.3                 |    3 ++-
 man3/getnameinfo.3            |   12 ++++++------
 man3/hash.3                   |    8 ++++----
 man3/lockf.3                  |    7 +++----
 man3/netlink.3                |    1 -
 man3/recno.3                  |    4 ++--
 man3/rpc.3                    |    2 +-
 man3/xdr.3                    |    4 ++--
 man4/cciss.4                  |    8 +++++---
 man4/console_ioctl.4          |    3 ++-
 man4/cpuid.4                  |    6 +++---
 man4/hpsa.4                   |    8 +++++---
 man4/initrd.4                 |    4 ++--
 man4/msr.4                    |    2 +-
 man4/rtc.4                    |    5 +++--
 man4/st.4                     |    4 ++--
 man5/elf.5                    |   21 ++++++++++-----------
 man5/hosts.5                  |    3 ++-
 man5/protocols.5              |    2 +-
 man5/services.5               |    2 +-
 man5/tzfile.5                 |    6 +++---
 man7/aio.7                    |    3 ++-
 man7/arp.7                    |   10 +++++-----
 man7/capabilities.7           |    2 +-
 man7/cpuset.7                 |    4 ++--
 man7/feature_test_macros.7    |    6 +++---
 man7/futex.7                  |    4 ++--
 man7/hier.7                   |    2 +-
 man7/icmp.7                   |    4 ++--
 man7/inotify.7                |    5 +++--
 man7/ip.7                     |    8 ++++----
 man7/ipv6.7                   |   10 +++++-----
 man7/iso_8859-16.7            |    5 ++---
 man7/iso_8859-2.7             |    5 ++---
 man7/koi8-r.7                 |    3 ++-
 man7/mailaddr.7               |    2 +-
 man7/math_error.7             |    2 +-
 man7/netlink.7                |    2 +-
 man7/packet.7                 |   12 ++++++------
 man7/pthreads.7               |    5 ++---
 man7/raw.7                    |    8 ++++----
 man7/regex.7                  |    4 ++--
 man7/spufs.7                  |    3 ++-
 man7/tcp.7                    |   16 ++++++++--------
 man7/udplite.7                |    2 +-
 man7/uri.7                    |    3 ++-
 man7/x25.7                    |    7 ++-----
 71 files changed, 183 insertions(+), 181 deletions(-)

diff --git a/man2/arch_prctl.2 b/man2/arch_prctl.2
index 94c45e2..4bea033 100644
--- a/man2/arch_prctl.2
+++ b/man2/arch_prctl.2
@@ -139,5 +139,5 @@ may be already used by the threading library.
 .BR modify_ldt (2),
 .BR prctl (2),
 .BR set_thread_area (2)
-.sp
+.br
 AMD X86-64 Programmer's manual
diff --git a/man2/fcntl.2 b/man2/fcntl.2
index 3905636..fa19821 100644
--- a/man2/fcntl.2
+++ b/man2/fcntl.2
@@ -1302,17 +1302,16 @@ It is therefore inadvisable to rely on mandatory locking.
 .BR lockf (3),
 .BR capabilities (7),
 .BR feature_test_macros (7)
-.P
-See also
+.br
 .IR locks.txt ,
 .IR mandatory-locking.txt ,
 and
 .I dnotify.txt
 in the kernel source directory
-.IR Documentation/filesystems/ .
-(On older kernels, these files are directly under the
+.I Documentation/filesystems/
+(on older kernels, these files are directly under the
 .I Documentation/
 directory, and
 .I mandatory-locking.txt
 is called
-.IR mandatory.txt .)
+.IR mandatory.txt )
diff --git a/man2/flock.2 b/man2/flock.2
index 5a1314f..0cee04c 100644
--- a/man2/flock.2
+++ b/man2/flock.2
@@ -205,9 +205,8 @@ and occurs on many other implementations.)
 .BR fork (2),
 .BR open (2),
 .BR lockf (3)
-
-See also
+.br
 .I Documentation/filesystem/locks.txt
 in the kernel source
 .RI ( Documentation/locks.txt
-in older kernels).
+in older kernels)
diff --git a/man2/futex.2 b/man2/futex.2
index fe69f2d..80da33a 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -275,14 +275,12 @@ read the sources of the futex userspace library referenced below.
 .\" This page written by bert hubert.
 .SH "SEE ALSO"
 .BR futex (7)
-.PP
+.br
 \fIFuss, Futexes and Furwocks: Fast Userlevel Locking in Linux\fP
 (proceedings of the Ottawa Linux Symposium 2002), online at
-.br
 .UR http://kernel.org\:/doc\:/ols\:/2002\:/ols2002-pages-479-495.pdf
 .UE
-.PP
-Futex example library, futex-*.tar.bz2 at
 .br
+Futex example library, futex-*.tar.bz2 at
 .UR ftp://ftp.nl.kernel.org\:/pub\:/linux\:/kernel\:/people\:/rusty/
 .UE
diff --git a/man2/get_robust_list.2 b/man2/get_robust_list.2
index 7af71ef..80df5f0 100644
--- a/man2/get_robust_list.2
+++ b/man2/get_robust_list.2
@@ -130,5 +130,5 @@ to use this functionality should use the robust mutexes provided by glibc.
 The kernel source files
 .IR Documentation/robust-futexes.txt
 and
-.IR Documentation/robust-futex-ABI.txt .
+.I Documentation/robust-futex-ABI.txt
 .\" http://lwn.net/Articles/172149/
diff --git a/man2/getpriority.2 b/man2/getpriority.2
index 36d2415..2fec421 100644
--- a/man2/getpriority.2
+++ b/man2/getpriority.2
@@ -225,6 +225,6 @@ defined in
 .BR renice (1),
 .BR fork (2),
 .BR capabilities (7)
-.sp
+.br
 .I Documentation/scheduler/sched-nice-design.txt
-in the kernel source tree (since Linux 2.6.23).
+in the kernel source tree (since Linux 2.6.23)
diff --git a/man2/ioprio_set.2 b/man2/ioprio_set.2
index ce42182..bfb478c 100644
--- a/man2/ioprio_set.2
+++ b/man2/ioprio_set.2
@@ -348,5 +348,6 @@ Suitable definitions can be found in
 .BR getpriority (2),
 .BR open (2),
 .BR capabilities (7)
-.sp
-Documentation/block/ioprio.txt in the kernel source tree.
+.br
+.I Documentation/block/ioprio.txt
+in the kernel source tree
diff --git a/man2/migrate_pages.2 b/man2/migrate_pages.2
index 9c7416e..f0ded0d 100644
--- a/man2/migrate_pages.2
+++ b/man2/migrate_pages.2
@@ -153,7 +153,7 @@ or a similar package.
 .BR cpuset (7),
 .BR numa (7),
 .BR migratepages (8),
-.BR numa_stat (8);
+.BR numa_stat (8)
 .br
-the kernel source file
-.IR Documentation/vm/page_migration .
+The kernel source file
+.IR Documentation/vm/page_migration
diff --git a/man2/mmap.2 b/man2/mmap.2
index ac1717f..73cff96 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -664,7 +664,7 @@ main(int argc, char *argv[])
 .BR shm_open (3),
 .BR shm_overview (7)
 .br
-B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128-129 and 389-391.
+B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128-129 and 389-391
 .\"
 .\" Repeat after me: private read-only mappings are 100% equivalent to
 .\" shared read-only mappings. No ifs, buts, or maybes. -- Linus
diff --git a/man2/mremap.2 b/man2/mremap.2
index e38ce80..11bab34 100644
--- a/man2/mremap.2
+++ b/man2/mremap.2
@@ -206,8 +206,8 @@ argument.
 .BR sbrk (2),
 .BR malloc (3),
 .BR realloc (3)
-.P
-Your favorite OS text book for more information on paged memory.
+.br
+Your favorite OS text book for more information on paged memory
 (\fIModern Operating Systems\fP by Andrew S. Tanenbaum,
 \fIInside Linux\fP by Randolf Bentson,
-\fIThe Design of the UNIX Operating System\fP by Maurice J. Bach.)
+\fIThe Design of the UNIX Operating System\fP by Maurice J. Bach)
diff --git a/man2/msync.2 b/man2/msync.2
index 772cf35..b87e5bf 100644
--- a/man2/msync.2
+++ b/man2/msync.2
@@ -118,4 +118,4 @@ are defined in \fI<unistd.h>\fP to a value greater than 0.
 .SH "SEE ALSO"
 .BR mmap (2)
 .br
-B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128-129 and 389-391.
+B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128-129 and 389-391
diff --git a/man2/sched_get_priority_max.2 b/man2/sched_get_priority_max.2
index d5bc300..dcbb7be 100644
--- a/man2/sched_get_priority_max.2
+++ b/man2/sched_get_priority_max.2
@@ -107,6 +107,6 @@ POSIX.1-2001.
 .BR sched_setaffinity (2),
 .BR sched_setparam (2),
 .BR sched_setscheduler (2)
-.PP
+.br
 .I Programming for the real world \- POSIX.4
 by Bill O. Gallmeister, O'Reilly & Associates, Inc., ISBN 1-56592-074-0
diff --git a/man2/sched_rr_get_interval.2 b/man2/sched_rr_get_interval.2
index 7ac9cf1..8415d54 100644
--- a/man2/sched_rr_get_interval.2
+++ b/man2/sched_rr_get_interval.2
@@ -125,7 +125,7 @@ quantum cannot be modified.
 .\" properly.
 .SH "SEE ALSO"
 .BR sched_setscheduler (2)
-has a description of the Linux scheduling scheme.
-.PP
+has a description of the Linux scheduling scheme
+.br
 .I Programming for the real world \- POSIX.4
 by Bill O. Gallmeister, O'Reilly & Associates, Inc., ISBN 1-56592-074-0
diff --git a/man2/sched_setparam.2 b/man2/sched_setparam.2
index 0757513..b8fcd7b 100644
--- a/man2/sched_setparam.2
+++ b/man2/sched_setparam.2
@@ -121,6 +121,6 @@ POSIX.1-2001.
 .BR sched_setscheduler (2),
 .BR setpriority (2),
 .BR capabilities (7)
-.PP
+.br
 .I Programming for the real world \- POSIX.4
 by Bill O. Gallmeister, O'Reilly & Associates, Inc., ISBN 1-56592-074-0
diff --git a/man2/sched_setscheduler.2 b/man2/sched_setscheduler.2
index 436320d..e706c5d 100644
--- a/man2/sched_setscheduler.2
+++ b/man2/sched_setscheduler.2
@@ -533,10 +533,10 @@ since it always returns 0 on success.
 .BR setpriority (2),
 .BR capabilities (7),
 .BR cpuset (7)
-.PP
+.br
 .I Programming for the real world \- POSIX.4
 by Bill O. Gallmeister, O'Reilly & Associates, Inc., ISBN 1-56592-074-0
-.PP
+.br
 The kernel source file
 .I Documentation/scheduler/sched-rt-group.txt
-(since kernel 2.6.25).
+(since kernel 2.6.25)
diff --git a/man2/sched_yield.2 b/man2/sched_yield.2
index 057e675..164bfb7 100644
--- a/man2/sched_yield.2
+++ b/man2/sched_yield.2
@@ -79,6 +79,6 @@ which will degrade system performance.
 .SH "SEE ALSO"
 .BR sched_setscheduler (2)
 for a description of Linux scheduling.
-.PP
+.br
 .I Programming for the real world \- POSIX.4
 by Bill O. Gallmeister, O'Reilly & Associates, Inc., ISBN 1-56592-074-0
diff --git a/man2/select.2 b/man2/select.2
index dbd08d6..b121655 100644
--- a/man2/select.2
+++ b/man2/select.2
@@ -573,8 +573,8 @@ main(void)
 .fi
 .SH "SEE ALSO"
 For a tutorial with discussion and examples, see
-.BR select_tut (2).
-.LP
+.BR select_tut (2)
+.br
 For vaguely related stuff, see
 .BR accept (2),
 .BR connect (2),
diff --git a/man2/socket.2 b/man2/socket.2
index 1bc002a..f0f6440 100644
--- a/man2/socket.2
+++ b/man2/socket.2
@@ -408,11 +408,11 @@ is shown in
 .BR tcp (7),
 .BR udp (7),
 .BR unix (7)
-.PP
+.br
 \(lqAn Introductory 4.3BSD Interprocess Communication Tutorial\(rq
 is reprinted in
-.I UNIX Programmer's Supplementary Documents Volume 1.
-.PP
+.I UNIX Programmer's Supplementary Documents Volume 1
+.br
 \(lqBSD Interprocess Communication Tutorial\(rq
 is reprinted in
-.I UNIX Programmer's Supplementary Documents Volume 1.
+.I UNIX Programmer's Supplementary Documents Volume 1
diff --git a/man2/subpage_prot.2 b/man2/subpage_prot.2
index 9256bcc..002eb0c 100644
--- a/man2/subpage_prot.2
+++ b/man2/subpage_prot.2
@@ -125,7 +125,7 @@ hardware pages (on machines with hardware 64-kB page support).
 .\" the affected segment, not the whole process.
 .SH SEE ALSO
 .BR mprotect (2),
-.BR syscall (2);
+.BR syscall (2)
 .br
-the kernel source file
-.IR Documentation/vm/hugetlbpage.txt .
+The kernel source file
+.I Documentation/vm/hugetlbpage.txt
diff --git a/man2/unshare.2 b/man2/unshare.2
index df47b44..000869d 100644
--- a/man2/unshare.2
+++ b/man2/unshare.2
@@ -244,5 +244,6 @@ Such functionality may be added in the future, if required.
 .SH SEE ALSO
 .BR clone (2),
 .BR fork (2),
-.BR vfork (2),
-Documentation/unshare.txt
+.BR vfork (2)
+.br
+.I Documentation/unshare.txt
diff --git a/man3/btree.3 b/man3/btree.3
index 1bc61eb..cbc4d61 100644
--- a/man3/btree.3
+++ b/man3/btree.3
@@ -240,13 +240,13 @@ Only big and little endian byte order is supported.
 .BR hash (3),
 .BR mpool (3),
 .BR recno (3)
-.sp
+.br
 .IR "The Ubiquitous B-tree" ,
-Douglas Comer, ACM Comput. Surv. 11, 2 (June 1979), 121-138.
-.sp
+Douglas Comer, ACM Comput. Surv. 11, 2 (June 1979), 121-138
+.br
 .IR "Prefix B-trees" ,
 Bayer and Unterauer, ACM Transactions on Database Systems, Vol. 2, 1
-(March 1977), 11-26.
-.sp
+(March 1977), 11-26
+.br
 .IR "The Art of Computer Programming Vol. 3: Sorting and Searching" ,
-D.E. Knuth, 1968, pp 471-480.
+D.E. Knuth, 1968, pp 471-480
diff --git a/man3/cmsg.3 b/man3/cmsg.3
index 9455918..34e9565 100644
--- a/man3/cmsg.3
+++ b/man3/cmsg.3
@@ -213,5 +213,5 @@ msg.msg_controllen = cmsg\->cmsg_len;
 .SH "SEE ALSO"
 .BR recvmsg (2),
 .BR sendmsg (2)
-.PP
+.br
 RFC\ 2292
diff --git a/man3/dbopen.3 b/man3/dbopen.3
index 5bc8495..fc1035f 100644
--- a/man3/dbopen.3
+++ b/man3/dbopen.3
@@ -554,6 +554,6 @@ locking, or transactions.
 .BR hash (3),
 .BR mpool (3),
 .BR recno (3)
-.sp
+.br
 .IR "LIBTP: Portable, Modular Transactions for UNIX" ,
-Margo Seltzer, Michael Olson, USENIX proceedings, Winter 1992.
+Margo Seltzer, Michael Olson, USENIX proceedings, Winter 1992
diff --git a/man3/dl_iterate_phdr.3 b/man3/dl_iterate_phdr.3
index fa19597..9b6078f 100644
--- a/man3/dl_iterate_phdr.3
+++ b/man3/dl_iterate_phdr.3
@@ -198,7 +198,7 @@ main(int argc, char *argv[])
 .BR readelf (1),
 .BR dlopen (3),
 .BR elf (5),
-.BR ld.so (8),
-and the
+.BR ld.so (8)
+.br
 .I "Executable and Linking Format Specification"
-available at various locations online.
+available at various locations online
diff --git a/man3/dlopen.3 b/man3/dlopen.3
index 808736a..17eaab7 100644
--- a/man3/dlopen.3
+++ b/man3/dlopen.3
@@ -510,5 +510,6 @@ follows, using \fIbar.c\fP as the example name:
 .BR dl_iterate_phdr (3),
 .BR rtld-audit (7),
 .BR ld.so (8),
-.BR ldconfig (8),
+.BR ldconfig (8)
+.br
 ld.so info pages, gcc info pages, ld info pages
diff --git a/man3/getnameinfo.3 b/man3/getnameinfo.3
index fd5df7c..fde1731 100644
--- a/man3/getnameinfo.3
+++ b/man3/getnameinfo.3
@@ -284,21 +284,21 @@ can be found in
 .BR services (5),
 .BR hostname (7),
 .BR named (8)
-.LP
+.br
 R. Gilligan, S. Thomson, J. Bound and W. Stevens,
 .IR "Basic Socket Interface Extensions for IPv6" ,
-RFC\ 2553, March 1999.
-.LP
+RFC\ 2553, March 1999
+.br
 Tatsuya Jinmei and Atsushi Onoe,
 .IR "An Extension of Format for IPv6 Scoped Addresses" ,
-internet draft, work in progress.
+internet draft, work in progress
 .UR ftp://ftp.ietf.org\:/internet\-drafts\:/draft\-ietf\-ipngwg\-scopedaddr\-format\-02.txt
 .UE
-.LP
+.br
 Craig Metz,
 .IR "Protocol Independence Using the Sockets API" ,
 Proceedings of the freenix track:
-2000 USENIX annual technical conference, June 2000.
+2000 USENIX annual technical conference, June 2000
 .ad l
 .UR http://www.usenix.org\:/publications\:/library\:/proceedings\:/usenix2000\:/freenix\:/metzprotocol.html
 .UE
diff --git a/man3/hash.3 b/man3/hash.3
index 645eb95..060d846 100644
--- a/man3/hash.3
+++ b/man3/hash.3
@@ -160,9 +160,9 @@ Only big and little endian byte order are supported.
 .BR dbopen (3),
 .BR mpool (3),
 .BR recno (3)
-.sp
+.br
 .IR "Dynamic Hash Tables" ,
-Per-Ake Larson, Communications of the ACM, April 1988.
-.sp
+Per-Ake Larson, Communications of the ACM, April 1988
+.br
 .IR "A New Hash Package for UNIX" ,
-Margo Seltzer, USENIX Proceedings, Winter 1991.
+Margo Seltzer, USENIX Proceedings, Winter 1991
diff --git a/man3/lockf.3 b/man3/lockf.3
index 84b5143..7c01ac7 100644
--- a/man3/lockf.3
+++ b/man3/lockf.3
@@ -151,15 +151,14 @@ SVr4, POSIX.1-2001.
 .BR fcntl (2),
 .BR flock (2)
 .br
-There are also
 .I locks.txt
 and
 .I mandatory-locking.txt
 in the kernel source directory
-.IR Documentation/filesystems .
-(On older kernels, these files are directly under the
+.I Documentation/filesystems
+(on older kernels, these files are directly under the
 .I Documentation/
 directory, and
 .I mandatory-locking.txt
 is called
-.IR mandatory.txt .)
+.IR mandatory.txt )
diff --git a/man3/netlink.3 b/man3/netlink.3
index 771fb8b..0497410 100644
--- a/man3/netlink.3
+++ b/man3/netlink.3
@@ -88,7 +88,6 @@ than via the low-level kernel interface.
 .SH "SEE ALSO"
 .BR netlink (7)
 .br
-and
 .UR ftp://ftp.inr.ac.ru\:/ip-routing\:/iproute2*
 .UE
 for libnetlink
diff --git a/man3/recno.3 b/man3/recno.3
index 9ca083d..4954081 100644
--- a/man3/recno.3
+++ b/man3/recno.3
@@ -224,7 +224,7 @@ Only big and little endian byte order is supported.
 .BR dbopen (3),
 .BR hash (3),
 .BR mpool (3)
-.sp
+.br
 .IR "Document Processing in a Relational Database System" ,
 Michael Stonebraker, Heidi Stettner, Joseph Kalash, Antonin Guttman,
-Nadene Lynn, Memorandum No. UCB/ERL M82/32, May 1982.
+Nadene Lynn, Memorandum No. UCB/ERL M82/32, May 1982
diff --git a/man3/rpc.3 b/man3/rpc.3
index 545cea4..23df4e1 100644
--- a/man3/rpc.3
+++ b/man3/rpc.3
@@ -1111,4 +1111,4 @@ rpcgen Programming Guide
 .RE
 .IR "RPC: Remote Procedure Call Protocol Specification" ,
 RFC\ 1050, Sun Microsystems, Inc.,
-USC-ISI.
+USC-ISI
diff --git a/man3/xdr.3 b/man3/xdr.3
index da02912..41a63b9 100644
--- a/man3/xdr.3
+++ b/man3/xdr.3
@@ -537,7 +537,7 @@ one of the most frequently used primitives, requires three.
 Returns one if it succeeds, zero otherwise.
 .SH "SEE ALSO"
 .BR rpc (3)
-.LP
+.br
 The following manuals:
 .RS
 eXternal Data Representation Standard: Protocol Specification
@@ -546,5 +546,5 @@ eXternal Data Representation: Sun Technical Notes
 .br
 .IR "XDR: External Data Representation Standard" ,
 RFC\ 1014, Sun Microsystems, Inc.,
-USC-ISI.
+USC-ISI
 .RE
diff --git a/man4/cciss.4 b/man4/cciss.4
index e35c8c1..0787382 100644
--- a/man4/cciss.4
+++ b/man4/cciss.4
@@ -350,10 +350,12 @@ for example) before I/O can proceed again to a tape drive that was reset.
 .BR cciss_vol_status (8),
 .BR hpsa (4),
 .BR hpacucli (8),
-.BR hpacuxe (8),
+.BR hpacuxe (8)
+.br
 .UR http://cciss.sf.net
-.UE ,
-and the Linux kernel source files
+.UE
+.br
+The Linux kernel source files
 .I Documentation/blockdev/cciss.txt
 and
 .I Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
index 6e5a645..82401c3 100644
--- a/man4/console_ioctl.4
+++ b/man4/console_ioctl.4
@@ -633,6 +633,7 @@ Use POSIX functions.
 .BR charsets (7),
 .BR mapscrn (8),
 .BR resizecons (8),
-.BR setfont (8),
+.BR setfont (8)
+.br
 .IR /usr/include/linux/kd.h ,
 .I /usr/include/linux/vt.h
diff --git a/man4/cpuid.4 b/man4/cpuid.4
index 4cdc3e5..218038f 100644
--- a/man4/cpuid.4
+++ b/man4/cpuid.4
@@ -87,7 +87,7 @@ Very old x86 CPUs don't support CPUID.
 .SH SEE ALSO
 Intel Corporation, Intel 64 and IA-32 Architectures
 Software Developer's Manual Volume 2A:
-Instruction Set Reference, A-M, 3-180 CPUID reference.
-
+Instruction Set Reference, A-M, 3-180 CPUID reference
+.br
 Intel Corporation, Intel Processor Identification and
-the CPUID Instruction, Application note 485.
+the CPUID Instruction, Application note 485
diff --git a/man4/hpsa.4 b/man4/hpsa.4
index 5f849af..7c18826 100644
--- a/man4/hpsa.4
+++ b/man4/hpsa.4
@@ -181,10 +181,12 @@ for some examples.
 .BR st (4),
 .BR cciss_vol_status (8),
 .BR hpacucli (8),
-.BR hpacuxe (8),
+.BR hpacuxe (8)
+.br
 .UR http://cciss.sf.net
-.UE ,
-and the Linux kernel source files
+.UE
+.br
+The Linux kernel source files
 .I Documentation/scsi/hpsa.txt
 and
 .I Documentation/ABI/testing/sysfs-bus-pci-devices-cciss
diff --git a/man4/initrd.4 b/man4/initrd.4
index 5773129..a0a62ca 100644
--- a/man4/initrd.4
+++ b/man4/initrd.4
@@ -476,8 +476,8 @@ The behavior may change in future versions of the Linux kernel.
 .BR ram (4),
 .BR freeramdisk (8),
 .BR rdev (8)
-
+.br
 The documentation file
 .I initrd.txt
 in the kernel source package, the LILO documentation,
-the LOADLIN documentation, the SYSLINUX documentation.
+the LOADLIN documentation, the SYSLINUX documentation
diff --git a/man4/msr.4 b/man4/msr.4
index ec172d1..b98c3ac 100644
--- a/man4/msr.4
+++ b/man4/msr.4
@@ -53,4 +53,4 @@ to load it explicitly before use:
 .SH SEE ALSO
 Intel Corporation Intel 64 and IA-32 Architectures
 Software Developer's Manual Volume 3B Appendix B
-for an overview of the Intel CPU MSRs.
+for an overview of the Intel CPU MSRs
diff --git a/man4/rtc.4 b/man4/rtc.4
index e1c5db8..c8aa906 100644
--- a/man4/rtc.4
+++ b/man4/rtc.4
@@ -336,5 +336,6 @@ capabilities that are not currently exposed by this API.
 .BR time (2),
 .BR gmtime (3),
 .BR time (7),
-.BR hwclock (8),
-/usr/src/linux/Documentation/rtc.txt
+.BR hwclock (8)
+.br
+.I /usr/src/linux/Documentation/rtc.txt
diff --git a/man4/st.4 b/man4/st.4
index 78585c7..566225b 100644
--- a/man4/st.4
+++ b/man4/st.4
@@ -951,11 +951,11 @@ If this is not possible, direct transfers can be disabled.
 .\" Additional permissions are contained in the header of the source file.
 .SH "SEE ALSO"
 .BR mt (1)
-.PP
+.br
 The file
 .I drivers/scsi/README.st
 or
 .I Documentation/scsi/st.txt
 (kernel >= 2.6) in the kernel sources contains
 the most recent information about the driver and its configuration
-possibilities.
+possibilities
diff --git a/man5/elf.5 b/man5/elf.5
index 5ead1bb..b6395a6 100644
--- a/man5/elf.5
+++ b/man5/elf.5
@@ -1941,20 +1941,19 @@ look under SEE ALSO.
 .BR objdump (1),
 .BR execve (2),
 .BR core (5)
-.PP
+.br
 Hewlett-Packard,
-.IR "Elf-64 Object File Format" .
-.PP
+.I Elf-64 Object File Format
+.br
 Santa Cruz Operation,
-.IR "System V Application Binary Interface" .
-.PP
+.I System V Application Binary Interface
+.br
 UNIX System Laboratories,
 "Object Files",
-.IR "Executable and Linking Format (ELF)" .
-.PP
+.I Executable and Linking Format (ELF)
+.br
 Sun Microsystems,
-.IR "Linker and Libraries Guide" .
-.PP
+.I Linker and Libraries Guide
+.br
 AMD64 ABI Draft,
-.IR "System V Application Binary Interface AMD64 Architecture Processor Supplement" .
-.PP
+.I System V Application Binary Interface AMD64 Architecture Processor Supplement
diff --git a/man5/hosts.5 b/man5/hosts.5
index 513a4e3..cb51c01 100644
--- a/man5/hosts.5
+++ b/man5/hosts.5
@@ -117,7 +117,8 @@ I just found three, from 92,
 .BR resolver (3),
 .BR resolver (5),
 .BR hostname (7),
-.BR named (8),
+.BR named (8)
+.br
 Internet RFC\ 952
 .\" .SH AUTHOR
 .\" This manual page was written by Manoj Srivastava <srivasta-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>,
diff --git a/man5/protocols.5 b/man5/protocols.5
index 708caf7..15cfb22 100644
--- a/man5/protocols.5
+++ b/man5/protocols.5
@@ -79,6 +79,6 @@ naming service like Yellow Pages/NIS or BIND/Hesiod.
 The protocols definition file.
 .SH "SEE ALSO"
 .BR getprotoent (3)
-
+.br
 .UR http://www.iana.org\:/assignments\:/protocol-numbers
 .UE
diff --git a/man5/services.5 b/man5/services.5
index 5c39352..a4ba609 100644
--- a/man5/services.5
+++ b/man5/services.5
@@ -216,5 +216,5 @@ Definition of
 .BR inetd.conf (5),
 .BR protocols (5),
 .BR inetd (8)
-
+.br
 Assigned Numbers RFC, most recently RFC\ 1700, (AKA STD0002)
diff --git a/man5/tzfile.5 b/man5/tzfile.5
index 0b01cd8..ef01799 100644
--- a/man5/tzfile.5
+++ b/man5/tzfile.5
@@ -153,7 +153,7 @@ such instants).
 .SH SEE ALSO
 .BR ctime (3),
 .BR tzset (3),
-.BR tzselect (8),
-and
+.BR tzselect (8)
+.br
 .I timezone/tzfile.h
-in the glibc source code.
+in the glibc source code
diff --git a/man7/aio.7 b/man7/aio.7
index 37562c1..f5789f2 100644
--- a/man7/aio.7
+++ b/man7/aio.7
@@ -455,6 +455,7 @@ main(int argc, char *argv[])
 .BR aio_read (3),
 .BR aio_return (3),
 .BR aio_write (3),
-.BR lio_listio (3),
+.BR lio_listio (3)
+.br
 .UR http://www.squid-cache.org\:/~adrian\:/Reprint-Pulavarty-OLS2003.pdf
 .UE
diff --git a/man7/arp.7 b/man7/arp.7
index 12fb57c..74a6fa9 100644
--- a/man7/arp.7
+++ b/man7/arp.7
@@ -299,10 +299,10 @@ functionality together.
 .SH "SEE ALSO"
 .BR capabilities (7),
 .BR ip (7)
-.PP
-RFC\ 826 for a description of ARP.
+.br
+RFC\ 826 for a description of ARP
 .br
 RFC\ 2461 for a description of IPv6 neighbor discovery and the base
-algorithms used.
-.LP
-Linux 2.2+ IPv4 ARP uses the IPv6 algorithms when applicable.
+algorithms used
+.br
+Linux 2.2+ IPv4 ARP uses the IPv6 algorithms when applicable
diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 61290ff..f8c00c8 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -1077,7 +1077,7 @@ created on the system.
 .BR pthreads (7),
 .BR getcap (8),
 .BR setcap (8)
-.PP
+.br
 Comments on the purposes of various capabilities in
 .I include/linux/capability.h
 in the kernel source
diff --git a/man7/cpuset.7 b/man7/cpuset.7
index 52943fb..9462a27 100644
--- a/man7/cpuset.7
+++ b/man7/cpuset.7
@@ -1498,6 +1498,6 @@ syntax that works on any shell, but alas more obscurely, by using the
 .BR numa (7),
 .BR migratepages (8),
 .BR numactl (8)
-.PP
+.br
 The kernel source file
-.IR Documentation/cpusets.txt .
+.I Documentation/cpusets.txt
diff --git a/man7/feature_test_macros.7 b/man7/feature_test_macros.7
index 135fa05..3fccd2d 100644
--- a/man7/feature_test_macros.7
+++ b/man7/feature_test_macros.7
@@ -594,9 +594,9 @@ main(int argc, char *argv[])
 .SH SEE ALSO
 .BR libc (7),
 .BR standards (7)
-.sp
+.br
 The section "Feature Test Macros" under
-.IR "info libc" .
+.B info libc
 .\" But beware: the info libc document is out of date (Jul 07, mtk)
-.sp
+.br
 .I /usr/include/features.h
diff --git a/man7/futex.7 b/man7/futex.7
index bafa141..8b378f1 100644
--- a/man7/futex.7
+++ b/man7/futex.7
@@ -111,9 +111,9 @@ primitives: it is by no means the only one.
 .\" This page written by bert hubert.
 .SH "SEE ALSO"
 .BR futex (2)
-.PP
+.br
 .IR "Fuss, Futexes and Furwocks: Fast Userlevel Locking in Linux"
 (proceedings of the Ottawa Linux Symposium 2002),
 futex example library, futex-*.tar.bz2
 .UR ftp://ftp.kernel.org\:/pub\:/linux\:/kernel\:/people\:/rusty/
-.UE .
+.UE
diff --git a/man7/hier.7 b/man7/hier.7
index 08bbea2..92933fe 100644
--- a/man7/hier.7
+++ b/man7/hier.7
@@ -501,5 +501,5 @@ differently.
 .BR ln (1),
 .BR proc (5),
 .BR mount (8)
-
+.br
 The Filesystem Hierarchy Standard
diff --git a/man7/icmp.7 b/man7/icmp.7
index 8c4cbed..c72f024 100644
--- a/man7/icmp.7
+++ b/man7/icmp.7
@@ -184,5 +184,5 @@ This raw socket may appear in
 output with a zero inode.
 .SH "SEE ALSO"
 .BR ip (7)
-.PP
-RFC\ 792 for a description of the ICMP protocol.
+.br
+RFC\ 792 for a description of the ICMP protocol
diff --git a/man7/inotify.7 b/man7/inotify.7
index 6a34e1e..ba697c4 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -445,5 +445,6 @@ unread event.
 .BR inotify_init1 (2),
 .BR inotify_rm_watch (2),
 .BR read (2),
-.BR stat (2),
-.IR Documentation/filesystems/inotify.txt .
+.BR stat (2)
+.br
+.I Documentation/filesystems/inotify.txt
diff --git a/man7/ip.7 b/man7/ip.7
index 9f560df..99db601 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -1094,10 +1094,10 @@ does not work in some 2.2 kernels.
 .BR socket (7),
 .BR tcp (7),
 .BR udp (7)
-.PP
-RFC\ 791 for the original IP specification.
 .br
-RFC\ 1122 for the IPv4 host requirements.
+RFC\ 791 for the original IP specification
+.br
+RFC\ 1122 for the IPv4 host requirements
 .br
-RFC\ 1812 for the IPv4 router requirements.
+RFC\ 1812 for the IPv4 router requirements
 .\" FIXME autobind INADDR REUSEADDR
diff --git a/man7/ipv6.7 b/man7/ipv6.7
index ce75541..5b33713 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -332,8 +332,8 @@ This man page is not complete.
 .SH "SEE ALSO"
 .BR cmsg (3),
 .BR ip (7)
-.PP
-RFC\ 2553: IPv6 BASIC API.
-Linux tries to be compliant to this.
-.PP
-RFC\ 2460: IPv6 specification.
+.br
+RFC\ 2553: IPv6 BASIC API
+(Linux tries to be compliant to this)
+.br
+RFC\ 2460: IPv6 specification
diff --git a/man7/iso_8859-16.7 b/man7/iso_8859-16.7
index db6e509..db07365 100644
--- a/man7/iso_8859-16.7
+++ b/man7/iso_8859-16.7
@@ -172,8 +172,7 @@ _
 .BR iso_8859-1 (7),
 .BR iso_8859-15 (7),
 .BR iso_8859-2 (7)
-.P
-Additional information:
+.br
 .I ISO 8859-16 (Latin 10) Resources
 .UR http://bucovina.chem.tue.nl\:/fonturi\:/index-en.html
-.UE .
+.UE
diff --git a/man7/iso_8859-2.7 b/man7/iso_8859-2.7
index f3b609e..4e22a38 100644
--- a/man7/iso_8859-2.7
+++ b/man7/iso_8859-2.7
@@ -174,8 +174,7 @@ _
 .BR ascii (7),
 .BR iso_8859-1 (7),
 .BR iso_8859-16 (7)
-.P
-Additional information:
+.br
 .I ISO 8859-2 (Latin 2) Resources
 .UR http://sizif.mf.uni-lj.si\:/linux\:/cee\:/iso8859-2.html
-.UE .
+.UE
diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
index a758e03..262b430 100644
--- a/man7/koi8-r.7
+++ b/man7/koi8-r.7
@@ -190,7 +190,8 @@ _
 .SH "SEE ALSO"
 .BR ascii (7),
 .BR iso-8859-5 (7),
-.BR koi8-u (7),
+.BR koi8-u (7)
+.br
 RFC\ 1489,
 .UR http://koi8.pp.ru/
 .UE
diff --git a/man7/mailaddr.7 b/man7/mailaddr.7
index f8eb857..a24da78 100644
--- a/man7/mailaddr.7
+++ b/man7/mailaddr.7
@@ -121,5 +121,5 @@ The "postmaster" address is not case sensitive.
 .BR forward (5),
 .BR sendmail (8),
 .BR vrfy (8)
-
+.br
 RFC\ 2822 (Internet Message Format)
diff --git a/man7/math_error.7 b/man7/math_error.7
index eae7735..1981512 100644
--- a/man7/math_error.7
+++ b/man7/math_error.7
@@ -261,4 +261,4 @@ An error can still be tested for using
 .BR matherr (3),
 .BR nan (3)
 .br
-.I "info libc"
+.B "info libc"
diff --git a/man7/netlink.7 b/man7/netlink.7
index 9fd470f..51e0116 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -466,7 +466,7 @@ for (nh = (struct nlmsghdr *) buf; NLMSG_OK (nh, len);
 .BR netlink (3),
 .BR capabilities (7),
 .BR rtnetlink (7)
-.PP
+.br
 .UR ftp://ftp.inr.ac.ru\:/ip-routing\:/iproute2*
 information about libnetlink
 .UE
diff --git a/man7/packet.7 b/man7/packet.7
index 374f6da..f507f1e 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -393,11 +393,11 @@ packets via
 .BR ip (7),
 .BR raw (7),
 .BR socket (7)
-
-RFC\ 894 for the standard IP Ethernet encapsulation.
-
-RFC\ 1700 for the IEEE 802.3 IP encapsulation.
-
+.br
+RFC\ 894 for the standard IP Ethernet encapsulation
+.br
+RFC\ 1700 for the IEEE 802.3 IP encapsulation
+.br
 The
 .I <linux/if_ether.h>
-include file for physical layer protocols.
+include file for physical layer protocols
diff --git a/man7/pthreads.7 b/man7/pthreads.7
index d2740b6..a9993e7 100644
--- a/man7/pthreads.7
+++ b/man7/pthreads.7
@@ -899,9 +899,9 @@ bash$ $( LD_ASSUME_KERNEL=2.2.5 ldd /bin/ls | grep libc.so | \\
 .BR proc (5),
 .BR futex (7),
 .BR sigevent (7),
-.BR signal (7),
+.BR signal (7)
 .br
-and various Pthreads manual pages, for example:
+Various Pthreads manual pages, for example:
 .BR pthread_attr_init (3),
 .BR pthread_atfork (3),
 .BR pthread_cancel (3),
@@ -922,5 +922,4 @@ and various Pthreads manual pages, for example:
 .BR pthread_setspecific (3),
 .BR pthread_sigmask (3),
 .BR pthread_sigqueue (3),
-and
 .BR pthread_testcancel (3)
diff --git a/man7/raw.7 b/man7/raw.7
index de61228..58e04f6 100644
--- a/man7/raw.7
+++ b/man7/raw.7
@@ -268,11 +268,11 @@ call is always used.
 .BR capabilities (7),
 .BR ip (7),
 .BR socket (7)
-
+.br
 .B RFC\ 1191
-for path MTU discovery.
-
+for path MTU discovery
+.br
 .B RFC\ 791
 and the
 .I <linux/ip.h>
-include file for the IP protocol.
+include file for the IP protocol
diff --git a/man7/regex.7 b/man7/regex.7
index c935571..caf8c99 100644
--- a/man7/regex.7
+++ b/man7/regex.7
@@ -284,5 +284,5 @@ This page was taken from Henry Spencer's regex package.
 .SH "SEE ALSO"
 .BR grep (1),
 .BR regex (3)
-.PP
-POSIX.2, section 2.8 (Regular Expression Notation).
+.br
+POSIX.2, section 2.8 (Regular Expression Notation)
diff --git a/man7/spufs.7 b/man7/spufs.7
index 9caea7c..dbe64de 100644
--- a/man7/spufs.7
+++ b/man7/spufs.7
@@ -766,5 +766,6 @@ none  	/spu  	spufs  	gid=spu  	0	0
 .BR close (2),
 .BR spu_create (2),
 .BR spu_run (2),
-.BR capabilities (7),
+.BR capabilities (7)
+.br
 .I The Cell Broadband Engine Architecture (CBEA) specification
diff --git a/man7/tcp.7 b/man7/tcp.7
index 476c25c..fbfbe71 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -1142,17 +1142,17 @@ IPv6 is not described.
 .BR socket (2),
 .BR ip (7),
 .BR socket (7)
-.sp
-RFC\ 793 for the TCP specification.
 .br
-RFC\ 1122 for the TCP requirements and a description of the Nagle algorithm.
+RFC\ 793 for the TCP specification
+.br
+RFC\ 1122 for the TCP requirements and a description of the Nagle algorithm
 .br
-RFC\ 1323 for TCP timestamp and window scaling options.
+RFC\ 1323 for TCP timestamp and window scaling options
 .br
-RFC\ 1337 for a description of TIME_WAIT assassination hazards.
+RFC\ 1337 for a description of TIME_WAIT assassination hazards
 .br
-RFC\ 3168 for a description of Explicit Congestion Notification.
+RFC\ 3168 for a description of Explicit Congestion Notification
 .br
-RFC\ 2581 for TCP congestion control algorithms.
+RFC\ 2581 for TCP congestion control algorithms
 .br
-RFC\ 2018 and RFC\ 2883 for SACK and extensions to SACK.
+RFC\ 2018 and RFC\ 2883 for SACK and extensions to SACK
diff --git a/man7/udplite.7 b/man7/udplite.7
index a090c87..75937dc 100644
--- a/man7/udplite.7
+++ b/man7/udplite.7
@@ -146,7 +146,7 @@ UDP-Litev4/v6 first appeared in Linux 2.6.20.
 .BR ipv6 (7),
 .BR socket (7),
 .BR udp (7)
-
+.br
 RFC\ 3828 for the Lightweight User Datagram Protocol (UDP-Lite)
 .br
 .I Documentation/networking/udplite.txt
diff --git a/man7/uri.7 b/man7/uri.7
index 9e7d7f7..6f64739 100644
--- a/man7/uri.7
+++ b/man7/uri.7
@@ -706,7 +706,8 @@ tools) and invokes the right tool for any URI.
 .BR lynx (1),
 .BR man2html (1),
 .BR mailaddr (7),
-.BR utf-8 (7),
+.BR utf-8 (7)
+.br
 .UR http://www.ietf.org\:/rfc\:/rfc2255.txt
 IETF RFC\ 2255
 .UE
diff --git a/man7/x25.7 b/man7/x25.7
index acf2478..edc0128 100644
--- a/man7/x25.7
+++ b/man7/x25.7
@@ -113,11 +113,8 @@ if a reset occurred, data might be lost without notice.
 .SH "SEE ALSO"
 .BR socket (2),
 .BR socket (7)
-.PP
+.br
 Jonathan Simon Naylor:
-\(lqThe Re-Analysis and Re-Implementation of X.25.\(rq
-The URL is
-.RS
+\(lqThe Re-Analysis and Re-Implementation of X.25\(rq
 .UR ftp://ftp.pspt.fi\:/pub\:/ham\:/linux\:/ax25\:/x25doc.tgz
 .UE
-.RE
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
