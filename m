From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_setcancelstate.3
Date: Sat, 22 Nov 2008 08:03:11 +0100
Message-ID: <4927AEAF.6060802@domaigne.com>
References: <cfd18e0f0811140926r40781376t8a6340479bf8426f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811140926r40781376t8a6340479bf8426f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?ISO-8859-1?Q?Loic_Domaign=E9?= <loic-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

my review for pthread_setcancelstate(3).

Cheers,
Lo=EFc.
--

> .\" Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
> .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> .\"
> .\" Permission is granted to make and distribute verbatim copies of t=
his
> .\" manual provided the copyright notice and this permission notice a=
re
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of=
 this
> .\" manual under the conditions for verbatim copying, provided that t=
he
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, thi=
s
> .\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
> .\" responsibility for errors or omissions, or for damages resulting =
from
> .\" the use of the information contained herein.  The author(s) may n=
ot
> .\" have taken the same level of care in the production of this manua=
l,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied =
by
> .\" the source, must acknowledge the copyright and authors of this wo=
rk.
> .\"
> .TH PTHREAD_SETCANCELSTATE 3 2008-11-14 "Linux" "Linux Programmer's M=
anual"
> .SH NAME
> pthread_setcancelstate, pthread_setcanceltype \-
> set cancelability state and type
> .SH SYNOPSIS
> .nf
> .B #include <pthread.h>
>=20
> .BI "int pthread_setcancelstate(int " state ", int *" oldstate );
> .BI "int pthread_setcanceltype(int " type ", int *" oldtype );
> .sp
> Compile and link with \fI\-pthread\fP.
> .SH DESCRIPTION
> The
> .BR pthread_setcancelstate ()
> sets the cancelability state of the calling thread to the value
> given in
> .IR state .
> The previous cancelability state of the thread is returned
> in the buffer pointed to by
> .IR oldstate .
> The
> .I state
> argument must have one of the following values:
> .TP
> .B PTHREAD_CANCEL_ENABLE
> The thread is cancelable.
> This is the default cancelability state in all new threads,
> including the initial thread.
> The thread's cancelability type determines when a cancelable thread
> will respond to a cancellation request.
> .TP
> .B PTHREAD_CANCEL_DISABLE
> The thread is not cancelable.
> If a cancellation request is received,
> it is blocked until cancelability is enabled.
> .PP
> The
> .BR pthread_setcanceltype ()
> sets the cancelability type of the calling thread to the value
> given in
> .IR type .
> The previous cancelability type of the thread is returned
> in the buffer pointed to by
> .IR oldtype .
> The
> .I type
> argument must have one of the following values:
> .TP
> .B PTHREAD_CANCEL_DEFERRED
> A cancellation request is deferred until the thread next calls
> a function that is a cancellation point (see
> .BR pthreads (7)).
> This is the default cancelability type in all new threads,
> including the initial thread.
> .TP
> .B PTHREAD_CANCEL_ASYNCHRONOUS
> The thread can be canceled at any time.
> (Typically,
> it will be canceled immediately upon receiving a cancellation request=
,
> but the system doesn't guarantee this.)
> .PP
> The set-and-get operation performed by each of these functions
> is atomic with respect to other threads in the process
> calling the same function.
> .SH RETURN VALUE
> On success, these functions return 0;
> on error, they return a non-zero error number.
> .SH ERRORS
> The
> .BR pthread_setcancelstate ()
> can fail with the following error:
> .TP
> .B EINVAL
> Invalid value for
> .IR state .
> .PP
> The
> .BR pthread_setcanceltype ()
> can fail with the following error:
> .TP
> .B EINVAL
> Invalid value for
> .IR type .
> .\" .SH VERSIONS
> .\" Available since glibc 2.0
> .SH CONFORMING TO
> POSIX.1-2001.
> .SH NOTES
> For details of what happens when a thread is canceled, see
> .BR pthread_cancel (3).
>=20
> Briefly disabling cancelability is useful
> if a thread performs some critical action
> that must not be interrupted by a cancellation request.
> Beware of disabling cancelability for long periods,
> or around operations that may block for long periods,
> since that will render the thread unresponsive to cancellation reques=
ts.
>=20
> Setting the cancelability type to
> .B PTHREAD_CANCEL_ASYNCHRONOUS
> is rarely useful.
> Since the thread could be canceled at
> .I any
> time, it cannot reserve resources (e.g., allocating memory),
> acquire mutexes, semaphores, or locks, and so on,
> since, when the thread is canceled,
> the application has no way of knowing what the state of these resourc=
es is;
> that is, did the canceled thread manage to release the resources or n=
ot?
> (Among other things, this means that clean-up handlers cease to be us=
eful,
> since they can't determine the state of resources that
> they are intended to clean up.)
> In general, most library functions, including most pthreads functions=
,
> can't be safely called from an asynchronously cancelable thread.
> (POSIX.1-2001 only requires that
> .BR pthread_cancel (3),
> .BR pthread_setcancelstate (),
> and
> .BR pthread_setcanceltype ()
> be safe to call from an asynchronously cancelable thread.)
> One of the few circumstances in which asynchronous cancelability is u=
seful
> is for cancellation of a thread that is in a pure compute-bound loop.

The paragraph is important, but I found it somewhat difficult to read. =
I=20
don't pretend to compete with a native speaker, but find below a=20
reworked version:

Setting the cancelability type to *PTHREAD_CANCEL_ASYNCHRONOUS* is=20
rarely useful. The cancelation could occur at any time, for instance in=
=20
a middle of a library call, like malloc(), leaving possibly inconsisten=
t=20
state. The application is not aware of those internal library states,=20
and as no possibly to recover from possible inconsistencies. That is,=20
clean-up handlers cease to be useful.  Functions that can be safely=20
asynchronously canceled are called async-cancel-safe functions.=20
POSIX.1-2001 only requires pthread_cancel(3), pthread_setcancelstate(3)=
=20
and pthread_setcanceltype(3) to be async-cancel-safe. One of the few=20
circumstances in which asynchronous cancelability is useful is for=20
cancellation of a thread that is in a pure compute-bound loop.


> The Linux threading implementations permit the
> .I oldstate
> argument of
> .BR pthread_setcancelstate ()
> to be NULL, in which case the information about the previous
> cancelability state is not returned to the caller.
> Many other implementations also permit a NULL
> .I oldstat
> argument,
> .\" It looks like at least Solaris, FreeBSD and Tru64 support this.
> but POSIX.1-2001 does not specify this point,
> so portable applications should always specify a non-NULL value in
> .IR oldstate .
> A precisely analogous set of statements applies for the
> .I oldtype
> argument of
> .BR pthread_setcanceltype ().
> .SH EXAMPLE
> See
> .BR pthread_cancel (3).
> .SH SEE ALSO
> .BR pthread_cleanup_push (3),
> .BR pthread_cancel (3),
> .BR pthread_testcancel (3),
> .BR pthreads (7)
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
