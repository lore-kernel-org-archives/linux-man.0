From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Review request: pthread_attr_setscope.3
Date: Fri, 24 Oct 2008 16:32:44 -0500
Message-ID: <cfd18e0f0810241432l579600e2w74ad6bf02e2c643b@mail.gmail.com>
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
.TH PTHREAD_ATTR_SETSCOPE 3 2008-10-24 "Linux" "Linux Programmer's Manual"
.SH NAME
pthread_attr_setscope, pthread_attr_getscope \- set/get contention scope
attribute in thread attributes object
.SH SYNOPSIS
.nf
.B #include <pthread.h>

.BI "int pthread_attr_setscope(pthread_attr_t *" attr \
", int " scope );
.BI "int pthread_attr_getscope(pthread_attr_t *" attr \
", int *" scope );
.sp
Compile and link with \fI\-pthread\fP.
.SH DESCRIPTION
The
.BR pthread_attr_setscope ()
function sets the contention scope attribute of the
thread attributes object referred to by
.I attr
to the value specified in
.IR scope .
The contention scope attribute defines the set of threads
against which a thread competes for resources such as the CPU.
POSIX.1-2001 specifies two possible values for
.IR scope :
.TP
.B PTHREAD_SCOPE_SYSTEM
The thread competes for resources with all other threads
in all processes on the system that are in the same scheduling
allocation domain (a group of one or more processors).
.B PTHREAD_SCOPE_SYSTEM
threads are scheduled relative to one another
according to their scheduling policy and priority.
.TP
.B PTHREAD_SCOPE_PROCESS
The thread competes for resources with all other threads
in the same process that were also created with the
.BR PTHREAD_SCOPE_PROCESS
contention scope.
.BR PTHREAD_SCOPE_PROCESS
threads are scheduled relative to other threads in the process
according to their scheduling policy and priority.
POSIX.1-2001 leaves it unspecified how these threads contend
with other threads in other process on the system or
with other threads in the same process that
were created with the
.B PTHREAD_SCOPE_SYSTEM
contention scope.
.PP
POSIX.1-2001 only requires that an implementation support one of these
contention scopes, but permits both to be supported.
Linux supports
.BR PTHREAD_SCOPE_SYSTEM ,
but not
.BR PTHREAD_SCOPE_PROCESS .

The
.BR pthread_attr_getscope ()
function returns the contention scope attribute of the
thread attributes object referred to by
.I attr
in the buffer pointed to by
.IR scope .
.SH RETURN VALUE
On success, these functions return 0;
on error, they return a non-zero error number.
.SH ERRORS
.BR pthread_attr_setscope ()
can fail with the following errors:
.TP
.B EINVAL
An invalid value was specified in
.IR scope .
.TP
.B ENOTSUP
.IR scope
specified the value
.BR PTHREAD_SCOPE_PROCESS ,
which is not supported on Linux.
.SH CONFORMING TO
POSIX.1-2001.
.SH NOTES
The
.B PTHREAD_SCOPE_SYSTEM
contention scope typically indicates that a userspace thread is
bound directly to a single kernel-scheduling entity.
This is the case on Linux for the obsolete LinuxThread implementation
and the modern NPTL implementation,
which are both 1:1 threading implementations.

POSIX.1-2001 specifies that the default contention scope is
implementation-defined.
.SH SEE ALSO
.BR pthread_attr_init (3),
.BR pthread_attr_setaffinity_np (3),
.BR pthread_attr_setinheritsched (3),
.BR pthread_attr_setschedparam (3),
.BR pthread_attr_setschedpolicy (3),
.BR pthread_create (3),
.BR pthreads (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
