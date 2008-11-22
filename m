From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_cleanup_push.3
Date: Sat, 22 Nov 2008 08:17:23 +0100
Message-ID: <4927B203.3000702@domaigne.com>
References: <cfd18e0f0811140919g11e625a2i8546b3296d008dce@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811140919g11e625a2i8546b3296d008dce-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

the last review for today.

Bye for now,
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
> .TH PTHREAD_CLEANUP_PUSH 3 2008-11-14 "Linux" "Linux Programmer's Man=
ual"
> .SH NAME
> pthread_cleanup_push, pthread_cleanup_pop \- push and pop
> thread cancellation clean-up handlers
> .SH SYNOPSIS
> .nf
> .B #include <pthread.h>
>=20
> .BI "void pthread_cleanup_push(void (*" routine ")(void *),"
> .BI "                          void *" arg );
> .BI "void pthread_cleanup_pop(int " execute );
> .sp
> Compile and link with \fI\-pthread\fP.
> .SH DESCRIPTION
> These functions manipulate the calling thread's stack of
> thread-cancellation clean-up handlers.
> A clean-up handler is a function that is automatically executed
> when a thread is canceled (or in various other circumstances
> described below);
> it might, for example, unlock a mutex so that
> it becomes available to other threads in the process.
>=20
> The
> .BR pthread_cleanup_push ()
> function pushes
> .I routine
> onto the top of the stack of clean-up handlers.
> When
> .I routine
> is later invoked, it will be given
> .I arg
> as its argument.
>=20
> The
> .BR pthread_cleanup_pop ()
> function removes the routine at the top of the stack of clean-up hand=
lers,
> and optionally executes it if
> .I execute
> is non-zero.
>=20
> A cancellation clean-up handler is popped from the stack
> and executed in the following circumstances:
> .IP 1. 3
> When a thread is canceled,
> all of the stacked clean-up handlers are popped and executed in
> the reverse of the order in which they were pushed onto the stack.
> .IP 2.
> When a thread terminates by calling
> .BR pthread_exit (3),
> all clean-up handlers are executed as described in the preceding poin=
t.
> (Clean-up handlers are \fInot\fP called if the thread terminates by
> performing a
> .I return
> from the thread start function.)

Generally speaking, it is left to the implementation to call or not
clean-up handlers when a thread returns from the start function.

The behavior you are describing is Linux specific; so perhaps you shoul=
d=20
put this in the NOTE, in the same way that you mentioned that=20
pthread_cleanup_{push/pop} are macro on Gnu/Linux.

> .IP 3.
> When a thread calls
> .BR pthread_cleanup_pop ()
> with a non-zero
> .I execute
> argument, the top-most clean-up handler is popped and executed.
> .PP
> POSIX.1 permits
> .BR pthread_cleanup_push ()
> and
> .BR pthread_cleanup_pop ()
> to be implemented as macros that expand to text
> containing \(aq\fB{\fP\(aq and \(aq\fB}\fP\(aq, respectively.
> For this reason, the caller must ensure that calls to these
> functions are paired within the same function,
> and at the same lexical nesting level.
> (In other words, a clean-up handler is only established
> during the execution of a specified section of code.)
>=20
> Calling
> .BR longjmp (3)
> .RB ( siglongjmp (3))
> produces undefined results if any call has been made to
> .BR pthread_cleanup_push ()
> or
> .BR pthread_cleanup_pop ()
> without the matching call of the pair since the jump buffer
> was filled by
> .BR setjmp (3)
> .RB ( sigsetjmp (3)).
> Likewise, calling
> .BR longjmp (3)
> .RB ( siglongjmp (3))
> from inside a clean-up handler produces undefined results
> unless the jump buffer was also filled by
> .BR setjmp (3)
> .RB ( sigsetjmp (3))
> inside the handler.
> .SH RETURN VALUE
> These functions do not return a value.
> .SH ERRORS
> There are no errors.
> .\" SH VERSIONS
> .\" Available since glibc 2.0
> .SH CONFORMING TO
> POSIX.1-2001.
> .SH NOTES
> On Linux, the
> .BR pthread_cleanup_push ()
> and
> .BR pthread_cleanup_pop ()
> functions \fIare\fP implemented as macros that expand to text
> containing \(aq\fB{\fP\(aq and \(aq\fB}\fP\(aq, respectively.
> This means that variables declared within the scope of
> paired calls to these functions will only be visible within that scop=
e.
> .SH EXAMPLE
> The program below provides a simple example of the use of the functio=
ns
> described in this page.
> The program creates a thread that executes a loop bracketed by
> .BR pthread_cleanup_push ()
> and
> .BR pthread_cleanup_pop ().
> This loop executes a global variable,
> .IR cnt ,
> once each second.

s/executes/increments/

> Depending on what command-line arguments are supplied,
> the main thread sends the other thread a cancellation request,
> or sets a global variable that causes the other thread
> to exit its loop and terminate normally (by doing a
> .IR return ).
>=20
> In the following shell session,
> the main thread sends a cancellation request to the other thread:
>=20
> .in +4n
> .nf
> $ \fB./a.out\fP
> New thread started
> cnt =3D 0
> cnt =3D 1
> Canceling thread
> Called clean-up handler
> Thread was canceled; cnt =3D 0
> .fi
> .in
>=20
>>From the above, we see that the thread was canceled,

garbage '>' ?

> and that the cancellation clean-up handler was called
> and it reset the value of the global variable
> .I cnt
> to 0.
>=20
> In the next run, the main program sets a
> global variable that causes other thread to terminate normally:
>=20
> .in +4n
> .nf
> $ \fB./a.out x\fP
> New thread started
> cnt =3D 0
> cnt =3D 1
> Thread terminated normally; cnt =3D 2
> .fi
> .in
>=20
>>From the above, we see that the clean-up handler was not executed (be=
cause

garbage '>' ?

> .I cleanup_pop_arg
> was 0), and therefore the value of
> .I cnt
> was not reset.
>=20
> In the next run, the main program sets a global variable that
> causes the other thread to terminate normally,
> and supplies a non-zero value for
> .IR cleanup_pop_arg :
>=20
> .in +4n
> .nf
> $ \fB./a.out x 1\fP
> New thread started
> cnt =3D 0
> cnt =3D 1
> Called clean-up handler
> Thread terminated normally; cnt =3D 0
> .fi
> .in
>=20
> In the above, we see that although the thread was not canceled,
> the clean-up handler was executed, because the argument given to
> .BR pthread_cleanup_pop ()
> was non-zero.
> .SS Program source
> \&
> .nf
> #include <pthread.h>
> #include <sys/types.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <errno.h>
>=20
> #define handle_error_en(en, msg) \\
>         do { errno =3D en; perror(msg); exit(EXIT_FAILURE); } while (=
0)
>=20
> static int done =3D 0;
> static int cleanup_pop_arg =3D 0;
> static int cnt =3D 0;
>=20
> static void
> cleanup_handler(void *arg)
> {
>     printf("Called clean\-up handler\\n");
>     cnt =3D 0;
> }
>=20
> static void *
> thread_start(void *arg)
> {
>     time_t start, curr;
>=20
>     printf("New thread started\\n");
>=20
>     pthread_cleanup_push(cleanup_handler, NULL);
>=20
>     curr =3D start =3D time(NULL);
>=20
>     while (!done) {
>         pthread_testcancel();           /* A cancellation point */
>         if (curr < time(NULL)) {
>             curr =3D time(NULL);
>             printf("cnt =3D %d\\n", cnt);  /* A cancellation point */

printf() is not a mandatory CP (but is a CP on Linux).

>             cnt++;
>         }
>     }
>=20
>     pthread_cleanup_pop(cleanup_pop_arg);
>     return NULL;
> }
>=20
> int
> main(int argc, char *argv[])
> {
>     pthread_t thr;
>     int s;
>     void *res;
>=20
>     s =3D pthread_create(&thr, NULL, thread_start, (void *) 1);

Why (void*) 1 as arg?

>     if (s !=3D 0)
>         handle_error_en(s, "pthread_create");
>=20
>     sleep(2);           /* Allow new thread to run a while */
>=20
>     if (argc > 1) {
>         if (argc > 2)
>             cleanup_pop_arg =3D atoi(argv[2]);
>         done =3D 1;
>=20
>     } else {
>         printf("Canceling thread\\n");
>         s =3D pthread_cancel(thr);
>         if (s !=3D 0)
>             handle_error_en(s, "pthread_cancel");
>     }
>=20
>     s =3D pthread_join(thr, &res);
>     if (s !=3D 0)
>         handle_error_en(s, "pthread_join");
>=20
>     if (res =3D=3D PTHREAD_CANCELED)
>         printf("Thread was canceled; cnt =3D %d\\n", cnt);
>     else
>         printf("Thread terminated normally; cnt =3D %d\\n", cnt);
>     exit(EXIT_SUCCESS);
> }

I see a major deficiency in your code. Unless I am mistaken, the global=
=20
variable <done> and <cleanup_pop_arg> are accessed from two different=20
threads. Following the POSIX memory model, you need mutex to synchroniz=
e=20
the visibility.

> .fi
> .SH SEE ALSO
> .BR pthread_cancel (3),
> .BR pthread_cleanup_push_defer_np (3),
> .BR pthread_setcancelstate (3),
> .BR pthread_testcancel (3),
> .BR pthreads (7)
>=20

A last comment: pthread_join(3) and pthread_cond_wait(3) are CP, so it=20
would be nice to describe the cancellation semantic in their respective=
=20
man-page.

Besides that, you need clean-up handler if you use deferred cancellatio=
n=20
on pthread_cond_wait(3). Indeed, when this function is cancelled, the=20
mutex is relocked.So, you need clean-up handler to unlock the mutex.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
