From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: For review: pthread_attr_setinheritsched.3
Date: Mon, 10 Nov 2008 08:09:54 -0500
Message-ID: <cfd18e0f0811100509y3b6ba724w45393697f68bc719@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?ISO-8859-1?Q?Loic_Domaign=E9?= <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
.TH PTHREAD_ATTR_SETINHERITSCHED 3 2008-11-06 "Linux" "Linux
Programmer's Manual"
.SH NAME
pthread_attr_setinheritsched, pthread_attr_getinheritsched \- set/get
inherit scheduler attribute in thread attributes object
.SH SYNOPSIS
.nf
.B #include <pthread.h>

.BI "int pthread_attr_setinheritsched(pthread_attr_t *" attr ,
.BI "                                 int " inheritsched );
.BI "int pthread_attr_getinheritsched(pthread_attr_t *" attr ,
.BI "                                 int *" inheritsched );
.sp
Compile and link with \fI\-pthread\fP.
.SH DESCRIPTION
The
.BR pthread_attr_setinheritsched ()
function sets the inherit scheduler attribute of the
thread attributes object referred to by
.IR thread
to the value specified in
.IR inheritsched .
The inherit scheduler attribute determines whether a thread created using
the thread attributes object
.I attr
will inherit its scheduling attributes from the calling thread
or whether it will take them from
.IR attr .

The following values may be specified in
.IR inheritsched :
.TP
.B PTHREAD_INHERIT_SCHED
Threads that are created using
.I attr
inherit scheduling attributes from the creating thread;
the scheduling attributes in
.I attr
are ignored.
.TP
.B PTHREAD_EXPLICIT_SCHED
Threads that are created using
.I attr
take their scheduling attributes from the values specified
by the attributes object.
.\" FIXME what are the defaults for scheduler settings?
.PP
The default setting of the inherit scheduler attribute in
a newly initialized thread attributes object is
.BR PTHREAD_INHERIT_SCHED .

The
.BR pthread_attr_getinheritsched ()
returns the inherit scheduler attribute of the thread attributes object
.IR attr
in the buffer pointed to by
.IR inheritsched .
.SH RETURN VALUE
On success, these functions return 0;
on error, they return a non-zero error number.
.SH ERRORS
.BR pthread_attr_setinheritsched ()
can fail with the following error:
.TP
.B EINVAL
Invalid value in
.IR inheritsched .
.PP
POSIX.1-2001 also documents an optional
.B ENOTSUP
error ("attempt was made to set the attribute to an unsupported value") for
.BR pthread_attr_setinheritsched ().
.\" .SH VERSIONS
.\" Available since glibc 2.0.
.SH CONFORMING TO
POSIX.1-2001.
.SH EXAMPLE
See
.BR pthread_setschedparam (3).
.SH BUGS
As at glibc 2.8, if a thread attributes object is initialized using
.BR pthread_attr_init (3),
then the scheduling policy of the attributes object is set to
.BR SCHED_OTHER
and the scheduling priority is set to 0.
However, if the inherit scheduler attribute is then set to
.BR PTHREAD_EXPLICIT_SCHED ,
then a thread created using the attribute object
wrongly inherits its scheduling attributes from the creating thread.
This bug does not occur if either the scheduling policy or
scheduling priority attribute is explicitly set
in the thread attributes object before calling
.BR pthread_create (3).
.\" FIXME . Track status of the following bug:
.\" http://sourceware.org/bugzilla/show_bug.cgi?id=7007
.SH SEE ALSO
.BR sched_setscheduler (2),
.BR pthread_attr_init (3),
.BR pthread_attr_setschedparam (3),
.BR pthread_attr_setschedpolicy (3),
.BR pthread_create (3),
.BR pthread_setschedparam (3),
.BR pthread_setschedprio (3),
.BR pthreads (7)


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
