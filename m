From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Review request: pthread_attr_setdetachstate.3
Date: Fri, 24 Oct 2008 16:33:53 -0500
Message-ID: <cfd18e0f0810241433l40e8b890ibb34e699478d71a0@mail.gmail.com>
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

This is the last one for this day/week...

Cheers,

Michael

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
.TH PTHREAD_ATTR_SETDETACHSTATE 3 2008-10-24 "Linux" "Linux Programmer's Manual"
.SH NAME
pthread_attr_setdetachstate, pthread_attr_getdetachstate \-
set/get detach state attribute in thread attributes object
.SH SYNOPSIS
.nf
.B #include <pthread.h>

.BI "int pthread_attr_setdetachstate(pthread_attr_t *" attr \
", int " detachstate );
.BI "int pthread_attr_getdetachstate(pthread_attr_t *" attr \
", int *" detachstate );
.sp
Compile and link with \fI\-pthread\fP.
.SH DESCRIPTION
The
.BR pthread_attr_setdetachstate ()
function sets the detach state attribute of the
thread attributes object referred to by
.IR thread
to the value specified in
.IR detachstate .
The detach state attribute determines whether a thread created using
the thread attributes object
.I attr
will be created in a joinable or a detached state.

The following values may be specified in
.IR detachstate :
.TP
.B PTHREAD_CREATE_DETACHED
Threads that are created using
.I attr
will be created in a detached state.
.TP
.B PTHREAD_CREATE_JOINABLE
Threads that are created using
.I attr
will be created in a joinable state.
.PP
The default setting of the detach state attribute in a newly initialized
thread attributes object is
.BR PTHREAD_CREATE_JOINABLE .

The
.BR pthread_attr_getdetachstate ()
returns the detach state attribute of the thread attributes object
.IR attr
in the buffer pointed to by
.IR detachstate .
.SH RETURN VALUE
On success, these functions return 0;
on error, they return a non-zero error number.
.SH ERRORS
.BR pthread_attr_setdetachstate (3)
can fail with the following error:
.TP
.B EINVAL
An invalid value was specified in
.IR detachstate .
.SH CONFORMING TO
POSIX.1-2001.
.SH NOTES
See
.BR pthread_create (3)
for more details on detached and joinable threads.

A thread that is created in a joinable state should
eventually either be joined using
.BR pthread_join (3)
or detached using
.BR pthread_detach (3);
see
.BR pthread_create (3).

It is an error to specify the thread ID of
a thread that was created in a detached state
in a later call to
.BR pthread_detach (3)
or
.BR pthread_join (3).
.SH EXAMPLE
See
.BR pthread_attr_init (3).
.SH SEE ALSO
.BR pthread_attr_init (3),
.BR pthread_create (3),
.BR pthread_detach (3),
.BR pthread_join (3),
.BR pthreads (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
