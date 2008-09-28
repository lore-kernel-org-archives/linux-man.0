From: Nicolas =?iso-8859-1?Q?Fran=E7ois?=
	<nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org>
Subject: [patch] various typos
Date: Sun, 28 Sep 2008 18:35:29 +0200
Message-ID: <20080928163529.GA7009@nekral.nekral.homelinux.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please find attached a patch against 3.10 that fix some typos (but also
contains some proposals).

Thanks in advance,
-- 
Nekral

--OgqxwSJOaUobr8KG
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="man-pages-3.10.diff"

diff -rauN ../man-pages-3.10.orig/man2/brk.2 ./man2/brk.2
--- ../man-pages-3.10.orig/man2/brk.2	2008-09-23 15:52:21.000000000 +0200
+++ ./man2/brk.2	2008-09-28 17:16:34.937899258 +0200
@@ -138,7 +138,7 @@
 On failure, the system call returns the current break.
 The glibc wrapper function does some work
 (i.e., checks whether the new break is less than
-.I addr )
+.IR addr )
 to provide the 0 and \-1 return values described above.
 
 On Linux,
diff -rauN ../man-pages-3.10.orig/man2/clock_nanosleep.2 ./man2/clock_nanosleep.2
--- ../man-pages-3.10.orig/man2/clock_nanosleep.2	2008-09-23 15:52:22.000000000 +0200
+++ ./man2/clock_nanosleep.2	2008-09-28 17:17:11.464966432 +0200
@@ -146,6 +146,7 @@
 If the call is interrupted by a signal handler or encounters an error,
 then it returns a positive error number.
 .SH ERRORS
+.TP
 .B EFAULT
 .I request
 or
diff -rauN ../man-pages-3.10.orig/man2/fchmodat.2 ./man2/fchmodat.2
--- ../man-pages-3.10.orig/man2/fchmodat.2	2008-09-23 15:52:22.000000000 +0200
+++ ./man2/fchmodat.2	2008-09-28 17:17:29.960873173 +0200
@@ -127,7 +127,7 @@
 .SH "SEE ALSO"
 .BR chmod (2),
 .BR openat (2),
-.BR path_resolution (7)
+.BR path_resolution (7),
 .BR symlink (7)
 .SH COLOPHON
 This page is part of release 3.10 of the Linux
diff -rauN ../man-pages-3.10.orig/man2/getcpu.2 ./man2/getcpu.2
--- ../man-pages-3.10.orig/man2/getcpu.2	2008-09-23 15:52:22.000000000 +0200
+++ ./man2/getcpu.2	2008-09-28 17:18:45.158573887 +0200
@@ -121,7 +121,7 @@
 .BR mbind (2),
 .BR sched_setaffinity (2),
 .BR set_mempolicy (2),
-.BR sched_getcpu (3)
+.BR sched_getcpu (3),
 .BR cpuset (7)
 .SH COLOPHON
 This page is part of release 3.10 of the Linux
diff -rauN ../man-pages-3.10.orig/man2/getgroups.2 ./man2/getgroups.2
--- ../man-pages-3.10.orig/man2/getgroups.2	2008-09-23 15:52:22.000000000 +0200
+++ ./man2/getgroups.2	2008-09-28 17:19:28.037479062 +0200
@@ -92,7 +92,7 @@
 .SH "RETURN VALUE"
 On success,
 .BR getgroups ()
-returns the number of supplementary group IDs is returned.
+returns the number of supplementary group IDs.
 On error, \-1 is returned, and
 .I errno
 is set appropriately.
diff -rauN ../man-pages-3.10.orig/man2/mbind.2 ./man2/mbind.2
--- ../man-pages-3.10.orig/man2/mbind.2	2008-09-23 15:52:25.000000000 +0200
+++ ./man2/mbind.2	2008-09-28 17:21:15.025373035 +0200
@@ -131,7 +131,7 @@
 A non-empty
 .I nodemask
 specifies physical node ids.
-Linux does will not remap the
+Linux will not remap the
 .I nodemask
 when the process moves to a different cpuset context,
 nor when the set of nodes allowed by the process's
@@ -392,7 +392,7 @@
 flag.
 
 The
-.BR MPOL_DEFAULT ,
+.B MPOL_DEFAULT
 mode can have different effects for
 .BR mbind ()
 and
diff -rauN ../man-pages-3.10.orig/man2/mount.2 ./man2/mount.2
--- ../man-pages-3.10.orig/man2/mount.2	2008-09-23 15:52:25.000000000 +0200
+++ ./man2/mount.2	2008-09-28 17:22:39.632873246 +0200
@@ -123,12 +123,11 @@
 .I mountflags
 was also ignored
 .\" with the exception of the "hidden" MS_REC mountflags bit
-(the bind mound has the same mount options as
+(the bind mount has the same mount options as
 the underlying mount point).
 Since Linux 2.6.26, the
 .B MS_RDONLY
 flag is honored when making a bind mount.
-Since Linux 2.6.2
 .TP
 .BR MS_DIRSYNC " (since Linux 2.5.19)"
 Make directory changes on this file system synchronous.
diff -rauN ../man-pages-3.10.orig/man2/move_pages.2 ./man2/move_pages.2
--- ../man-pages-3.10.orig/man2/move_pages.2	2008-09-23 15:52:25.000000000 +0200
+++ ./man2/move_pages.2	2008-09-28 17:24:33.725672734 +0200
@@ -150,7 +150,7 @@
 .B E2BIG
 Too many pages to move.
 .TP
-.B EACCESS
+.B EACCES
 .\" FIXME Clarify "current cpuset".  Is that the cpuset of the caller
 .\" or the target?
 One of the target nodes is not allowed by the current cpuset.
@@ -179,7 +179,7 @@
 .B MPOL_MF_MOVE_ALL
 without sufficient privileges
 .RB ( CAP_SYS_NICE ).
-Or, the caller attempted to move a process belonging to another user
+Or, the caller attempted to move a page of a process belonging to another user
 but did not have privilege to do so
 .RB ( CAP_SYS_NICE ).
 .TP
diff -rauN ../man-pages-3.10.orig/man2/prctl.2 ./man2/prctl.2
--- ../man-pages-3.10.orig/man2/prctl.2	2008-09-23 15:52:25.000000000 +0200
+++ ./man2/prctl.2	2008-09-28 17:28:17.092920349 +0200
@@ -225,7 +225,7 @@
 the only system calls that the thread is permitted to make are
 .BR read (2),
 .BR write (2),
-.BR _exit(2),
+.BR _exit (2),
 and
 .BR sigreturn (2).
 Other system calls result in the delivery of a
@@ -343,7 +343,8 @@
 .B EINVAL
 The value of
 .I option
-is not recognized
+is not recognized.
+.TP
 .B EINVAL
 .I arg2
 is not valid value for this
diff -rauN ../man-pages-3.10.orig/man2/recv.2 ./man2/recv.2
--- ../man-pages-3.10.orig/man2/recv.2	2008-09-23 15:52:26.000000000 +0200
+++ ./man2/recv.2	2008-09-28 17:30:37.060873068 +0200
@@ -145,7 +145,7 @@
 .B F_SETFL
 .BR fcntl (2)).
 .TP
-.B MSG_ERRQUEUE
+.BR MSG_ERRQUEUE " (since Linux 2.2)"
 This flag
 specifies that queued errors should be received from the socket error queue.
 The error is passed in
@@ -232,7 +232,7 @@
 .IR cmsghdr ).
 For error receives,
 the
-.BR MSG_ERRQUEUE " (since Linux 2.2)"
+.B MSG_ERRQUEUE
 is set in the
 .IR msghdr .
 After an error has been passed, the pending socket error
diff -rauN ../man-pages-3.10.orig/man2/send.2 ./man2/send.2
--- ../man-pages-3.10.orig/man2/send.2	2008-09-23 15:52:26.000000000 +0200
+++ ./man2/send.2	2008-09-28 17:32:10.816872989 +0200
@@ -156,6 +156,7 @@
 argument is the bitwise OR
 of zero or more of the following flags.
 .\" FIXME ? document MSG_PROXY (which went away in 2.3.15)
+.\" Linux 2.3+ only is not really clear
 .TP
 .BR MSG_CONFIRM " (Linux 2.3+ only)"
 Tell the link layer that forward progress happened: you got a successful
diff -rauN ../man-pages-3.10.orig/man2/utimensat.2 ./man2/utimensat.2
--- ../man-pages-3.10.orig/man2/utimensat.2	2008-09-23 15:52:28.000000000 +0200
+++ ./man2/utimensat.2	2008-09-28 17:37:36.217691225 +0200
@@ -46,6 +46,7 @@
 .br
 .BR futimens ():
 .\" FIXME . Fix the FTM after next POSIX.1 is released.
+.\" Which revision?
 _GNU_SOURCE  /* Will change after next POSIX.1 revision */
 .SH DESCRIPTION
 .BR utimensat ()
@@ -226,7 +227,7 @@
 .PD 0
 .RS
 .IP * 2
-the effective effective ID of the caller does not match
+the effective user ID of the caller does not match
 the owner of the file,
 the caller does not have write access to the file,
 and the caller is not privileged
@@ -479,7 +480,7 @@
 .B UTIME_OMIT
 isn't treated the same as specifying
 .I times
-as a pointer to a structure containing arbitrary time values.
+as a pointer to an array of structures containing arbitrary time values.
 As a result, in some cases:
 a) file timestamps can be updated by a process that shouldn't have
 permission to perform updates;
@@ -570,11 +571,11 @@
 .I times
 as NULL, or with
 .I times
-pointing to a structure in which both
+pointing to an array of structures in which both
 .I tv_nsec
 fields are
 .BR UTIME_NOW ,
-in order to update the both timestamps to the current time.
+in order to update both timestamps to the current time.
 However,
 .BR futimens ()
 instead checks whether the
diff -rauN ../man-pages-3.10.orig/man3/asin.3 ./man3/asin.3
--- ../man-pages-3.10.orig/man3/asin.3	2008-09-23 15:52:29.000000000 +0200
+++ ./man3/asin.3	2008-09-28 17:38:07.208899530 +0200
@@ -78,7 +78,7 @@
 
 If
 .I x
-outside the range [\-1,\ 1],
+is outside the range [\-1,\ 1],
 a domain error occurs,
 and a NaN is returned.
 .\"
diff -rauN ../man-pages-3.10.orig/man3/atan2.3 ./man3/atan2.3
--- ../man-pages-3.10.orig/man3/atan2.3	2008-09-23 15:52:29.000000000 +0200
+++ ./man3/atan2.3	2008-09-28 17:39:19.204893061 +0200
@@ -65,7 +65,7 @@
 .SH "RETURN VALUE"
 On success, these functions return the principal value of the arc tangent of
 .IR y/x
-in radians; the return value is in the range [\-pi/2,\ pi/2].
+in radians; the return value is in the range [\-pi,\ pi].
 
 If
 .I y
@@ -161,8 +161,6 @@
 The variant returning
 .I double
 also conforms to
-.I double
-variant also conforms to
 SVr4, 4.3BSD, C89.
 .SH "SEE ALSO"
 .BR acos (3),
diff -rauN ../man-pages-3.10.orig/man3/clock_getcpuclockid.3 ./man3/clock_getcpuclockid.3
--- ../man-pages-3.10.orig/man3/clock_getcpuclockid.3	2008-09-23 15:52:30.000000000 +0200
+++ ./man3/clock_getcpuclockid.3	2008-09-28 17:40:20.645491985 +0200
@@ -43,7 +43,7 @@
 .SH DESCRIPTION
 The
 .BR clock_getcpuclockid ()
-obtains the ID of the CPU-time clock of the process whose ID is
+function obtains the ID of the CPU-time clock of the process whose ID is
 .IR pid ,
 and returns it in the location pointed to by
 .IR clock_id .
diff -rauN ../man-pages-3.10.orig/man3/cmsg.3 ./man3/cmsg.3
--- ../man-pages-3.10.orig/man3/cmsg.3	2008-09-23 15:52:31.000000000 +0200
+++ ./man3/cmsg.3	2008-09-28 17:41:29.235740441 +0200
@@ -110,11 +110,11 @@
 In each control message, initialize
 .I cmsg_len
 (with
-.BR CMSG_LEN ),
+.BR CMSG_LEN ()),
 the other
 .I cmsghdr
 header fields, and the data portion using
-.BR CMSG_DATA .
+.BR CMSG_DATA ().
 Finally, the
 .I msg_controllen
 field of the
diff -rauN ../man-pages-3.10.orig/man3/copysign.3 ./man3/copysign.3
--- ../man-pages-3.10.orig/man3/copysign.3	2008-09-23 15:52:31.000000000 +0200
+++ ./man3/copysign.3	2008-09-28 17:41:57.760872563 +0200
@@ -62,6 +62,7 @@
 .SH RETURN VALUE
 On success, these functions return a value whose magnitude is taken from
 .I x
+.\" abd?
 abd whose sign is taken from
 .IR y .
 
diff -rauN ../man-pages-3.10.orig/man3/erf.3 ./man3/erf.3
--- ../man-pages-3.10.orig/man3/erf.3	2008-09-23 15:52:32.000000000 +0200
+++ ./man3/erf.3	2008-09-28 17:44:20.876872745 +0200
@@ -69,7 +69,7 @@
 .SH RETURN VALUE
 On success, these functions return the error function of
 .IR x ,
-a value in the range [\-1,1].
+a value in the range [\-1,\ 1].
 
 If
 .I x
diff -rauN ../man-pages-3.10.orig/man3/fenv.3 ./man3/fenv.3
--- ../man-pages-3.10.orig/man3/fenv.3	2008-09-23 15:52:32.000000000 +0200
+++ ./man3/fenv.3	2008-09-28 17:45:23.485758807 +0200
@@ -83,7 +83,11 @@
 .I inexact
 exception occurs when the rounded result of an operation
 is not equal to the infinite precision result.
-It may occur whenever Overflow or Underflow occurs.
+It may occur whenever
+.I overflow
+or
+.I underflow
+occurs.
 .LP
 The
 .I invalid
@@ -148,7 +152,7 @@
 .I excepts
 and for which the corresponding exception is currently set.
 .SS Rounding mode
-The rounding  mode determines how the result of floating-point operation
+The rounding  mode determines how the result of floating-point operations
 is treated when the result cannot be exactly represented in the signifcand.
 Various rounding modes may be provided:
 round to nearest (the default),
diff -rauN ../man-pages-3.10.orig/man3/floor.3 ./man3/floor.3
--- ../man-pages-3.10.orig/man3/floor.3	2008-09-23 15:52:33.000000000 +0200
+++ ./man3/floor.3	2008-09-28 17:46:25.180882020 +0200
@@ -50,7 +50,7 @@
 .I cc\ -std=c99
 .ad b
 .SH DESCRIPTION
-These functions return the smallest integral value that is not greater than
+These functions return the greatest integral value that is not greater than
 .IR x .
 
 For example,
diff -rauN ../man-pages-3.10.orig/man3/fma.3 ./man3/fma.3
--- ../man-pages-3.10.orig/man3/fma.3	2008-09-23 15:52:33.000000000 +0200
+++ ./man3/fma.3	2008-09-28 17:48:35.976873034 +0200
@@ -62,6 +62,8 @@
 a domain error occurs,
 and a NaN is returned.
 
+.\" The following 2 paragraphs could be merged (z being a NaN or not is
+.\" not relevant)
 If one of
 .I x
 or
diff -rauN ../man-pages-3.10.orig/man3/getcwd.3 ./man3/getcwd.3
--- ../man-pages-3.10.orig/man3/getcwd.3	2008-09-23 15:52:34.000000000 +0200
+++ ./man3/getcwd.3	2008-09-28 17:49:04.805058239 +0200
@@ -181,7 +181,7 @@
 .B ERANGE
 The
 .I size
-argument is less than the length of the the absolute pathname of the
+argument is less than the length of the absolute pathname of the
 working directory, including the terminating null byte.
 You need to allocate a bigger array and try again.
 .SH "CONFORMING TO"
diff -rauN ../man-pages-3.10.orig/man3/inet.3 ./man3/inet.3
--- ../man-pages-3.10.orig/man3/inet.3	2008-09-23 15:52:35.000000000 +0200
+++ ./man3/inet.3	2008-09-28 17:51:27.157372855 +0200
@@ -214,7 +214,7 @@
 .BR inet_ntoa ()
 are specified in POSIX.1-2001.
 .BR inet_aton ()
-is not specified in POSIX.1.-2001, but is available on most systems.
+is not specified in POSIX.1-2001, but is available on most systems.
 .SH NOTES
 On the i386 the host byte order is Least Significant Byte
 first (little endian), whereas the network byte order, as used on the
diff -rauN ../man-pages-3.10.orig/man3/log.3 ./man3/log.3
--- ../man-pages-3.10.orig/man3/log.3	2008-09-23 15:52:37.000000000 +0200
+++ ./man3/log.3	2008-09-28 17:52:03.521439304 +0200
@@ -128,7 +128,7 @@
 taking the
 .BR log ()
 of a NaN produces a bogus invalid floating-point
-.RB ( FE_INVALID)
+.RB ( FE_INVALID )
 exception.
 .SH "SEE ALSO"
 .BR cbrt (3),
diff -rauN ../man-pages-3.10.orig/man3/matherr.3 ./man3/matherr.3
--- ../man-pages-3.10.orig/man3/matherr.3	2008-09-23 15:52:37.000000000 +0200
+++ ./man3/matherr.3	2008-09-28 17:53:30.865312828 +0200
@@ -112,6 +112,7 @@
 In most cases,
 .I errno
 is set to
+.\" In case of a pole error, isn't it ERANGE?
 .BR EDOM .
 .TP
 .B OVERFLOW
diff -rauN ../man-pages-3.10.orig/man3/nextafter.3 ./man3/nextafter.3
--- ../man-pages-3.10.orig/man3/nextafter.3	2008-09-23 15:52:38.000000000 +0200
+++ ./man3/nextafter.3	2008-09-28 17:55:07.774838202 +0200
@@ -56,7 +56,7 @@
 .I y
 is less than
 .IR x ,
-these functions will return the next representable number less than
+these functions will return the greatest representable number less than
 .IR y .
 
 If \fIx\fP equals \fIy\fP, the functions return \fIy\fP.
diff -rauN ../man-pages-3.10.orig/man3/pow.3 ./man3/pow.3
--- ../man-pages-3.10.orig/man3/pow.3	2008-09-23 15:52:38.000000000 +0200
+++ ./man3/pow.3	2008-09-28 17:55:55.789611452 +0200
@@ -346,7 +346,7 @@
 .\" to confirm if this error occurs only in 2.3.2.
 when an overflow or underflow error occurs, glibc's
 .BR pow ()
-generates a bogus invalid floating-point
+generates a bogus invalid floating-point exception
 .RB ( FE_INVALID )
 in addition to the overflow or underflow exception.
 .SH "SEE ALSO"
diff -rauN ../man-pages-3.10.orig/man3/printf.3 ./man3/printf.3
--- ../man-pages-3.10.orig/man3/printf.3	2008-09-23 15:52:38.000000000 +0200
+++ ./man3/printf.3	2008-09-28 17:56:57.564898347 +0200
@@ -835,7 +835,7 @@
 Linux libc5 knows about the five C standard flags and the \(aq flag,
 locale, "%m$" and "*m$".
 It knows about the length modifiers \fBh\fP, \fBl\fP, \fBL\fP,
-\fBZ\fP, iand \fBq\fP, but accepts \fBL\fP and \fBq\fP
+\fBZ\fP, and \fBq\fP, but accepts \fBL\fP and \fBq\fP
 both for \fIlong double\fP and for \fIlong long int\fP (this is a bug).
 It no longer recognizes \fBF\fP, \fBD\fP, \fBO\fP, and \fBU\fP,
 but adds the conversion character
@@ -846,7 +846,7 @@
 glibc 2.0 adds conversion characters \fBC\fP and \fBS\fP.
 .PP
 glibc 2.1 adds length modifiers \fBhh\fP, \fBj\fP, \fBt\fP, and \fBz\fP
-and conversion characters \fBa\fP and\fBA\fP.
+and conversion characters \fBa\fP and \fBA\fP.
 .PP
 glibc 2.2 adds the conversion character \fBF\fP with C99 semantics,
 and the flag character \fBI\fP.
diff -rauN ../man-pages-3.10.orig/man3/rtime.3 ./man3/rtime.3
--- ../man-pages-3.10.orig/man3/rtime.3	2008-09-23 15:52:39.000000000 +0200
+++ ./man3/rtime.3	2008-09-28 17:58:37.177490445 +0200
@@ -23,7 +23,7 @@
 00:00:00 UTC, 1 Jan 1900,
 and this function subtracts the appropriate constant in order to
 convert the result to seconds since
-00:00:00, UTC, 1 Jan 1970, the Unix Epoch.
+00:00:00 UTC, 1 Jan 1970, the Unix Epoch.
 .LP
 When
 .I timeout
diff -rauN ../man-pages-3.10.orig/man3/scalb.3 ./man3/scalb.3
--- ../man-pages-3.10.orig/man3/scalb.3	2008-09-23 15:52:39.000000000 +0200
+++ ./man3/scalb.3	2008-09-28 18:01:18.997358313 +0200
@@ -132,7 +132,7 @@
 The following errors can occur:
 .TP
 Domain error: \fIx\fP is 0, and \fIexp\fP is positive infinity, \
-or \fIx\fP is positive infinity and \fIexp\fP is negative infinity
+or \fIx\fP is positive infinity and \fIexp\fP is negative infinity \
 and the other argument is not a NaN
 .\" .I errno
 .\" is set to
diff -rauN ../man-pages-3.10.orig/man3/scanf.3 ./man3/scanf.3
--- ../man-pages-3.10.orig/man3/scanf.3	2008-09-23 15:52:39.000000000 +0200
+++ ./man3/scanf.3	2008-09-28 18:02:06.500873483 +0200
@@ -536,6 +536,7 @@
 .I errno
 is set indicate the error.
 .SH ERRORS
+.TP
 .B EAGAIN
 The file descriptor underlying
 .I stream
diff -rauN ../man-pages-3.10.orig/man3/strftime.3 ./man3/strftime.3
--- ../man-pages-3.10.orig/man3/strftime.3	2008-09-23 15:52:41.000000000 +0200
+++ ./man3/strftime.3	2008-09-28 18:02:32.100873270 +0200
@@ -160,7 +160,7 @@
 .B %p
 Either "AM" or "PM" according to the given time value, or the
 corresponding strings for the current locale.
-Noon is treated as "pm" and midnight as "am".
+Noon is treated as "PM" and midnight as "AM".
 .TP
 .B %P
 Like
diff -rauN ../man-pages-3.10.orig/man3/tgamma.3 ./man3/tgamma.3
--- ../man-pages-3.10.orig/man3/tgamma.3	2008-09-23 15:52:42.000000000 +0200
+++ ./man3/tgamma.3	2008-09-28 18:04:06.113090514 +0200
@@ -98,7 +98,7 @@
 .PP
 The following errors can occur:
 .TP
-Domain error: \fIx\fP a negative integer, or negative infinity
+Domain error: \fIx\fP is a negative integer, or negative infinity
 .\" FIXME . errno is not set to EDOM for x == -inf
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6809
 .I errno
@@ -125,7 +125,7 @@
 is raised.
 .PP
 glibc also gives the following error which is not specified
-C99 or POSIX.1-2001.
+in C99 or POSIX.1-2001.
 .TP
 Range error: result underflow
 .\" e.g., tgamma(-172.5) on glibc 2.8/x86-32
diff -rauN ../man-pages-3.10.orig/man3/y0.3 ./man3/y0.3
--- ../man-pages-3.10.orig/man3/y0.3	2008-09-23 15:52:44.000000000 +0200
+++ ./man3/y0.3	2008-09-28 18:06:16.877751502 +0200
@@ -230,7 +230,7 @@
 .\" to confirm if this error occurs only in 2.3.2.
 these functions do not raise an invalid floating-point exception
 .RB ( FE_INVALID )
-exception when a domain error occurs.
+when a domain error occurs.
 .SH SEE ALSO
 .BR j0 (3)
 .SH COLOPHON
diff -rauN ../man-pages-3.10.orig/man4/console_codes.4 ./man4/console_codes.4
--- ../man-pages-3.10.orig/man4/console_codes.4	2008-09-23 15:52:44.000000000 +0200
+++ ./man4/console_codes.4	2008-09-28 18:07:25.164901262 +0200
@@ -408,7 +408,7 @@
 .BR setfont (8).
 .SS "Mouse Tracking"
 The mouse tracking facility is intended to return
-.BR (1)xterm (1)-compatible
+.BR xterm (1)-compatible
 mouse status reports.
 Because the console driver has no way to know
 the device or type of the mouse, these reports are returned in the
diff -rauN ../man-pages-3.10.orig/man5/acct.5 ./man5/acct.5
--- ../man-pages-3.10.orig/man5/acct.5	2008-09-23 15:52:44.000000000 +0200
+++ ./man5/acct.5	2008-09-28 18:08:24.648872963 +0200
@@ -27,7 +27,7 @@
 .B #include <sys/acct.h>
 .SH DESCRIPTION
 If the kernel is built with the process accounting option enabled
-.B ( CONFIG_BSD_PROCESS_ACCT ),
+.RB ( CONFIG_BSD_PROCESS_ACCT ),
 then calling
 .BR acct (2)
 starts process accounting, for example:
diff -rauN ../man-pages-3.10.orig/man5/proc.5 ./man5/proc.5
--- ../man-pages-3.10.orig/man5/proc.5	2008-09-23 15:52:45.000000000 +0200
+++ ./man5/proc.5	2008-09-28 18:13:22.900873234 +0200
@@ -1960,7 +1960,7 @@
 .TP
 .I /proc/sys/kernel
 This directory contains files controlling a range of kernel parameters,
-a described below.
+as described below.
 .TP
 .I /proc/sys/kernel/acct
 This file
@@ -2139,7 +2139,7 @@
 .I /proc/sys/kernel/panic
 file is also non-zero then the machine will be rebooted.
 .TP
-.I /proc/sys/kernel/pid_max "( since Linux 2.5.34)"
+.IR /proc/sys/kernel/pid_max "( since Linux 2.5.34)"
 This file specifies the value at which PIDs wrap around
 (i.e., the value in this file is one greater than the maximum PID).
 The default value for this file, 32768,
@@ -2166,7 +2166,7 @@
 .IR console_loglevel ,
 .IR default_message_loglevel ,
 .IR minimum_console_level ,
- and
+and
 .IR default_console_loglevel .
 These values influence
 .I printk()
diff -rauN ../man-pages-3.10.orig/man5/termcap.5 ./man5/termcap.5
--- ../man-pages-3.10.orig/man5/termcap.5	2008-09-23 15:52:45.000000000 +0200
+++ ./man5/termcap.5	2008-09-28 18:13:48.545372905 +0200
@@ -380,7 +380,7 @@
 There are several ways of defining the control codes for string capabilities:
 .LP
 Every normal character represents itself,
-except \(aq^\(aq,\(aq\e\(aq and \(aq%\(aq.
+except \(aq^\(aq, \(aq\e\(aq and \(aq%\(aq.
 .LP
 A \fB^x\fP means Control-x.
 Control-A equals 1 decimal.
diff -rauN ../man-pages-3.10.orig/man5/utmp.5 ./man5/utmp.5
--- ../man-pages-3.10.orig/man5/utmp.5	2008-09-23 15:52:45.000000000 +0200
+++ ./man5/utmp.5	2008-09-28 18:17:02.316872835 +0200
@@ -59,8 +59,8 @@
 #define EMPTY         0 /* Record does not contain valid info
                            (formerly known as UT_UNKNOWN on Linux) */
 #define RUN_LVL       1 /* Change in system run-level (see
-                           \fBinit\fP(8) */
-#define BOOT_TIME     2 /* Time of system booy (in \fIut_tv\fP) */
+                           \fBinit\fP(8)) */
+#define BOOT_TIME     2 /* Time of system boot (in \fIut_tv\fP) */
 #define NEW_TIME      3 /* Time after system clock change
                            (in \fIut_tv\fP) */
 #define OLD_TIME      4 /* Time before system clock change
@@ -97,21 +97,21 @@
        compiled 32- and 64-bit.  This allows data files and shared
        memory to be shared between 32- and 64-bit applications. */
 #if __WORDSIZE == 64 && defined __WORDSIZE_COMPAT32
-    int32_t ut_session;            /* Session ID (\fBgetsid\fP(2)),
-                                      used for windowing */
+    int32_t ut_session;           /* Session ID (\fBgetsid\fP(2)),
+                                     used for windowing */
     struct {
-        int32_t tv_sec;            /* Seconds */
-        int32_t tv_usec;           /* Microseconds */
-    } ut_tv;                       /* Time entry was made */
+        int32_t tv_sec;           /* Seconds */
+        int32_t tv_usec;          /* Microseconds */
+    } ut_tv;                      /* Time entry was made */
 #else
-     long   ut_session;            /* Session ID */
-     struct timeval ut_tv;         /* Time entry was made */
+     long   ut_session;           /* Session ID */
+     struct timeval ut_tv;        /* Time entry was made */
 #endif
 
-    int32_t ut_addr_v6[4];         /* Internet address of remote
-                                      host; IPv4 address uses
-                                      just ut_addr_v6[0] */
-    char __unused[20];             /* Reserved for future use */
+    int32_t ut_addr_v6[4];        /* Internet address of remote
+                                     host; IPv4 address uses
+                                     just ut_addr_v6[0] */
+    char __unused[20];            /* Reserved for future use */
 };
 
 /* Backwards compatibility hacks.  */
@@ -178,7 +178,7 @@
 and other terminal emulators directly create a
 \fBUSER_PROCESS\fP record and generate the \fIut_id\fP by using the
 string that suffix part of the terminal name (the characters
-following \fI/dev/[pt]ty\fP.
+following \fI/dev/[pt]ty\fP).
 If they find a \fBDEAD_PROCESS\fP for this ID,
 they recycle it, otherwise they create a new entry.
 If they can, they
diff -rauN ../man-pages-3.10.orig/man7/cpuset.7 ./man7/cpuset.7
--- ../man-pages-3.10.orig/man7/cpuset.7	2008-09-23 15:52:45.000000000 +0200
+++ ./man7/cpuset.7	2008-09-28 18:19:03.866164829 +0200
@@ -1134,7 +1134,7 @@
 .I mem_exclusive
 on a cpuset whose parent lacks the same setting.
 .TP
-.B EACCESS
+.B EACCES
 Attempted to
 .BR write (2)
 a
@@ -1356,7 +1356,7 @@
 fails with
 .I errno
 set to
-.BR EACCESS ,
+.BR EACCES ,
 and the creation and truncation options on
 .BR open (2)
 have no affect.
diff -rauN ../man-pages-3.10.orig/man7/credentials.7 ./man7/credentials.7
--- ../man-pages-3.10.orig/man7/credentials.7	2008-09-23 15:52:45.000000000 +0200
+++ ./man7/credentials.7	2008-09-28 18:19:28.777528710 +0200
@@ -244,7 +244,7 @@
 that any change to user or group credentials
 (e.g., calls to
 .BR setuid (2),
-.BR setresuid(2),
+.BR setresuid (2),
 etc.)
 is carried through to all of the POSIX threads in a process.
 .SH "SEE ALSO"
diff -rauN ../man-pages-3.10.orig/man7/math_error.7 ./man7/math_error.7
--- ../man-pages-3.10.orig/man7/math_error.7	2008-09-23 15:52:46.000000000 +0200
+++ ./man7/math_error.7	2008-09-28 18:20:38.311753506 +0200
@@ -131,7 +131,7 @@
 .SS Range Error
 A
 .I range error
-occurs when the magnitude of the function result means that it
+occurs when the magnitude of the function result
 cannot be represented in the result type of the function.
 The return value of the function depends on whether the range error
 was an overflow or an underflow.
diff -rauN ../man-pages-3.10.orig/man7/standards.7 ./man7/standards.7
--- ../man-pages-3.10.orig/man7/standards.7	2008-09-23 15:52:46.000000000 +0200
+++ ./man7/standards.7	2008-09-28 18:21:14.982817101 +0200
@@ -242,7 +242,7 @@
 Many of the interfaces that were optional in
 POSIX.1-2001 become mandatory in the next revision of the standard.
 A few interfaces that are present in POSIX.1-2001 are marked
-as obsolete in POSIX.1-2001, or removed from the standard altogether.
+as obsolete in POSIX.1-2008, or removed from the standard altogether.
 
 The revised standard is broken into the same four parts as POSIX.1-2001,
 and again there are two levels of conformance: the baseline
diff -rauN ../man-pages-3.10.orig/man7/udplite.7 ./man7/udplite.7
--- ../man-pages-3.10.orig/man7/udplite.7	2008-09-23 15:52:46.000000000 +0200
+++ ./man7/udplite.7	2008-09-28 18:24:33.840872902 +0200
@@ -94,7 +94,7 @@
 .BR getsockopt (2).
 .TP
 .BR UDPLITE_RECV_CSCOV
-This is the receiver-side analogue and uses uses the same argument format
+This is the receiver-side analogue and uses the same argument format
 and value range as
 .BR UDPLITE_SEND_CSCOV .
 This option is not required to enable traffic with partial checksum
@@ -106,7 +106,7 @@
 
 When the value of
 .B UDPLITE_RECV_CSCOV
-exceeds the actual packet coverage, incoming packets are silently dropped,
+exceeds the actual packet coverage, the incoming packet is silently dropped,
 but may generate a warning message in the system log.
 .\" SO_NO_CHECK exists and is supported by UDPv4, but is
 .\" commented out in socket(7), hence also commented out here
diff -rauN ../man-pages-3.10.orig/man7/unicode.7 ./man7/unicode.7
--- ../man-pages-3.10.orig/man7/unicode.7	2008-09-23 15:52:47.000000000 +0200
+++ ./man7/unicode.7	2008-09-28 18:25:07.872884956 +0200
@@ -257,7 +257,7 @@
 
 A good reference book about the C programming language.
 The fourth
-edition covers the 1994 Amendment 1 to the ISO C 90 standard, which
+edition covers the 1994 Amendment 1 to the ISO C90 standard, which
 adds a large number of new C library functions for handling wide and
 multi-byte character encodings, but it does not yet cover ISO C99,
 which improved wide and multi-byte character support even further.

--OgqxwSJOaUobr8KG--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
