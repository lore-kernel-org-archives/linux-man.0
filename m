From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_attr_setaffinity_np.3
Date: Wed, 12 Nov 2008 22:54:38 +0100
Message-ID: <491B509E.6070801@domaigne.com>
References: <cfd18e0f0811050617h75c6ed47q31a10058fd257842@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811050617h75c6ed47q31a10058fd257842-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

see my comments below (refer also to my comments for=20
pthread_setaffinity_np.3).

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
> .TH PTHREAD_ATTR_SETAFFINITY_NP 3 2008-11-05 "Linux" "Linux Programme=
r's Manual"

Title looks weird on a 80x24 terminal.


> .SH NAME
> pthread_attr_setaffinity_np, pthread_attr_getaffinity_np \- set/get
> CPU affinity of a thread

You surely mean: "CPU affinity attribute of a thread"


> .SH SYNOPSIS
> .nf
> .B #define _GNU_SOURCE
> .B #include <pthread.h>
>=20
> .BI "int pthread_attr_setaffinity_np(pthread_attr_t " attr ,
> .BI "                   size_t " cpusetsize ", const cpu_set_t *" cpu=
set );
> .BI "int pthread_attr_getaffinity_np(pthread_attr_t " attr ,
> .BI "                   size_t " cpusetsize ", cpu_set_t *" cpuset );
> .sp
> Compile and link with \fI\-pthread\fP.
> .SH DESCRIPTION
> The
> .BR pthread_attr_setaffinity_np ()
> sets the CPU affinity mask attribute of the
> thread attributes object referred to by
> .I attr
> to the value specified in
> .IR cpuset .
> This attribute determines the CPU affinity mask
> of a thread created using the thread attributes object
> .IR attr .
>=20
> The
> .BR pthread_attr_getaffinity_np ()
> returns the CPU affinity mask attribute of the thread attributes obje=
ct
> referred to by
> .IR attr
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
>=20
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
> .B EINVAL
> .I attr
> or
> .I cpuset
> is invalid.

I beg your pardon, but I couldn't find where those checks are performed=
=20
in the relevant glibc files... Perhaps I am not looking at the right pl=
ace?

> .TP
> .BR EINVAL
> .RB ( pthread_attr_setaffinity_np ())
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

<check>
Hmmm. What does happen if CPU set contains no CPU physically on the=20
system when the thread is created? I guess pthread_create() fails?
</check>

> .TP
> .B EINVAL
> .RB ( pthread_getaffinity_np ())

This should be: pthread_attr_getaffinity_np().


> A CPU in the affinity mask of the thread attributes object referred t=
o by
> .I attr
> lies outside the range specified by
> .IR cpusetsize .

=46or the application programmer, this means that the structure I passe=
d=20
for storing the CPU set wasn't big enough to store thread's CPU set=20
without loosing "affinity information".


> .TP
> .B ENOMEM
> .RB ( pthread_attr_setaffinity_np ())
> Could not allocate memory.

Correct. However, the glibc looks somewhat suspicious to me: I had=20
expected the memory allocated by iattr->cpuset to be bounded (by the=20
size of the underlying kernel structure).

Or perhaps I am just missing my coffeine :o

> .SH VERSIONS
> These functions are provided by glibc since version 2.3.4.
> .SH CONFORMING TO
> These functions are non-standard GNU extensions;
> hence the suffix "_np" (non-portable) in the names.
> .SH NOTES
> In glibc 2.3.3 only,
> versions of these functions were provided that did not have a
> .I cpusetsize
> argument.
> Instead the CPU set size given to the underlying system calls was alw=
ays
> .IR sizeof(cpu_set_t) .
> .SH SEE ALSO
> .BR sched_setaffinity (2),
> .BR sched_setscheduler (2),

Why the reference to sched_setscheduler()?

> .BR pthread_attr_init (3),
> .BR pthread_setaffinity_np (3),
> .BR cpuset (7),
> .BR pthreads (7)
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
