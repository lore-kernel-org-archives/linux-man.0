From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: preadv and pwritev man pages
Date: Wed, 9 Feb 2011 14:16:23 +0100
Message-ID: <201102091416.24561.stephan.mueller@atsec.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_oOpUNg6JftQ9x9m"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Boundary-00=_oOpUNg6JftQ9x9m
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

please find attached the diff for the readv and writev man pages to cover the 
preadv and pwritev system calls.

Ciao
Stephan

--Boundary-00=_oOpUNg6JftQ9x9m
Content-Type: text/x-patch;
  charset="UTF-8";
  name="readv.2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="readv.2.diff"

--- readv.2	2011-02-09 14:12:18.609148000 +0100
+++ readv.2.new	2011-02-09 14:13:45.669148002 +0100
@@ -28,7 +28,7 @@
 .\"
 .TH READV 2  2002-10-17 "Linux" "Linux Programmer's Manual"
 .SH NAME
-readv, writev \- read or write data into multiple buffers
+readv, writev, preadv, pwritev \- read or write data into multiple buffers
 .SH SYNOPSIS
 .nf
 .B #include <sys/uio.h>
@@ -36,6 +36,12 @@
 .BI "ssize_t readv(int " fd ", const struct iovec *" iov ", int " iovcnt );
 .sp
 .BI "ssize_t writev(int " fd ", const struct iovec *" iov ", int " iovcnt );
+.sp
+.BI "ssize_t preadv(int " fd ", const struct iovec *" iov ", int " iovcnt ,
+.BI "               unsigned long " pos_l ", unsigned long " pos_h );
+.sp
+.BI "ssize_t pwritev(int " fd ", const struct iovec *" iov ", int " iovcnt ,
+.BI "                unsigned long " pos_l ", unsigned long " pos_h );
 .fi
 .SH DESCRIPTION
 The
@@ -58,6 +64,32 @@
 .I fd
 ("gather output").
 .PP
+The
+.BR preadv ()
+function reads
+.I iovcnt
+buffers from the file associated with the file descriptor
+.I fd
+into the buffers described by
+.I iov
+("scatter input") at an offset defined with
+.I pos_l
+and
+.IR pos_h .
+.PP
+The
+.BR pwritev ()
+function writes
+.I iovcnt
+buffers of data described by
+.I iov
+to the file associated with the file descriptor
+.I fd
+("scatter input") at an offset defined with
+.I pos_l
+and
+.IR pos_h .
+.PP
 The pointer
 .I iov
 points to an array of
@@ -77,22 +109,42 @@
 .fi
 .in
 .PP
+The file offset specified for
+.BR preadv ()
+and
+.BR pwritev ()
+is defined by the parameters of
+.I pos_l
+and
+.IR pos_h .
+The kernel concatinates the low 16 bit of
+.I pos_h
+with all bits of
+.I pos_l
+to derive the file offset where the read or write operations start.
+.PP
 The
 .BR readv ()
-function works just like
+and
+.BR preadv ()
+functions work just like
 .BR read (2)
 except that multiple buffers are filled.
 .PP
 The
 .BR writev ()
-function works just like
+and
+.BR pwritev ()
+functions work just like
 .BR write (2)
 except that multiple buffers are written out.
 .PP
 Buffers are processed in array order.
 This means that
 .BR readv ()
-completely fills
+and
+.BR preadv ()
+completely fill
 .IR iov [0]
 before proceeding to
 .IR iov [1],
@@ -102,25 +154,33 @@
 may be filled.)
 Similarly,
 .BR writev ()
-writes out the entire contents of
+and
+.BR pwritev ()
+write out the entire contents of
 .IR iov [0]
 before proceeding to
 .IR iov [1],
 and so on.
 .PP
 The data transfers performed by
-.BR readv ()
+.BR readv (),
+.BR preadv (),
+.BR writev (),
 and
-.BR writev ()
+.BR pwritev ()
 are atomic: the data written by
 .BR writev ()
+and
+.BR pwritev ()
 is written as a single block that is not intermingled with output
 from writes in other processes (but see
 .BR pipe (7)
 for an exception);
 analogously,
 .BR readv ()
-is guaranteed to read a contiguous block of data from the file,
+and
+.BR preadv ()
+are guaranteed to read a contiguous block of data from the file,
 regardless of read operations performed in other threads or processes
 that have file descriptors referring to the same open file description
 (see
@@ -128,9 +188,13 @@
 .SH "RETURN VALUE"
 On success, the
 .BR readv ()
-function returns the number of bytes read; the
+and
+.BR preadv ()
+functions return the number of bytes read; the
 .BR writev ()
-function returns the number of bytes written.
+and
+.BR pwritev ()
+functions return the number of bytes written.
 On error, \-1 is returned, and \fIerrno\fP is set appropriately.
 .SH ERRORS
 The errors are as given for

--Boundary-00=_oOpUNg6JftQ9x9m--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
