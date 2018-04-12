From: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH 1/2] posixoptions.7: Expand XSI Options groups.
Date: Thu, 12 Apr 2018 14:05:33 -0500
Message-ID: <2d6c47e9-0f34-c828-916e-a45fbf90f837@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------FCD054ABDBFD04054FE7279B"
Return-path: <libc-alpha-return-91517-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Florian Weimer <fweimer@redhat.com>, GNU C Library <libc-alpha@sourceware.org>, Zack Weinberg <zackw@panix.com>, Rical Jasan <rj@2c3t.io>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------FCD054ABDBFD04054FE7279B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

We define in detail the X/Open System Interfaces i.e. _XOPEN_UNIX
and all of the X/Open System Interfaces (XSI) Options Groups.

The XSI options groups include encryption, realtime, advanced
realtime, realtime threads, advanced realtime threads, tracing,
streams, and leagcy interfaces.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
-- 
Cheers,
Carlos.

--------------FCD054ABDBFD04054FE7279B
Content-Type: text/x-patch;
 name="0001-posixoptions.7-Expand-XSI-Options-groups.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-posixoptions.7-Expand-XSI-Options-groups.patch"

>From eb192289fb958f427904dd2588aa0419e050bd6a Mon Sep 17 00:00:00 2001
From: Carlos O'Donell <carlos@systemhalted.org>
Date: Thu, 12 Apr 2018 13:33:00 -0500
Subject: [PATCH 1/2] posixoptions.7: Expand XSI Options groups.

We define in detail the X/Open System Interfaces i.e. _XOPEN_UNIX
and all of the X/Open System Interfaces (XSI) Options Groups.

The XSI options groups include encryption, realtime, advanced
realtime, realtime threads, advanced realtime threads, tracing,
streams, and leagcy interfaces.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 man7/posixoptions.7 | 137 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 130 insertions(+), 7 deletions(-)

diff --git a/man7/posixoptions.7 b/man7/posixoptions.7
index 7e912beae..2c3f2fe96 100644
--- a/man7/posixoptions.7
+++ b/man7/posixoptions.7
@@ -779,13 +779,136 @@ The following functions are present:
 Always present (probably 0).
 Value to set a changeable special control
 character to indicate that it is disabled.
-.SH XOPEN EXTENSIONS
-.BR _XOPEN_CRYPT ,
-.BR _XOPEN_LEGACY ,
-.BR _XOPEN_REALTIME ,
-.BR _XOPEN_REALTIME_THREADS ,
-.BR _XOPEN_UNIX .
-.\" To be described.
+.SH X/OPEN SYSTEM INTERFACES EXTENSIONS
+.SS XSI - _XOPEN_CRYPT - _SC_XOPEN_CRYPT
+The following functions are present:
+.PP
+.nf
+.in +4n
+.IR crypt (),
+.IR encrypt (),
+.IR setkey ()
+.SS XSI - _XOPEN_REALTIME - _SC_XOPEN_REALTIME
+This option implies the
+.B _POSIX_ASYNCHRONOUS_IO == 200112L,
+.B _POSIX_FSYNC,
+.B _POSIX_MAPPED_FILES,
+.B _POSIX_MEMLOCK == 200112L,
+.B _POSIX_MEMLOCK_RANGE == 200112L,
+.B _POSIX_MEMORY_PROTECTION,
+.B _POSIX_MESSAGE_PASSING == 200112L,
+.B _POSIX_PRIORITIZED_IO,
+.B _POSIX_PRIORITY_SCHEDULING == 200112L,
+.B _POSIX_REALTIME_SIGNALS == 200112L,
+.B _POSIX_SEMAPHORES == 200112L,
+.B _POSIX_SHARED_MEMORY_OBJECTS == 200112L,
+.B _POSIX_SYNCHRONIZED_IO == 200112L,
+and
+.B _POSIX_TIMERS == 200112L
+options.
+.SS ADV - --- - ---
+The Advanced Realtime option group implies the
+.B _POSIX_ADVISORY_INFO,
+.B _POSIX_CLOCK_SELECTION (implies _POSIX_TIMERS),
+.B _POSIX_CPUTIME (implies _POSIX_TIMERS),
+.B _POSIX_MONOTONIC_CLOCK (implies _POSIX_TIMERS),
+.B _POSIX_SPAWN,
+.B _POSIX_SPORADIC_SERVER (implies _POSIX_PRIORITY_SCHEDULING),
+.B _POSIX_TIMEOUTS,
+and
+.B _POSIX_TYPED_MEMORY_OBJECTS
+options are all defined to 200112L.
+.SS XSI - _XOPEN_REALTIME_THREADS - _SC_XOPEN_REALTIME_THREADS
+This option implies the
+.B _POSIX_THREAD_PRIO_INHERIT,
+.B _POSIX_THREAD_PRIO_PROTECT,
+and
+.B _POSIX_THREAD_PRIORITY_SCHEDULING
+options are all defined to 200112L.
+.SS ADVANCED REALTIME THREADS - --- - ---
+The option implies the
+.B _POSIX_BARRIERS (implies _POSIX_THREADS, _POSIX_THREAD_SAFE_FUNCTIONS),
+.B _POSIX_SPIN_LOCKS (implies _POSIX_THREADS, _POSIX_THREAD_SAFE_FUNCTIONS),
+.B _POSIX_THREAD_CPUTIME (implies _POSIX_TIMERS),
+and
+.B _POSIX_THREAD_SPORADIC_SERVER (implies _POSIX_THREAD_PRIORITY_SCHEDULING)
+options are all defined to 200112L.
+.SS TRACING - --- - ---
+The option implies the
+.B _POSIX_TRACE,
+.B _POSIX_TRACE_EVENT_FILTER,
+.B _POSIX_TRACE_LOG,
+and
+.B _POSIX_TRACE_INHERIT
+options and defined to 200112L.
+.SS STREAMS - _XOPEN_STREAMS - _SC_XOPEN_STREAMS
+The following functions are present:
+.PP
+.nf
+.in +4n
+.IR fattach ()
+.IR fdetach ()
+.IR getmsg ()
+.IR getpmsg ()
+.IR ioctl ()
+.IR iastream ()
+.IR putmsg ()
+.IR putpmsg ()
+.SS XSI - _XOPEN_LEGACY - _SC_XOPEN_LEGACY
+Functions included in the legacy option group were previously mandatory,
+but are now optional in this version.
+The following functions are present:
+.PP
+.nf
+.in +4n
+.IR bcmp (),
+.IR bcopy (),
+.IR bzero (),
+.IR ecvt (),
+.IR fcvt (),
+.IR ftime (),
+.IR gcvt (),
+.IR getcwd (),
+.IR index (),
+.IR mktemp (),
+.IR rindex (),
+.IR utimes (),
+.IR wcswcs ()
+.SS XSI - _XOPEN_UNIX - _SC_XOPEN_UNIX
+The following functions are present:
+.PP
+.nf
+.in +4n
+.IR mmap (),
+.IR munmap (),
+and
+.IR msync.
+.in -4n
+.fi
+.PP
+The option implies the
+.B _POSIX_FSYNC,
+.B _POSIX_MAPPED_FILES,
+.B _POSIX_MEMORY_PROTECTION,
+.B _POSIX_THREAD_ATTR_STACKADDR,
+.B _POSIX_THREAD_ATTR_STACKSIZE,
+.B _POSIX_THREAD_PROCESS_SHARED,
+.B _POSIX_THREAD_SAFE_FUNCTIONS,
+and
+.B _POSIX_THREADS
+options.
+.PP
+The option may imply the
+.B Encryption (_XOPEN_CRYPT),
+.B Realtime (_XOPEN_REALTIME),
+.B Advanced Raltime (ADB),
+.B Realtime Threads (_XOPEN_REALTIME_THREADS),
+.B Advanced Realtime Threads (ADVANCED REALTIME THREADS),
+.B Tracing (TRACING),
+.B XSI Streams (STREAMS),
+and
+.B Legacy (_XOPEN_LEGACY)
+options from the XSI option groups.
 .SH SEE ALSO
 .BR sysconf (3),
 .BR standards (7)
-- 
2.14.3


--------------FCD054ABDBFD04054FE7279B--
