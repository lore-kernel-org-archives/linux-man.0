From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_cancel.3
Date: Mon, 17 Nov 2008 20:41:52 +0100
Message-ID: <4921C900.6040302@domaigne.com>
References: <cfd18e0f0811140917q5340504akc53d7ffa3eea483@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811140917q5340504akc53d7ffa3eea483-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday Michael,

one more review. The page rocks!

Cheers,
Lo=EFc.
--
>=20
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
> .TH PTHREAD_CANCEL 3 2008-11-14 "Linux" "Linux Programmer's Manual"
> .SH NAME
> pthread_cancel \- send a cancellation request to a thread
> .SH SYNOPSIS
> .nf
> .B #include <pthread.h>
>=20
> .BI "int pthread_(pthread_t " thread );

pthread_cancel ;-)

> .sp
> Compile and link with \fI\-pthread\fP.
> .SH DESCRIPTION
> The
> .BR pthread_cancel ()
> function sends a cancellation request to the thread
> .IR thread .
> Whether and when the target thread
> reacts to the cancellation request depends on
> two attributes that are under the control of that thread:
> its cancelability \fIstate\fP and \fItype\fP.
>=20
> A thread's cancelability state, determined by
> .BR pthread_setcancelstate (3),
> can be
> .I enabled
> or
> .IR disabled .
> If a thread has disabled cancellation,
> then a cancellation request remains queued until the thread
> enables cancellation.
> If a thread has enabled cancellation,
> then its cancelability type determines when cancellation occurs.
>=20
> A thread's cancellation type, determined by
> .BR pthread_setcanceltype (3),
> may be either
> .IR asynchronous
> or
> .IR deferred .
> Asynchronous cancelability
> means that the thread can be canceled at any time
> (usually immediately, but the system does not guarantee this).
> Deferred cancelability means that cancellation will be delayed until
> the thread next calls a function that is a
> .IR "cancellation point" .
> A list of functions that are or may be cancellation points is provide=
d in
> .IR pthreads (7).

It is very important to document the list of functions that are/are not=
=20
CP in the "may be a CP" list: this is system specific and belongs to th=
e=20
system documentation.

=46urthermore we should perhaps add a sentence about the fact that when=
 a=20
trace is created, cancellation is enabled and deferred by default ? (I=20
have noticed that you mention this fact in pthread_setcancelstate.3 )

> When a cancellation requested is acted on, the following steps occur =
for
> .IR thread
> (in this order):
> .IP 1. 3
> Cancellation clean-up handlers are popped
> (in the reverse of the order in which they were pushed) and called.
> (See
> .BR pthread_cleanup_push (3).)
> .IP 2.
> Thread-specific data destructors are called,
> in an unspecified order.
> (See
> .BR pthread_key_create (3).)
> .IP 3.
> The thread is terminated.
> (See
> .BR pthread_exit (3).)
> .PP
> The above steps happen asynchronously with respect to the
> .BR pthread_cancel ()
> call;
> the return status of
> .BR pthread_cancel ()
> merely informs the caller whether the cancellation request
> was successfully queued.
> .PP
> After a canceled thread has terminated,
> a join with that thread using
> .BR pthread_join (3)
> obtains
> .B PTHREAD_CANCELED
> as the thread's exit status.

Joining the canceled thread is the only way to know that cancellation=20
has completed.

> .SH RETURN VALUE
> On success,
> .BR pthread_cancel ()
> returns 0;
> on error, it returns a non-zero error number.
> .SH ERRORS
> .TP
> .B ESRCH
> Could not find a thread matching the ID
> .IR thread .
> .\" .SH VERSIONS
> .\" Available since glibc 2.0
> .SH CONFORMING TO
> POSIX.1-2001.
> .SH NOTES
> On Linux, cancellation is implemented using signals.
> Under the NPTL threading implementation,
> the first real-time signal (i.e., signal 32) is used for this purpose=
=2E

Hmmm... You are right: NPTL uses the first real-time signal (32)=20
provided by the *kernel*. As a matter of fact, Glibc reserves kernel=20
real-time signals 32 and 33 for NPTL; real-time queued signals availabl=
e=20
to the application ranges from SIGRTMIN (34) to SIGRTMAX(64).


> On LinuxThreads, the second real-time signal is used,
> if real-time signals are available, otherwise
> .B SIGUSR2
> is used.

IIRC, this was true on 'older LinuxThreads'. Never used real-time queue=
d=20
signals as well ? (To verify...)

> .SH EXAMPLE
> The program below creates a thread and then cancels it.
> The main thread joins with the canceled thread to check
> that its exit status was
> .BR PTHREAD_CANCELED .
> The following shell session shows what happens when we run the progra=
m:
>=20
> .in +4n
> .nf
> $ ./a.out
> thread_func(): started; cancellation disabled
> main(): sending cancellation request
> thread_func(): about to enable cancellation
> main(): thread was canceled
> .fi
> .in
> .SS Program source
> \&
> .nf
> #include <pthread.h>
> #include <stdio.h>
> #include <errno.h>
> #include <stdlib.h>
> #include <unistd.h>
>=20
> #define handle_error_en(en, msg) \\
>         do { errno =3D en; perror(msg); exit(EXIT_FAILURE); } while (=
0)
>=20
> static void *
> thread_func(void *ignored_argument)
> {
>     int s;
>=20
>     /* Disable cancellation for a while, so that we don\(aqt
>        immediately react to a cancellation request */
>=20
>     s =3D pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
>     if (s !=3D 0)
>         handle_error_en(s, "pthread_setcancelstate");
>=20
>     printf("thread_func(): started; cancellation disabled\\n");
>     sleep(5);
>     printf("thread_func(): about to enable cancellation\\n");
>=20
>     s =3D pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
>     if (s !=3D 0)
>         handle_error_en(s, "pthread_setcancelstate");
>=20
>     /* sleep() is a cancellation point */
>=20
>     sleep(1000);        /* Should get canceled while we sleep */
>=20
>     /* Should never get here */
>=20
>     printf("thread_func(): not canceled!\\n");
>     return NULL;
> }
>=20
> int
> main(void)
> {
>     pthread_t thr;
>     void *res;
>     int s;
>=20
>     /* Start a thread and then send it a cancellation request */
>=20
>     s =3D pthread_create(&thr, NULL, &thread_func, NULL);
>     if (s !=3D 0)
>         handle_error_en(s, "pthread_create");
>=20
>     sleep(2);           /* Give thread a chance to get started */
>=20
>     printf("main(): sending cancellation request\\n");
>     s =3D pthread_cancel(thr);
>     if (s !=3D 0)
>         handle_error_en(s, "pthread_cancel");
>=20
>     /* Join with thread to see what its exit status was */
>=20
>     s =3D pthread_join(thr, &res);
>     if (s !=3D 0)
>         handle_error_en(s, "pthread_join");
>=20
>     if (res =3D=3D PTHREAD_CANCELED)
>         printf("main(): thread was canceled\\n");
>     else
>         printf("main(): thread wasn\(aqt canceled (shouldn\(aqt happe=
n!)\\n");
>     exit(EXIT_SUCCESS);
> }

sleep(3) is a CP on Linux (AFAIR, sleep is a "may be CP").

> .fi
> .SH SEE ALSO
> .BR pthread_cleanup_push (3),
> .BR pthread_create (3),
> .BR pthread_exit (3),
> .BR pthread_join (3),
> .BR pthread_key_create (3),
> .BR pthread_setcancelstate (3),
> .BR pthread_setcanceltype (3),
> .BR pthread_testcancel (3),
> .BR pthreads (7)
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
