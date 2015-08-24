From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] mallopt.3: Document M_ARENA_TEST, and M_ARENA_MAX.
Date: Mon, 24 Aug 2015 12:05:02 -0400
Message-ID: <55DB40AE.7080405@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

In 2013 I brought up the discussion if M_ARENA_MAX and M_ARENA_TEST
were public parameters:
https://sourceware.org/ml/libc-alpha/2013-03/msg00376.html
Consensus among Siddhesh and myself was that they should be public,
and in fact they were already in the public header. Therefore there
may already be applications uses these constants and expecting them
to work. At best we could limit mallopt's acceptance of the options,
but that seems like a bad solution that could lead to unexpected
behaviour for user applications. A quick google search shows that
there are packages relying on these constants to tune the glibc
malloc implementation.

Since glibc 2.10 the M_ARENA_TEST and M_ARENA_MAX features have
been part of the public interface with --enable-experimental-malloc.

Since glibc 2.15 the experimental allocator has been on by default
and M_ARENA_TEST and M_ARENA_MAX have been more broadly used.

There are environment variables, without trailing underscore, that
can also be used to adjust these values at runtime i.e.
MALLOC_ARENA_MAX, and MALLOC_ARENA_TEST.

This change describes these two options in the mallopt man page
along with their environment variables.

Tested with glibc master on x86_64 to verify it works as expected.
Tested patch with linux man pages master.
Please apply.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man3/mallopt.3 b/man3/mallopt.3
index cb3da4c..53d17a0 100644
--- a/man3/mallopt.3
+++ b/man3/mallopt.3
@@ -45,6 +45,36 @@ specifies the new value for that parameter.
 The following values can be specified for
 .IR param :
 .TP
+.BR M_ARENA_MAX
+is the maximum number of arenas that can be created. The value of
+M_ARENA_TEST is not used when M_ARENA_MAX is defined.
+An arena represents a pool of memory that can be used by malloc
+calls to service allocation requests. Arenas are thread safe and
+therefore may have multiple concurrent memory requests. The
+trade-off is between number of threads and number of arenas.
+The more arenas you have the lower the per-thread contention,
+but the higher the memory usage.
+This parameter has been available since glibc 2.10 via
+--enable-experimental-malloc, or glibc 2.15 by default.
+In some versions of the allocator there was no limit on the number
+of created arenas e.g. CentOS 5, RHEL 5. When running programs on
+newer glibc these applications may exhibit high contention when
+accessing arenas. In these cases it may be beneficial to increase
+M_ARENA_MAX to match the number of threads. This is similar in behaviour
+to strategies taken by tcmalloc and jemalloc e.g. per-thread allocation
+pools.
+.TP
+.BR M_ARENA_TEST
+is the limit, in number of arenas created, at which the system
+configuration will be examined to evaluate a hard limit on the
+number of created arenas. The computed limit is implementation
+defined and usually a multiple of the number of available cores.
+Once the limit is computed the result is final and constrains
+the total number of arenas.
+See M_ARENA_MAX for the definition of an arena.
+This parameter has been available since glibc 2.10 via
+--enable-experimental-malloc, or glibc 2.15 by default.
+.TP
 .BR M_CHECK_ACTION
 Setting this parameter controls how glibc responds when various kinds
 of programming errors are detected (e.g., freeing the same pointer twice).
@@ -286,22 +316,7 @@ is a trade-off between increasing the number of system calls
 (when the parameter is set low)
 and wasting unused memory at the top of the heap
 (when the parameter is set high).
-.\" FIXME Do the arena parameters need to be documented?
-.\" .TP
-.\" .BR M_ARENA_TEST " (since glibc 2.10)"
-.\" .TP
-.\" .BR M_ARENA_MAX " (since glibc 2.10)"
-.\"
-.\" Environment variables
-.\"     MALLOC_ARENA_MAX_
-.\"     MALLOC_ARENA_TEST_
-.\"
-.\" http://udrepper.livejournal.com/20948.html describes some details
-.\"	of the MALLOC_ARENA_* environment variables.
-.\"
-.\" These macros aren't enabled in production releases until 2.15?
-.\" (see glibc malloc/Makefile)
-.\"
+
 .SS Environment variables
 A number of environment variables can be defined
 to modify some of the same parameters as are controlled by
@@ -319,7 +334,17 @@ For security reasons,
 these variables are ignored in set-user-ID and set-group-ID programs.
 
 The environment variables are as follows
-(note the trailing underscore at the end of the name of each variable):
+(note the trailing underscore at the end of the name of some variables):
+.TP
+.BR MALLOC_ARENA_MAX
+Controls the same parameter as
+.BR mallopt ()
+.BR M_ARENA_MAX .
+.TP
+.BR MALLOC_ARENA_TEST
+Controls the same parameter as
+.BR mallopt ()
+.BR M_ARENA_TEST .
 .TP
 .BR MALLOC_CHECK_
 This environment variable controls the same parameter as
---


Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
