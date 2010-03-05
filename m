From: Mike Hayward <hayward-AB0c8HnZplU@public.gmane.org>
Subject: [PATCH] O_NONBLOCK is NOOP on files and block devices
Date: Fri, 5 Mar 2010 14:08:14 -0700
Message-ID: <201003052108.o25L8EpW013900@alien.loup.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org, kasey.erickson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mvds.00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, greg.freemyer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, hancockrwd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-R6A+fiHC8nRWk0Htik3J/w@public.gmane.org
List-Id: linux-man@vger.kernel.org

After careful testing on various kernel versions, different CPU
architectures, and numerous hardware configurations, timing results
consistently and incontrovertibly indicate that io to block devices
opened with the O_NONBLOCK flag specified do in fact block when they
cannot be immediately serviced with the buffer cache.  This behavior
has been independently confirmed by other contributors to lkml (see
recent discussion).  Alan Cox has confirmed the behavior is the same
with files.

Since changing the behavior of the kernel in this regard is
nontrivial, I am submitting a man-page patch for consideration.

The updated man pages more accurately describe the existing O_NONBLOCK
semantics as well as reserve non-blocking file and block device
semantics for future implementation.

Did I miss any of the relevant read/write calls?

In the process I noticed there is no mention of pread64/pwrite64 in
the pread.2 man page.  I didn't realize until just now that 64 bit
versions of these methods existed (I noticed pread64.2 and pwrite64.2
includes in man2) and I would like to use them instead of doing a 64
bit seek before read/write.  I assume they just take off64_t instead
of off_t?  Is there someone familiar enough with these functions who
could update pread.2?

- Mike

diff -Naur man-pages/man2/open.2 man-pages2/man2/open.2
--- man-pages/man2/open.2	2010-03-05 17:57:27.000000000 +0000
+++ man-pages2/man2/open.2	2010-03-05 20:22:38.000000000 +0000
@@ -401,12 +401,15 @@
 .\" used\fP.
 .TP
 .BR O_NONBLOCK " or " O_NDELAY
-When possible, the file is opened in nonblocking mode.
-Neither the
-.BR open ()
-nor any subsequent operations on the file descriptor which is
-returned will cause the calling process to wait.
-For the handling of FIFOs (named pipes), see also
+For files and block devices, this flag does not currently prevent
+blocking io.  Since such semantics may eventually be implemented,
+usage should not depend upon blocking behavior when specifying this
+flag.  For streaming io (e.g. named pipes), this flag selects a
+non-blocking mode in which neither
+.BR open (2)
+nor any subsequent operations on the file descriptor which is returned
+will cause the calling process to wait.  For the handling of FIFOs
+(named pipes), see also
 .BR fifo (7).
 For a discussion of the effect of
 .B O_NONBLOCK
diff -Naur man-pages/man2/pread.2 man-pages2/man2/pread.2
--- man-pages/man2/pread.2	2010-03-05 17:57:27.000000000 +0000
+++ man-pages2/man2/pread.2	2010-03-05 20:27:33.000000000 +0000
@@ -97,6 +97,13 @@
 on older kernels without the system calls) was added in glibc 2.1.
 .SH "CONFORMING TO"
 POSIX.1-2001.
+.SH NOTES
+.B O_NONBLOCK
+does not currently prevent the calling process thread from blocking
+when writing to files or block devices (i.e. non-streaming file
+descriptors).  Since non-blocking semantics may eventually be
+implemented, usage should not depend upon blocking behavior when this
+flag is specified.
 .SH "SEE ALSO"
 .BR lseek (2),
 .BR read (2),
diff -Naur man-pages/man2/read.2 man-pages2/man2/read.2
--- man-pages/man2/read.2	2010-03-05 17:57:27.000000000 +0000
+++ man-pages2/man2/read.2	2010-03-05 20:24:33.000000000 +0000
@@ -167,14 +167,12 @@
 side attribute caching, but in most situations this will substantially
 increase server load and decrease performance.
 .PP
-Many file systems and disks were considered to be fast enough that the
-implementation of
 .B O_NONBLOCK
-was deemed unnecessary.
-So,
-.B O_NONBLOCK
-may not be available on files
-and/or disks.
+does not currently prevent the calling process thread from blocking
+when reading from files or block devices (i.e. non-streaming file
+descriptors).  Since non-blocking semantics may eventually be
+implemented, usage should not depend upon blocking behavior when this
+flag is specified.
 .SH "SEE ALSO"
 .BR close (2),
 .BR fcntl (2),
diff -Naur man-pages/man2/readv.2 man-pages2/man2/readv.2
--- man-pages/man2/readv.2	2010-03-05 17:57:27.000000000 +0000
+++ man-pages2/man2/readv.2	2010-03-05 20:26:34.000000000 +0000
@@ -189,6 +189,13 @@
 .BR writev ()
 performs the analogous task using a temporary buffer and a call to
 .BR write (2).
+.PP
+.B O_NONBLOCK
+does not currently prevent the calling process thread from blocking
+when writing to files or block devices (i.e. non-streaming file
+descriptors).  Since non-blocking semantics may eventually be
+implemented, usage should not depend upon blocking behavior when this
+flag is specified.
 .SH BUGS
 It is not advisable to mix calls to functions like
 .BR readv ()
diff -Naur man-pages/man2/write.2 man-pages2/man2/write.2
--- man-pages/man2/write.2	2010-03-05 17:57:27.000000000 +0000
+++ man-pages2/man2/write.2	2010-03-05 20:25:46.000000000 +0000
@@ -197,6 +197,13 @@
 .BR EINTR ;
 if it is interrupted after at least one byte has been written,
 the call succeeds, and returns the number of bytes written.
+.PP
+.B O_NONBLOCK
+does not currently prevent the calling process thread from blocking
+when writing to files or block devices (i.e. non-streaming file
+descriptors).  Since non-blocking semantics may eventually be
+implemented, usage should not depend upon blocking behavior when this
+flag is specified.
 .SH "SEE ALSO"
 .BR close (2),
 .BR fcntl (2),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
