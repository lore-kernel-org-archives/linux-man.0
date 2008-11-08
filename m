From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_setaffinity_np.3
Date: Sat, 08 Nov 2008 23:31:22 +0100
Message-ID: <4916133A.8060209@domaigne.com>
References: <cfd18e0f0811041447w57dd5de4he68ca780ed963074@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811041447w57dd5de4he68ca780ed963074-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

this one is not 'straightforward' for me as I needed to look into the=20
glibc and kernel source...

I am not very knowledgeable in that area, so my review comments are in=20
consequence...

Cheers,
Lo=EFc
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
> .TH PTHREAD_SETAFFINITY_NP 3 2008-11-04 "Linux" "Linux Programmer's M=
anual"
> .SH NAME
> pthread_setaffinity_np, pthread_getaffinity_np \- set/get
> CPU affinity of a thread
> .SH SYNOPSIS
> .nf
> .B #define _GNU_SOURCE
> .B #include <pthread.h>
>=20
> .BI "int pthread_setaffinity_np(pthread_t " thread ", size_t " cpuset=
size ,
> .BI "                           const cpu_set_t *" cpuset );
> .BI "int pthread_getaffinity_np(pthread_t " thread ", size_t " cpuset=
size ,
> .BI "                           cpu_set_t *" cpuset );
> .sp
> Compile and link with \fI\-pthread\fP.
> .SH DESCRIPTION
> The
> .BR pthread_setaffinity_np ()
> sets the CPU affinity mask of the thread
> .I thread
> to the CPU set pointed to by
> .IR cpuset .
> If the call is successful,
> and the thread is not currently running on one of the CPUs in
> .IR cpuset ,
> then it is migrated to one of those CPUs.
>=20
> The
> .BR pthread_getaffinity_np ()
> function returns the CPU affinity mask of the thread
> .I thread
> in the buffer pointed to by
> .IR cpuset .
>=20
> The argument
> .I cpusetsize
> is the length (in bytes) of the buffer pointed to by
> .IR cpuset .
> Normally this argument would be specified as
> .IR sizeof(cpu_set_t) .
> The constant
> .B CPU_SETSIZE
> specifies a value one greater than the
> maximum CPU number that can be stored in a CPU set.

I came independently to the same conclusion than you. AFAICS,glibc=20
defines the cpu_set_t to be a 1024 bits long structure. But the kernel=20
defines the corresponding structure to be a bit field of appropriate=20
length to store NR_CPUS.

Interesting enough, the exact size of the kernel structure is determine=
d=20
by the glibc on the 1st call to pthread_setaffinity_np().

We'll run into troubles if run this on a server with more than 1K core =
;-)

> For more details on CPU affinity masks,
> as well as a description of a set of macros
> that can be used to manipulate and inspect CPU sets, see
> .BR sched_setaffinity (2)
> for details.
> .SH RETURN VALUE
> On success, these functions return 0;
> on error, they return a non-zero error number.
> .SH ERRORS
> .TP
> .B EFAULT
> A supplied memory address was invalid.
> .TP
> .B EINVAL
> .RB ( pthread_setaffinity_np ())
> The affinity bit mask
> .I mask
> contains no processors that are physically on the system.

If I got it right, it seems that Linux supports (or is preparing)=20
hotplug of CPUs cards... So when you say that "mask contains no=20
processors that are physically on the system", it should be understood:=
=20
at the point of time where pthread_setaffinity_np() has been issued.

> .TP
> .BR EINVAL
> .RB ( pthread_setaffinity_np ())
> .I cpuset
> specified a CPU that was outside the range
> permitted by the kernel data type
> .\" cpumask_t
> used to represent CPU sets.
> .\" The raw sched_getaffinity() system call returns the size (in byte=
s)
> .\" of the cpumask_t type.
> This range is determined by the kernel configuration option
> .BR CONFIG_NR_CPUS .

True. But what does it mean for an application programmer? That I am=20
requesting a processor which is outside of the set supported by the=20
kernel (structure). Strictly speaking, this processor could be=20
physically present.

So, If I sum-up the two EINVAL cases above, I get something like:

The affinity bit mask <code>mask</code> contains no processors that are=
=20
physically on the system, or contains a processor outside of the set=20
supported by the kernel.


> .TP
> .B EINVAL
> .RB ( pthread_getaffinity_np ()
> .I cpusetsize
> is smaller than the size of the affinity mask used by the kernel.
> .TP
> .B ESRCH
> There is no thread matching
> .IR thread
> (e.g., perhaps that thread has already terminated and been joined).
> .SH VERSIONS
> These functions are provided by glibc since version 2.3.4.
> .SH CONFORMING TO
> These functions are non-standard GNU extensions.
> .SH NOTES
> These functions are interpreted on top of the
> .BR sched_setaffinity (2)
> and
> .BR sched_getaffinity (2)
> system calls.
>=20
> In glibc 2.3.3 only,
> versions of these functions were provided that did not have a
> .I cpusetsize
> argument.
> Instead the CPU set size given to the underlying system calls was alw=
ays
> .IR sizeof(cpu_set_t) .

That's funny. Didn't you mention above that "the cpusetsize should be
sizeof(cpu_set_t)"... So for now, it's not that much different ;-)

> A new thread created by
> .BR pthread_create ()
> inherits a copy of its creator's CPU affinity mask.
> .SH EXAMPLE
> In the following program, the main thread uses
> .BR pthread_setaffinity_np ()
> to set its CPU affinity mask to include CPUs 0 to 7
> (which may not all be available on the system),
> and then calls
> .BR pthread_getaffinity_np ()
> to check the resulting CPU affinity mask of the thread.
>=20
> .nf
> #define _GNU_SOURCE
> #include <pthread.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <errno.h>
>=20
> #define errExitEN(en, msg)      { errno =3D en; perror(msg); \\
>                                   exit(EXIT_FAILURE); }
> int
> main(int argc, char *argv[])
> {
>     int s, j;
>     cpu_set_t cpuset;
>     pthread_t thread;
>=20
>     thread =3D pthread_self();
>=20
>     /* Set affinity mask to include CPUs 0 to 7 */
>=20
>     CPU_ZERO(&cpuset);
>     for (j =3D 0; j < 8; j++)
>         CPU_SET(j, &cpuset);
>=20
>     s =3D pthread_setaffinity_np(thread, sizeof(cpu_set_t), &cpuset);
>     if (s !=3D 0)
>         errExitEN(s, "sched_setaffinity");
>=20
>     /* Check the actual affinity mask assigned to the thread */
>=20
>     s =3D pthread_getaffinity_np(thread, sizeof(cpu_set_t), &cpuset);
>     if (s !=3D 0)
>         errExitEN(s, "sched_getaffinity");
>=20
>     printf("Set returned by pthread_getaffinity_np() contained:\\n");
>     for (j =3D 0; j < CPU_SETSIZE; j++)
>         if (CPU_ISSET(j, &cpuset))
>             printf("    CPU %d\\n", j);
>=20
>     exit(EXIT_SUCCESS);
> }
> .fi

This might be obvious to all of you, but it wasn't to me... The CPU set=
=20
used for the affinity is the intersection of the set passed to=20
pthread_setaffinity_np() and the set of processors supported by the=20
kernel...

That's why your example shall work, even if the system where it runs ha=
s=20
less than 8 processors.

> .SH SEE ALSO
> .BR sched_getaffinity (2),
> .BR sched_setaffinity (2),
> .BR sched_getscheduler (2),
> .BR pthread_getaffinity_np (3),
> .BR pthread_setaffinity_np (3),
> .BR cpuset (7),
> .BR pthreads (7)
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
