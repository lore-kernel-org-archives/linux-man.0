From: Robert Schweikert <rschweikert-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Subject: page for  pthread_rwlockattr_s/getkind_np
Date: Mon, 14 Jun 2010 06:28:41 -0400
Message-ID: <4C160459.7090603@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

My first attempt at creating a man page can be found below. Hopefully
this can be included in the project. These pages are of interest to the
LSB effort as both interfaces are targeted for LSB 4.1 inclusion.

man3/pthread_rwlockattr_setkind_np.3


\"Copyright (c) 2010 Novell Inc., written by Robert Schweikert
\"   <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
\"
\" Permission is granted to make and distribute verbatim copies of this
\" manual provided the copyright notice and this permission notice are
\" preserved on all copies.
\"
\" Permission is granted to copy and distribute modified versions of this
\" manual under the conditions for verbatim copying, provided that the
\" entire resulting derived work is distributed under the terms of a
\" permission notice identical to this one.
\"
\" Since the Linux kernel and libraries are constantly changing, this
\" manual page may be incorrect or out-of-date.  The author(s) assume no
\" responsibility for errors or omissions, or for damages resulting from
\" the use of the information contained herein.  The author(s) may not
\" have taken the same level of care in the production of this manual,
\" which is licensed free of charge, as they might when working
\" professionally.
\"
\" Formatted or processed versions of this manual, if unaccompanied by
\" the source, must acknowledge the copyright and authors of this work.
\"
TH PTHREAD_RWLOCKATTR_SETKIND_NP 3 2010-06-09 "Linux Programmer's Manual"
SH NAME
pthread_rwlockattr_setkind_np, pthread_rwlockattr_getkind_np \- set/get
the read-write lock kind of the thread read-write lock attribute object
SH SYNOPSIS
nf
B #define _XOPEN_SOURCE 500
B #include <pthread.h>

BI "int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *" attr ,
BI "                                   int" pref);
BI "int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *" attr ,
BI "                                   int *" pref);
sp
Compile and link with \fI\-pthread\fP.
SH DESCRIPTION
The
BR pthread_rwlockattr_setkind_np ()
function
sets the kind of read-write lock of the
thread read-write lock attribute object referred to by
I attr
to the value specified with
IR pref .
The argument
I pref
may be set to
IR PTHREAD_RWLOCK_PREFER_READER_NP ,
IR PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP ,
or
IR  PTHREAD_RWLOCK_PREFER_WRITER_NP .
The default lock setting is
IR PTHREAD_RWLOCK_PREFER_READER_NP .
A thread may hold multiple read locks, i.e. read locks are recursive.
According to The Single Unix Specification, the behavior is unspecified
when a
reader tries to place a lock, and there is no write lock but writers are
waiting. Giving preference to the reader, as is set by default with the
IR PTHREAD_RWLOCK_PREFER_READER_NP value
implies that the reader will receive the requested lock, even if
a writer is waiting. As long as there are readers the writer will be
starved. Setting the kind to
IR PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP ,
avoids writer starvation as long as any read locking is not done in a
recursive fashion.

The
BR pthread_rwlockattr_getkind_np ()
function
returns the value of the read-write lock attribute of the
thread read-write lock attribute object referred to by
IR attr
in the pointer
IR pref .
SH RETURN VALUE
On success, these functions return 0;
on error,
BR pthread_rwlockattr_setkind_np ()
returns a non-zero error number.
SH ERRORS
TP
BR EINVAL
I pref
is set to an unsupported value.
SH BUGS
Setting the value read-write lock kind to
IR  PTHREAD_RWLOCK_PREFER_WRITER_NP ,
resutls in the same behavior as setting the value to
IR PTHREAD_RWLOCK_PREFER_READER_NP .
As long as a reader therad holds the lock the thread holding a
write lock will be starved. Setting the kind value to
IR PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP ,
allows the writer to run. However, the writer may not be
recursive as is implied by the name. See
http://sourceware.org/bugzilla/show_bug.cgi?id=7057
SH CONFORMING TO
These functions are non-standard GNU extensions;
hence the suffix "_np" (non-portable) in the names.
SH SEE ALSO
BR pthreads (7)
SH COLOPHON
This page is part of release ??? of the Linux
I man-pages
project.
A description of the project,
and information about reporting bugs,
can be found at
http://www.kernel.org/doc/man-pages/.


man3/pthread_rwlockattr_getkind_np.3

so man3/pthread_rwlockattr_setkind_np.3


If there is a better way to submit the work or if there are changes,
improvements, or corrections that need to be made please let me know and
I'll be happy to address them.

Thanks,
Robert

-- 
Robert Schweikert                           MAY THE SOURCE BE WITH YOU
Software Engineer Consultant                          LINUX
rschweikert-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org
781-464-8147

Novell
Making IT Work As One
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
