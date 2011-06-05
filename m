From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: ffix: properly escape minus sign
Date: Sun, 5 Jun 2011 02:31:19 +0200
Message-ID: <20110605003119.GF28455@glenfiddich.mraw.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KDt/GgjP6HVcx58l"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here is a another patch on many manpages, in order to properly escape minus
sign (or it's hyphen).

http://lintian.debian.org/full/joey-8fiUuRrzOP0h++r+LBE8gg@public.gmane.org#manpages
http://lintian.debian.org/tags/hyphen-used-as-minus-sign.html

-- 
Simon Paillard

--KDt/GgjP6HVcx58l
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0003-ffix-properly-escape-minus-sign.patch"

>From f650abe4d60d4fe24f1cc973cf6b84b5cacac743 Mon Sep 17 00:00:00 2001
From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Date: Sun, 5 Jun 2011 02:28:00 +0200
Subject: [PATCH 3/3] ffix: properly escape minus sign

From:
http://lintian.debian.org/full/joey-8fiUuRrzOP0h++r+LBE8gg@public.gmane.org#manpages
http://lintian.debian.org/tags/hyphen-used-as-minus-sign.html
---
 man2/fallocate.2             |    2 +-
 man2/kexec_load.2            |    2 +-
 man2/poll.2                  |    2 +-
 man2/spu_run.2               |    6 +++---
 man3/atan2.3                 |    4 ++--
 man3/cbrt.3                  |    2 +-
 man3/clock_getcpuclockid.3   |    2 +-
 man3/end.3                   |    2 +-
 man3/frexp.3                 |    2 +-
 man3/getgrouplist.3          |    2 +-
 man3/getifaddrs.3            |    2 +-
 man3/matherr.3               |    8 ++++----
 man3/modf.3                  |    2 +-
 man3/pow.3                   |    4 ++--
 man3/pthread_getattr_np.3    |    4 ++--
 man3/pthread_getcpuclockid.3 |    2 +-
 man3/sched_getcpu.3          |    2 +-
 man3/tgamma.3                |    4 ++--
 man4/mouse.4                 |    2 +-
 man5/proc.5                  |    2 +-
 man7/feature_test_macros.7   |    4 ++--
 man7/spufs.7                 |    2 +-
 22 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 42eefbd..443a81f 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -78,7 +78,7 @@ Because allocation is done in block size chunks,
 may allocate a larger range than that which was specified.
 .SH RETURN VALUE
 .BR fallocate ()
-returns zero on success, and -1 on failure.
+returns zero on success, and \-1 on failure.
 .SH ERRORS
 .TP
 .B EBADF
diff --git a/man2/kexec_load.2 b/man2/kexec_load.2
index 325ecec..0afa887 100644
--- a/man2/kexec_load.2
+++ b/man2/kexec_load.2
@@ -111,7 +111,7 @@ is copied from the calling process into previously reserved memory.
 On success,
 .BR kexec_load ()
 returns 0.
-On error, -1 is returned and
+On error, \-1 is returned and
 .I errno
 is set to indicate the error.
 .SH ERRORS
diff --git a/man2/poll.2 b/man2/poll.2
index 44986fa..1c7c89a 100644
--- a/man2/poll.2
+++ b/man2/poll.2
@@ -207,7 +207,7 @@ executing the following calls:
     sigset_t origmask;
     int timeout;
 
-    timeout = (timeout_ts == NULL) ? -1 :
+    timeout = (timeout_ts == NULL) ? \-1 :
               (timeout_ts.tv_sec * 1000 + timeout_ts.tv_nsec / 1000000);
     sigprocmask(SIG_SETMASK, &sigmask, &origmask);
     ready = poll(&fds, nfds, timeout);
diff --git a/man2/spu_run.2 b/man2/spu_run.2
index 3caf734..2cb891f 100644
--- a/man2/spu_run.2
+++ b/man2/spu_run.2
@@ -222,7 +222,7 @@ int main(void)
     uint32_t instruction, npc;
 
     context = spu_create("/spu/example\-context", 0, 0755);
-    if (context == -1)
+    if (context == \-1)
         handle_error("spu_create");
 
     /* write a \(aqstop 0x1234\(aq instruction to the SPU\(aqs
@@ -231,7 +231,7 @@ int main(void)
     instruction = 0x00001234;
 
     fd = open("/spu/example\-context/mem", O_RDWR);
-    if (fd == -1)
+    if (fd == \-1)
         handle_error("open");
     write(fd, &instruction, sizeof(instruction));
 
@@ -242,7 +242,7 @@ int main(void)
     npc = 0;
 
     spu_status = spu_run(context, &npc, NULL);
-    if (spu_status == -1)
+    if (spu_status == \-1)
         handle_error("open");
 
     /* we should see a status code of 0x1234002:
diff --git a/man3/atan2.3 b/man3/atan2.3
index 5d837ca..e973ade 100644
--- a/man3/atan2.3
+++ b/man3/atan2.3
@@ -147,13 +147,13 @@ If
 .I y
 is positive infinity (negative infinity) and
 .I x
-is negative infinity, +3*pi/4 (-3*pi/4) is returned.
+is negative infinity, +3*pi/4 (\-3*pi/4) is returned.
 
 If
 .I y
 is positive infinity (negative infinity) and
 .I x
-is positive infinity, +pi/4 (-pi/4) is returned.
+is positive infinity, +pi/4 (\-pi/4) is returned.
 .\"
 .\" POSIX.1 says:
 .\" If both arguments are 0, a domain error shall not occur.
diff --git a/man3/cbrt.3 b/man3/cbrt.3
index b2563c1..041d401 100644
--- a/man3/cbrt.3
+++ b/man3/cbrt.3
@@ -79,7 +79,7 @@ These functions return the cube root of
 
 If
 .I x
-is +0, -0, positive infinity, negative infinity, or NaN,
+is +0, \-0, positive infinity, negative infinity, or NaN,
 .I x
 is returned.
 .SH ERRORS
diff --git a/man3/clock_getcpuclockid.3 b/man3/clock_getcpuclockid.3
index a939b9b..76e65cd 100644
--- a/man3/clock_getcpuclockid.3
+++ b/man3/clock_getcpuclockid.3
@@ -134,7 +134,7 @@ main(int argc, char *argv[])
 	exit(EXIT_FAILURE);
     }
 
-    if (clock_gettime(clockid, &ts) == -1) {
+    if (clock_gettime(clockid, &ts) == \-1) {
 	perror("clock_gettime");
 	exit(EXIT_FAILURE);
     }
diff --git a/man3/end.3 b/man3/end.3
index 877a6eb..5a326a8 100644
--- a/man3/end.3
+++ b/man3/end.3
@@ -91,7 +91,7 @@ First address past:
 #include <stdlib.h>
 
 extern char etext, edata, end; /* The symbols must have some type,
-                                   or "gcc -Wall" complains */
+                                   or "gcc \-Wall" complains */
 
 int
 main(int argc, char *argv[])
diff --git a/man3/frexp.3 b/man3/frexp.3
index 8b69608..325c822 100644
--- a/man3/frexp.3
+++ b/man3/frexp.3
@@ -107,7 +107,7 @@ The program below produces results such as the following:
 .RB "$" " ./a.out 2560"
 frexp(2560, &e) = 0.625: 0.625 * 2^12 = 2560
 .RB "$" " ./a.out \-4"
-frexp(\-4, &e) = \-0.5: \-0.5 * 2^3 = -4
+frexp(\-4, &e) = \-0.5: \-0.5 * 2^3 = \-4
 .in
 .fi
 .SS Program source
diff --git a/man3/getgrouplist.3 b/man3/getgrouplist.3
index f50eb47..7c9f339 100644
--- a/man3/getgrouplist.3
+++ b/man3/getgrouplist.3
@@ -117,7 +117,7 @@ The following shell session shows examples of the use of this program:
 .nf
 
 .RB "$" " ./a.out cecilia 0"
-getgrouplist() returned -1; ngroups = 3
+getgrouplist() returned \-1; ngroups = 3
 .RB "$" " ./a.out cecilia 3"
 ngroups = 3
 16 (dialout)
diff --git a/man3/getifaddrs.3 b/man3/getifaddrs.3
index 4e91079..009c4f1 100644
--- a/man3/getifaddrs.3
+++ b/man3/getifaddrs.3
@@ -138,7 +138,7 @@ when no longer needed.
 On success,
 .BR getifaddrs ()
 returns zero;
-on error, -1 is returned, and
+on error, \-1 is returned, and
 .I errno
 is set appropriately.
 .SH ERRORS
diff --git a/man3/matherr.3 b/man3/matherr.3
index 42dabb1..62a12e8 100644
--- a/man3/matherr.3
+++ b/man3/matherr.3
@@ -253,7 +253,7 @@ tgamma(0)	SING	copysign(	y	ERANGE
 log(0)	SING	\-HUGE	y	EDOM
 log(x<0)	DOMAIN	\-HUGE	y	EDOM
 log2(0)	SING	\-HUGE	n	EDOM	\" different from log()
-log2(x<0)	DOMAIN	-HUGE	n	EDOM	\" different from log()
+log2(x<0)	DOMAIN	\-HUGE	n	EDOM	\" different from log()
 log10(0)	SING	\-HUGE	y	EDOM
 log10(x<0)	DOMAIN	\-HUGE	y	EDOM
 pow(0.0,0.0)	DOMAIN	0.0	y	EDOM
@@ -314,7 +314,7 @@ is called, and returns 0:
 .RB "$" " ./a.out 0.0 0"
 matherr SING exception in log() function
         args:   0.000000, 0.000000
-        retval: -340282346638528859811704183484516925440.000000
+        retval: \-340282346638528859811704183484516925440.000000
 log: SING error
 errno: Numerical argument out of domain
 x=-340282346638528859811704183484516925440.000000
@@ -332,7 +332,7 @@ is called, and returns a nonzero value:
 .RB "$" " ./a.out 0.0 1"
 matherr SING exception in log() function
         args:   0.000000, 0.000000
-        retval: -340282346638528859811704183484516925440.000000
+        retval: \-340282346638528859811704183484516925440.000000
 x=-340282346638528859811704183484516925440.000000
 .fi
 .in
@@ -351,7 +351,7 @@ and returns a nonzero value:
 .RB "$" " ./a.out 0.0 1 12345.0"
 matherr SING exception in log() function
         args:   0.000000, 0.000000
-        retval: -340282346638528859811704183484516925440.000000
+        retval: \-340282346638528859811704183484516925440.000000
 x=12345.000000
 .fi
 .in
diff --git a/man3/modf.3 b/man3/modf.3
index ee72384..4460a23 100644
--- a/man3/modf.3
+++ b/man3/modf.3
@@ -80,7 +80,7 @@ is set to a NaN.
 
 If
 .I x
-is positive infinity (negative infinity), +0 (-0) is returned, and
+is positive infinity (negative infinity), +0 (\-0) is returned, and
 .IR *iptr
 is set to positive infinity (negative infinity).
 .SH ERRORS
diff --git a/man3/pow.3 b/man3/pow.3
index 659c7ed..89ebcdb 100644
--- a/man3/pow.3
+++ b/man3/pow.3
@@ -222,7 +222,7 @@ the result is positive infinity.
 
 If
 .I x
-is +0 or -0,
+is +0 or \-0,
 and
 .I y
 is an odd integer less than 0,
@@ -237,7 +237,7 @@ with the same sign as
 
 If
 .I x
-is +0 or -0,
+is +0 or \-0,
 and
 .I y
 is less than 0 and not an odd integer,
diff --git a/man3/pthread_getattr_np.3 b/man3/pthread_getattr_np.3
index fda354d..b8d4dfb 100644
--- a/man3/pthread_getattr_np.3
+++ b/man3/pthread_getattr_np.3
@@ -240,7 +240,7 @@ usage(char *pname, char *msg)
 {
     if (msg != NULL)
         fputs(msg, stderr);
-    fprintf(stderr, "Usage: %s [\-s stack-size [-a]]"
+    fprintf(stderr, "Usage: %s [\-s stack-size [\-a]]"
             " [\-g guard-size]\\n", pname);
     fprintf(stderr, "\\t\\t\-a means program should allocate stack\\n");
     exit(EXIT_FAILURE);
@@ -269,7 +269,7 @@ get_thread_attributes_from_cl(int argc, char *argv[],
     }
 
     if (allocate_stack && stack_size == \-1)
-        usage(argv[0], "Specifying \-a without -s makes no sense\\n");
+        usage(argv[0], "Specifying \-a without \-s makes no sense\\n");
 
     if (argc > optind)
         usage(argv[0], "Extraneous command\-line arguments\\n");
diff --git a/man3/pthread_getcpuclockid.3 b/man3/pthread_getcpuclockid.3
index de03fe5..114cff2 100644
--- a/man3/pthread_getcpuclockid.3
+++ b/man3/pthread_getcpuclockid.3
@@ -92,7 +92,7 @@ Subthread CPU time:        0.992
 .SS Program source
 \&
 .nf
-/* Link with "-lrt" */
+/* Link with "\-lrt" */
 
 #include <time.h>
 #include <stdio.h>
diff --git a/man3/sched_getcpu.3 b/man3/sched_getcpu.3
index ebbb472..92601ef 100644
--- a/man3/sched_getcpu.3
+++ b/man3/sched_getcpu.3
@@ -69,7 +69,7 @@ call:
 
 int c, s;
 s = getcpu(&c, NULL, NULL);
-cpu = (s == -1) ? s : c;
+cpu = (s == \-1) ? s : c;
 .fi
 .in
 .SH SEE ALSO
diff --git a/man3/tgamma.3 b/man3/tgamma.3
index 013cdc1..077ddba 100644
--- a/man3/tgamma.3
+++ b/man3/tgamma.3
@@ -87,7 +87,7 @@ and the functions return 0, with the correct mathematical sign.
 
 If
 .I x
-is -0 or +0,
+is \-0 or +0,
 a pole error occurs,
 and the functions return
 .BR HUGE_VAL ,
@@ -169,7 +169,7 @@ is not set (it should be set to
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6809
 
 In glibc versions 2.3.3 and earlier,
-an argument of +0 or -0 incorrectly produced a domain error
+an argument of +0 or \-0 incorrectly produced a domain error
 .RI ( errno
 set to
 .B EDOM
diff --git a/man4/mouse.4 b/man4/mouse.4
index 29b4da0..c701bc4 100644
--- a/man4/mouse.4
+++ b/man4/mouse.4
@@ -37,7 +37,7 @@ center;
 r c l.
 pin	name	used for
 2	RX	Data
-3	TX	-12 V, Imax = 10 mA
+3	TX	\-12 V, Imax = 10 mA
 4	DTR	+12 V, Imax = 10 mA
 7	RTS	+12 V, Imax = 10 mA
 5	GND	Ground
diff --git a/man5/proc.5 b/man5/proc.5
index 7c5ca4e..b2f8926 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1126,7 +1126,7 @@ are the same as those provided by :
 .in +4n
 .nf
 
-cat /lib/modules/$(uname -r)/build/.config
+cat /lib/modules/$(uname \-r)/build/.config
 .fi
 .in
 .IP
diff --git a/man7/feature_test_macros.7 b/man7/feature_test_macros.7
index e08bd7c..24131e2 100644
--- a/man7/feature_test_macros.7
+++ b/man7/feature_test_macros.7
@@ -485,12 +485,12 @@ _POSIX_C_SOURCE defined: 200809L
 _BSD_SOURCE defined
 _SVID_SOURCE defined
 _ATFILE_SOURCE defined
-$ \fBcc -D_XOPEN_SOURCE=500 ftm.c\fP
+$ \fBcc \-D_XOPEN_SOURCE=500 ftm.c\fP
 $ \fB./a.out\fP
 _POSIX_SOURCE defined
 _POSIX_C_SOURCE defined: 199506L
 _XOPEN_SOURCE defined: 500
-$ \fBcc -D_GNU_SOURCE ftm.c\fP
+$ \fBcc \-D_GNU_SOURCE ftm.c\fP
 $ \fB./a.out\fP
 _POSIX_SOURCE defined
 _POSIX_C_SOURCE defined: 200809L
diff --git a/man7/spufs.7 b/man7/spufs.7
index ee65298..9caea7c 100644
--- a/man7/spufs.7
+++ b/man7/spufs.7
@@ -735,7 +735,7 @@ mappings are supported.
 Read-only file containing the physical SPU number that the SPU context
 is running on.
 When the context is not running, this file contains the
-string "-1".
+string "\-1".
 
 The physical SPU number is given by an ASCII hex string.
 .TP
-- 
1.7.2.5


--KDt/GgjP6HVcx58l--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
