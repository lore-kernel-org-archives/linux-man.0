From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Document new clock IDs and describe semantics in a bit more
 detail.
Date: Mon, 25 Jan 2010 12:40:14 -0800
Message-ID: <4B5E01AE.8090901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, erik.thiele-eya3kVBycedhm1LlJvw4vhvVK+yQ3ZXh@public.gmane.org
List-Id: linux-man@vger.kernel.org

Some time ago there was a request for more documentation of some of the newer POSIX clocks, and in
particular of their characteristics with respect to NTP.  I took a whack at adding this
documentation against manpages release 3.24.

This patch adds description of the new clocks CLOCK_REALTIME_COARSE and CLOCK_MONOTONIC_COARSE, as
well as CLOCK_MONOTONIC_RAW.  I also added a bit of clarification in surrounding man pages
(clock_getres, timer_create, clock_nanosleep).

I called the general clock description page posix_clocks.7 rather than linux_clocks.7, as these are
clocks that fit into the POSIX framework (as opposed to other, non-POSIX clocks which are described
elsewhere).

I welcome any thoughts or comments.

- bog

>From 8bfd08b81487b8a09f5e72a753ded50da41e3bd1 Mon Sep 17 00:00:00 2001
From: Bill O. Gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Wed, 20 Jan 2010 21:58:07 -0800
Subject: [PATCH] Document new clock IDs and describe semantics in a bit more detail.

This patch introduces one new man page, posix_clocks.7, which describes
all currently-supported CLOCK_IDs.  The different behavior of each clock
type is briefly described.  A bit of additional clarification is added
to some of the surrounding clock_ and timer_ man pages as well.

Signed-off-by: Bill O. Gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/clock_getres.2    |   28 ++++++++-
 man2/clock_nanosleep.2 |    6 +-
 man2/timer_create.2    |    9 +++
 man7/posix_clocks.7    |  154 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 193 insertions(+), 4 deletions(-)
 create mode 100644 man7/posix_clocks.7

diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index 76bb754..9f01356 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -118,12 +118,21 @@ Sufficiently recent versions of glibc and the Linux kernel
 support the following clocks:
 .TP
 .B CLOCK_REALTIME
-System-wide real-time clock.
+System-wide real-time clock,
+potentially managed by NTP.
 Setting this clock requires appropriate privileges.
+This clock may slew and it may jump, depending on adjustments propagated by
+NTP.
+.TP
+.BR CLOCK_REALTIME_COARSE " (since Linux 2.6.32; Linux-specific)"
+Clock like CLOCK_REALTIME, but of coarser granularity
+and faster to access.
 .TP
 .B CLOCK_MONOTONIC
 Clock that cannot be set and represents monotonic time since
 some unspecified starting point.
+This clock may slew in response to NTP adjustments, but is guaranteed not to
+jump backwards.
 .TP
 .BR CLOCK_MONOTONIC_RAW " (since Linux 2.6.28; Linux-specific)"
 .\" Added in commit 2d42244ae71d6c7b0884b5664cf2eda30fb2ae68, John Stultz
@@ -132,6 +141,10 @@ Similar to
 but provides access to a raw hardware-based time
 that is not subject to NTP adjustments.
 .TP
+.BR CLOCK_MONOTONIC_COARSE " (since Linux 2.6.32; Linux-specific)"
+Monotonic clock like CLOCK_MONOTONIC, but of coarser granularity
+and faster to access.
+.TP
 .B CLOCK_PROCESS_CPUTIME_ID
 High-resolution per-process timer from the CPU.
 .TP
@@ -154,7 +167,15 @@ points outside the accessible address space.
 .B EINVAL
 The
 .I clk_id
-specified is not supported on this system.
+specified is not supported on this system for the desired operation
+(for example,
+.B CLOCK_MONOTONIC
+cannot be set, so
+.B EINVAL
+will be returned if you pass it a
+.I clk_id
+equal to
+.B CLOCK_MONOTONIC).
 .TP
 .B EPERM
 .BR clock_settime ()
@@ -168,10 +189,12 @@ is defined in \fI<unistd.h>\fP to a value greater than 0.
 The symbols
 .BR _POSIX_MONOTONIC_CLOCK ,
 .BR _POSIX_CPUTIME ,
+and
 .B _POSIX_THREAD_CPUTIME
 indicate that
 .BR CLOCK_MONOTONIC ,
 .BR CLOCK_PROCESS_CPUTIME_ID ,
+and
 .B CLOCK_THREAD_CPUTIME_ID
 are available.
 (See also
@@ -231,4 +254,5 @@ are not settable.
 .BR ftime (3),
 .BR pthread_getcpuclockid (3),
 .BR sysconf (3),
+.BR posix_clocks (7),
 .BR time (7)
diff --git a/man2/clock_nanosleep.2 b/man2/clock_nanosleep.2
index 87711cf..c6a4984 100644
--- a/man2/clock_nanosleep.2
+++ b/man2/clock_nanosleep.2
@@ -166,8 +166,10 @@ was negative.
 .B EINVAL
 .I clock_id
 was invalid.
-.RB ( CLOCK_THREAD_CPUTIME_ID
-is not a permitted value for
+.RB ( CLOCK_THREAD_CPUTIME_ID , CLOCK_MONOTONIC_RAW , CLOCK_REALTIME_COARSE ,
+and
+.B CLOCK_MONOTONIC_COARSE
+are not permitted values for
 .IR clock_id .)
 .SH VERSIONS
 The
diff --git a/man2/timer_create.2 b/man2/timer_create.2
index 54323cf..0609d07 100644
--- a/man2/timer_create.2
+++ b/man2/timer_create.2
@@ -1,5 +1,6 @@
 .\" Copyright (c) 2009 Linux Foundation, written by Michael Kerrisk
 .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+.\" Some additions by Bill O. Gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 .\"
 .\" Permission is granted to make and distribute verbatim copies of this
 .\" manual provided the copyright notice and this permission notice are
@@ -74,6 +75,8 @@ A clock that measures (user and system) CPU time consumed by
 the calling thread.
 .\" The CLOCK_MONOTONIC_RAW that was added in 2.6.28 can't be used
 .\" to create a timer -- mtk, Feb 2009
+.\" The CLOCK_MONOTONIC_COARSE and CLOCK_REALTIME_COARSE that were added in
+.\" 2.6.32 can't be used to create a timer -- bog, Jan 2010
 .PP
 As well as the above values,
 .I clockid
@@ -274,6 +277,12 @@ glibc provided an incomplete userspace implementation
 timers only) using POSIX threads,
 and current glibc falls back to this implementation on systems
 running pre-2.6 Linux kernels.
+.PP
+.BR CLOCK_REALTIME_COARSE ,
+.BR CLOCK_MONOTONIC_COARSE ,
+and
+.B CLOCK_MONOTONIC_RAW
+may not be used for creating timers.
 .SH EXAMPLE
 The program below takes two arguments: a sleep period in seconds,
 and a timer frequency in nanoseconds.
diff --git a/man7/posix_clocks.7 b/man7/posix_clocks.7
new file mode 100644
index 0000000..b00c158
--- /dev/null
+++ b/man7/posix_clocks.7
@@ -0,0 +1,154 @@
+.\" Hey Emacs! This file is -*- nroff -*- source.
+.\"
+.\" This manpage is Copyright (C) 2009, Bill O. Gallmeister
+.\" 	<bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+.\"
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume no
+.\" responsibility for errors or omissions, or for damages resulting from
+.\" the use of the information contained herein.  The author(s) may not
+.\" have taken the same level of care in the production of this manual,
+.\" which is licensed free of charge, as they might when working
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\"
+.\" Sources:  LKML discussions, Git logs, Open Group POSIX specs,
+.\" kernel source.
+.\"
+.\"""""""""""""
+.TH POSIX_CLOCKS 7 2010-01-18 "Linux" "Linux Programmer's Manual"
+.SH NAME
+POSIX clocks \- POSIX clock IDs defined by Linux
+.SH SYNOPSIS
+.nf
+.B #include <time.h>
+.fi
+.SH DESCRIPTION
+POSIX specifies a set of functions for getting and setting clock time,
+and for setting timers based on these clocks.  These functions,
+.BR clock_gettime (),
+.BR clock_getres (),
+.BR clock_settime ()
+and
+.BR clock_nanosleep (),
+allow the programmer to specify clock sources which are
+provided by the underlying operating system implementation.  The clock sources
+available on a sufficiently-recent Linux system are described below.
+.IP CLOCK_REALTIME
+.BR CLOCK_REALTIME
+is the ID of the one clock which is required to be supported on all systems
+supporting
+.BR _POSIX_TIMERS .
+.B CLOCK_REALTIME
+represents the realtime clock for the system, and generally is
+tied to a particular hardware timer on the system.
+Under Linux,
+.B CLOCK_REALTIME
+is subject to NTP, and may slew (run slightly faster or slower in order to match
+the NTP clock source) or occasionally jump either forward or backward
+(in the event of NTP discontinuities
+that exceed the slewing threshold).
+.IP CLOCK_REALTIME_COARSE
+.BR CLOCK_REALTIME_COARSE
+is a clock source which is faster to access than
+.BR CLOCK_REALTIME ,
+because actual clock hardware need not be accessed.  However, the clock
+granularity of
+.BR CLOCK_REALTIME
+is coarse -- it is only the time as of the last clock tick.
+.B CLOCK_REALTIME_COARSE
+is a Linux-specific clock ID which was introduced in Linux 2.6.32.
+.IP CLOCK_MONOTONIC
+.BR CLOCK_MONOTONIC
+is a monotonically-ascending clock which is supported if
+.B _POSIX_MONOTONIC_CLOCK
+is greater than or equal to 200112L.
+.B CLOCK_MONOTONIC
+does not ever go backwards and cannot be set using
+.BR clock_settime ()
+(or any other time-setting call, for that matter).
+.BR CLOCK_MONOTONIC
+is managed by NTP, and so can slew;  however, it is guaranteed not to jump.
+.IP CLOCK_MONOTONIC_RAW
+.BR CLOCK_MONOTONIC_RAW
+is differentiated from
+.BR CLOCK_MONOTONIC
+by the fact that it is not managed by NTP at all.
+It is unadulteraded "hardware time".
+.B CLOCK_MONOTONIC_RAW
+is a Linux-specific clock ID which was introduced in Linux 2.6.28.
+.IP CLOCK_MONOTONIC_COARSE
+.BR CLOCK_MONOTONIC_COARSE
+is to
+.BR CLOCK_MONOTONIC
+as
+.BR CLOCK_REALTIME_COARSE
+is to
+.BR CLOCK_REALTIME .
+It is faster to access, but of coarser granularity.
+.B CLOCK_MONOTONIC_COARSE
+is a Linux-specific clock ID which was introduced in Linux 2.6.32.
+.IP CLOCK_PROCESS_CPUTIME_ID
+.BR CLOCK_PROCESS_CPUTIME_ID
+is a pseudo-clock which ticks with the time spent
+by the calling process.  The process time consists of the sum of the time spent
+in all threads of the process (see
+.BR CLOCK_THREAD_CPUTIME_ID
+below).
+.B CLOCK_PROCESS_CPUTIME_ID
+is supported if
+.B _POSIX_PROCESS_CPUTIME
+is greater than or equal to 200112L.
+.IP CLOCK_THREAD_CPUTIME_ID
+.BR CLOCK_THREAD_CPUTIME_ID
+is a pseudo-clock which ticks with the time spent
+by the calling thread.  The process time consists of the sum of the time spent
+in all threads of the process (see
+.BR CLOCK_PROCESS_CPUTIME_ID
+above).
+.B CLOCK_THREAD_CPUTIME_ID
+is supported if
+.B _POSIX_THREAD_CPUTIME
+is greater than or equal to 200112L.
+.SH "CONFORMING TO"
+.LP
+.BR CLOCK_REALTIME ,
+.BR CLOCK_MONOTONIC ,
+.BR CLOCK_PROCESS_CPUTIME_ID ,
+and
+.BR CLOCK_THREAD_CPUTIME_ID
+conform to POSIX.1-2004.
+The other clock IDs are Linux-specific extensions which are not described by
+POSIX.1-2004.
+.SH SEE ALSO
+.BR clock_gettime (3),
+.BR clock_settime (3),
+.BR clock_getres (3),
+.BR clock_getcpuclockid (3),
+.BR timer_settime (2),
+.BR timer_gettime (2),
+.BR timer_settime (2),
+.BR timer_create (2),
+.BR timer_delete (2),
+.BR timer_getoverrun (2),
+.BR time.h (0P).
+
+Open Group Base Specification Issue 6 (IEEE Standard 1003.1, 2004 Edition) --
+.BR http://www.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap02.html .
+This document describes the requirements, from an application standpoint,
+for operating system conformance to POSIX.  As such, it describes a subset of
+the facilities provided by Linux.
+
+"New timeofday implementation proposal",
+.BR http://lkml.org/lkml/2004/8/17/246

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
