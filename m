From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Review request: pthread_attr_setstacksize.3
Date: Fri, 24 Oct 2008 16:29:10 -0500
Message-ID: <cfd18e0f0810241429n76e76524h7e1debed7ce4a3c8@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

.\" Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
.\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.TH PTHREAD_ATTR_SETSTACKSIZE 3 2008-10-24 "Linux" "Linux Programmer's Manual"
.SH NAME
pthread_attr_setstacksize, pthread_attr_getstacksize \- set/get stack size
attribute in thread attributes object
.SH SYNOPSIS
.nf
.B #include <pthread.h>

.BI "int pthread_attr_setstacksize(pthread_attr_t *" attr \
", size_t " stacksize );
.BI "int pthread_attr_getstacksize(pthread_attr_t *" attr \
", size_t *" stacksize );
.sp
Compile and link with \fI\-pthread\fP.
.SH DESCRIPTION
The
.BR pthread_attr_setscope ()
function sets the stack size attribute of the
thread attributes object referred to by
.I attr
to the value specified in
.IR stacksize .

The stack size attribute determines the minimum size (in bytes) that
will be allocated for threads created using the thread attributes object
.IR attr .

The
.BR pthread_attr_getstacksize ()
function returns the stack size attribute of the
thread attributes object referred to by
.I attr
in the buffer pointed to by
.IR stacksize .
.SH RETURN VALUE
On success, these functions return 0;
on error, they return a non-zero error number.
.SH ERRORS
.BR pthread_attr_setstacksize ()
can fail with the following error:
.TP
.B EINVAL
The stack size is less than
.BR PTHREAD_STACK_MIN
(16384) bytes.
.SH VERSIONS
These functions are provided by glibc since version 2.1.
.SH CONFORMING TO
POSIX.1-2001.
.SH EXAMPLE
See
.BR pthread_create (3).
.SH NOTES
For details on the default stack size of new threads, see
.BR pthread_create (3).

A thread's stack size is fixed at the time of thread creation.
Only the main thread can dynamically grow its stack.

The
.BR pthread_attr_setstack (3)
function allows an application to set both the size and location
of a caller-allocated stack that is to be used by a thread.
.SH BUGS
As at glibc 2.8,
if the specified
.I stacksize
is not a multiple of
.BR STACK_ALIGN
(16 bytes on most architectures), it may be rounded
.IR downwards ,
in violation of POSIX.1-2001, which says that the allocated stack will
be at least
.I stacksize
bytes.
.SH SEE ALSO
.BR getrlimit (2),
.BR pthread_attr_init (3),
.BR pthread_attr_setguardsize (3),
.BR pthread_attr_setstack (3),
.BR pthread_create (3),
.BR pthreads (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
