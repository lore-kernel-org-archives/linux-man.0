From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Review request: pthread_attr_setstackaddr.3
Date: Fri, 24 Oct 2008 16:31:17 -0500
Message-ID: <cfd18e0f0810241431w18524aa7pe40644e378422956@mail.gmail.com>
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
.TH PTHREAD_ATTR_SETSTACKADDR 3 2008-10-24 "Linux" "Linux Programmer's Manual"
.SH NAME
pthread_attr_setstackaddr, pthread_attr_getstackaddr \-
set/get stack address attribute in thread attributes object
.SH SYNOPSIS
.nf
.B #include <pthread.h>

.BI "int pthread_attr_setstackaddr(pthread_attr_t *" attr \
", void *" stackaddr );
.BI "int pthread_attr_getstackaddr(pthread_attr_t *" attr \
", void **" stackaddr );
.sp
Compile and link with \fI\-pthread\fP.
.SH DESCRIPTION
These functions are obsolete:
.B do not use them.
Use
.BR pthread_attr_setstack (3)
and
.BR pthread_attr_getstack (3)
instead.

The
.BR pthread_attr_setstackaddr ()
function sets the stack address attribute of the
thread attributes object referred to by
.I attr
to the value specified in
.IR stackaddr .
This attribute specifies the location of the stack that should
be used by a thread that is created using the thread attributes object
.IR attr .

.I stackaddr
should point to a buffer of at least
.B PTHREAD_STACK_MIN
bytes that was allocated by the caller.
The pages of the allocated buffer should be both readable and writable.

The
.BR pthread_attr_getstackaddr ()
function returns the stack address attribute of the
thread attributes object referred to by
.I attr
in the buffer pointed to by
.IR stackaddr .
.SH RETURN VALUE
On success, these functions return 0;
on error, they return a non-zero error number.
.SH ERRORS
No errors are defined
(but applications should nevertheless
handle a possible error return).
.SH VERSIONS
These functions are provided by glibc since version 2.1.
.SH CONFORMING TO
POSIX.1-2001 specifies these functions but marks them as obsolete.
POSIX.1-2008 removes the specification of these functions.
.SH NOTES
.I Do not use these functions!
They cannot be portably used, since they provide no way of specifying
the direction of growth or the range of the stack.
For example, on architectures with a stack that grows downwards,
.I stackaddr
specifies the next address past the
.I highest
address of the allocated stack area.
However, on architectures with stack that grows upwards,
.I stackaddr
specifies the
.I lowest
address in the allocated stack area.
By contrast, the
.I stackaddr
used by
.BR pthread_attr_setstack (3)
and
.BR pthread_attr_getstack (3),
is always a pointer to the lowest address in the allocated stack area
(and the
.I stacksize
argument specifies the range of the stack).
.SH SEE ALSO
.BR pthread_attr_init (3),
.BR pthread_attr_setstack (3),
.BR pthread_attr_setstacksize (3),
.BR pthread_create (3),
.BR pthreads (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
