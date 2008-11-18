From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_cancel.3
Date: Tue, 18 Nov 2008 08:55:09 -0500
Message-ID: <4922C93D.1010804@gmail.com>
References: <cfd18e0f0811140917q5340504akc53d7ffa3eea483@mail.gmail.com> <4921C900.6040302@domaigne.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4921C900.6040302-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Lo=EFc,

Loic Domaigne wrote:
> Gidday Michael,
>=20
> one more review. The page rocks!

Thanks!  Aside from reading the source code, writing some test
programs (4 pthreads bugs reported to date), and reading POSIX.1,
I've also been checking man pages on some other systems to see if
there's any points that I've missed.  At the end of that, and
with some review help, I hope the Linux pages will be at
least as good as those on other systems (and of course,
hopefully better).

>> .BI "int pthread_(pthread_t " thread );
>=20
> pthread_cancel ;-)

Ah, yeah, like I said: "with some review help" ;-).

=46ixed.

[...]

>> Asynchronous cancelability
>> means that the thread can be canceled at any time
>> (usually immediately, but the system does not guarantee this).
>> Deferred cancelability means that cancellation will be delayed until
>> the thread next calls a function that is a
>> .IR "cancellation point" .
>> A list of functions that are or may be cancellation points is provid=
ed in
>> .IR pthreads (7).
>=20
> It is very important to document the list of functions that are/are n=
ot=20
> CP in the "may be a CP" list: this is system specific and belongs to =
the=20
> system documentation.

=46or man-pages-3.14, I have added POSIX.1's lists of "are" and "may be=
"
cancellation points to pthreads.7.

However, it unclear to me how one determines the list of functions
that are cancellation points under glibc.  Do you have some ideas
about this?

> Furthermore we should perhaps add a sentence about the fact that when=
 a=20
> trace is created, cancellation is enabled and deferred by default ? (=
I=20
> have noticed that you mention this fact in pthread_setcancelstate.3 )

I added some words to note the defaults.

[...]

>> .PP
>> After a canceled thread has terminated,
>> a join with that thread using
>> .BR pthread_join (3)
>> obtains
>> .B PTHREAD_CANCELED
>> as the thread's exit status.
>=20
> Joining the canceled thread is the only way to know that cancellation=
=20
> has completed.

Good idea -- that should be mentioned.  I added your words more
or less as you gave them above.

[...]

>> .SH NOTES
>> On Linux, cancellation is implemented using signals.
>> Under the NPTL threading implementation,
>> the first real-time signal (i.e., signal 32) is used for this purpos=
e.
>=20
> Hmmm... You are right: NPTL uses the first real-time signal (32)=20
> provided by the *kernel*. As a matter of fact, Glibc reserves kernel=20
> real-time signals 32 and 33 for NPTL; real-time queued signals availa=
ble=20
> to the application ranges from SIGRTMIN (34) to SIGRTMAX(64).

Yes... exactly.

>> On LinuxThreads, the second real-time signal is used,
>> if real-time signals are available, otherwise
>> .B SIGUSR2
>> is used.
>=20
> IIRC, this was true on 'older LinuxThreads'. Never used real-time que=
ued=20
> signals as well ? (To verify...)

I'm not quite sure what you want to say there.  Can you say some
more please.

>> .SH EXAMPLE
[...]

> sleep(3) is a CP on Linux (AFAIR, sleep is a "may be CP").

Not sure what you are wanting to saying here; should something
be changed in the page?  (BTW: sleep() *is* a CP in POSIX.1.)

[...]

Thanks for these comments Loic.  New version of the page is below.

Cheers,

Michael


=2E\" Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
=2E\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=2E\"
=2E\" Permission is granted to make and distribute verbatim copies of t=
his
=2E\" manual provided the copyright notice and this permission notice a=
re
=2E\" preserved on all copies.
=2E\"
=2E\" Permission is granted to copy and distribute modified versions of=
 this
=2E\" manual under the conditions for verbatim copying, provided that t=
he
=2E\" entire resulting derived work is distributed under the terms of a
=2E\" permission notice identical to this one.
=2E\"
=2E\" Since the Linux kernel and libraries are constantly changing, thi=
s
=2E\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
=2E\" responsibility for errors or omissions, or for damages resulting =
from
=2E\" the use of the information contained herein.  The author(s) may n=
ot
=2E\" have taken the same level of care in the production of this manua=
l,
=2E\" which is licensed free of charge, as they might when working
=2E\" professionally.
=2E\"
=2E\" Formatted or processed versions of this manual, if unaccompanied =
by
=2E\" the source, must acknowledge the copyright and authors of this wo=
rk.
=2E\"
=2ETH PTHREAD_CANCEL 3 2008-11-17 "Linux" "Linux Programmer's Manual"
=2ESH NAME
pthread_cancel \- send a cancellation request to a thread
=2ESH SYNOPSIS
=2Enf
=2EB #include <pthread.h>

=2EBI "int pthread_cancel(pthread_t " thread );
=2Esp
Compile and link with \fI\-pthread\fP.
=2ESH DESCRIPTION
The
=2EBR pthread_cancel ()
function sends a cancellation request to the thread
=2EIR thread .
Whether and when the target thread
reacts to the cancellation request depends on
two attributes that are under the control of that thread:
its cancelability \fIstate\fP and \fItype\fP.

A thread's cancelability state, determined by
=2EBR pthread_setcancelstate (3),
can be
=2EI enabled
(the default for new threads) or
=2EIR disabled .
If a thread has disabled cancellation,
then a cancellation request remains queued until the thread
enables cancellation.
If a thread has enabled cancellation,
then its cancelability type determines when cancellation occurs.

A thread's cancellation type, determined by
=2EBR pthread_setcanceltype (3),
may be either
=2EIR asynchronous
or
=2EIR deferred
(the default for new threads).
Asynchronous cancelability
means that the thread can be canceled at any time
(usually immediately, but the system does not guarantee this).
Deferred cancelability means that cancellation will be delayed until
the thread next calls a function that is a
=2EIR "cancellation point" .
A list of functions that are or may be cancellation points is provided =
in
=2EIR pthreads (7).

When a cancellation requested is acted on, the following steps occur fo=
r
=2EIR thread
(in this order):
=2EIP 1. 3
Cancellation clean-up handlers are popped
(in the reverse of the order in which they were pushed) and called.
(See
=2EBR pthread_cleanup_push (3).)
=2EIP 2.
Thread-specific data destructors are called,
in an unspecified order.
(See
=2EBR pthread_key_create (3).)
=2EIP 3.
The thread is terminated.
(See
=2EBR pthread_exit (3).)
=2EPP
The above steps happen asynchronously with respect to the
=2EBR pthread_cancel ()
call;
the return status of
=2EBR pthread_cancel ()
merely informs the caller whether the cancellation request
was successfully queued.
=2EPP
After a canceled thread has terminated,
a join with that thread using
=2EBR pthread_join (3)
obtains
=2EB PTHREAD_CANCELED
as the thread's exit status.
(Joining with a thread is the only way to know that cancellation
has completed.)
=2ESH RETURN VALUE
On success,
=2EBR pthread_cancel ()
returns 0;
on error, it returns a non-zero error number.
=2ESH ERRORS
=2ETP
=2EB ESRCH
No thread with the ID
=2EI thread
could be found.
=2E\" .SH VERSIONS
=2E\" Available since glibc 2.0
=2ESH CONFORMING TO
POSIX.1-2001.
=2ESH NOTES
On Linux, cancellation is implemented using signals.
Under the NPTL threading implementation,
the first real-time signal (i.e., signal 32) is used for this purpose.
On LinuxThreads, the second real-time signal is used,
if real-time signals are available, otherwise
=2EB SIGUSR2
is used.
=2ESH EXAMPLE
The program below creates a thread and then cancels it.
The main thread joins with the canceled thread to check
that its exit status was
=2EBR PTHREAD_CANCELED .
The following shell session shows what happens when we run the program:

=2Ein +4n
=2Enf
$ ./a.out
thread_func(): started; cancellation disabled
main(): sending cancellation request
thread_func(): about to enable cancellation
main(): thread was canceled
=2Efi
=2Ein
=2ESS Program source
\&
=2Enf
#include <pthread.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>

#define handle_error_en(en, msg) \\
         do { errno =3D en; perror(msg); exit(EXIT_FAILURE); } while (0=
)

static void *
thread_func(void *ignored_argument)
{
     int s;

     /* Disable cancellation for a while, so that we don\(aqt
        immediately react to a cancellation request */

     s =3D pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
     if (s !=3D 0)
         handle_error_en(s, "pthread_setcancelstate");

     printf("thread_func(): started; cancellation disabled\\n");
     sleep(5);
     printf("thread_func(): about to enable cancellation\\n");

     s =3D pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
     if (s !=3D 0)
         handle_error_en(s, "pthread_setcancelstate");

     /* sleep() is a cancellation point */

     sleep(1000);        /* Should get canceled while we sleep */

     /* Should never get here */

     printf("thread_func(): not canceled!\\n");
     return NULL;
}

int
main(void)
{
     pthread_t thr;
     void *res;
     int s;

     /* Start a thread and then send it a cancellation request */

     s =3D pthread_create(&thr, NULL, &thread_func, NULL);
     if (s !=3D 0)
         handle_error_en(s, "pthread_create");

     sleep(2);           /* Give thread a chance to get started */

     printf("main(): sending cancellation request\\n");
     s =3D pthread_cancel(thr);
     if (s !=3D 0)
         handle_error_en(s, "pthread_cancel");

     /* Join with thread to see what its exit status was */

     s =3D pthread_join(thr, &res);
     if (s !=3D 0)
         handle_error_en(s, "pthread_join");

     if (res =3D=3D PTHREAD_CANCELED)
         printf("main(): thread was canceled\\n");
     else
         printf("main(): thread wasn\(aqt canceled (shouldn\(aqt happen=
!)\\n");
     exit(EXIT_SUCCESS);
}
=2Efi
=2ESH SEE ALSO
=2EBR pthread_cleanup_push (3),
=2EBR pthread_create (3),
=2EBR pthread_exit (3),
=2EBR pthread_join (3),
=2EBR pthread_key_create (3),
=2EBR pthread_setcancelstate (3),
=2EBR pthread_setcanceltype (3),
=2EBR pthread_testcancel (3),
=2EBR pthreads (7)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
