From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_attr_setaffinity_np.3
Date: Fri, 14 Nov 2008 11:42:18 -0500
Message-ID: <cfd18e0f0811140842k78d935a3g4af1e9c81efd74d1@mail.gmail.com>
References: <cfd18e0f0811050617h75c6ed47q31a10058fd257842@mail.gmail.com>
	 <491B509E.6070801@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <491B509E.6070801-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Lo=EFc,

> see my comments below (refer also to my comments for
> pthread_setaffinity_np.3).

Thanks very much!  Follow-ups below.

[...]

>> .TH PTHREAD_ATTR_SETAFFINITY_NP 3 2008-11-05 "Linux" "Linux Programm=
er's
>> Manual"
>
> Title looks weird on a 80x24 terminal.

Yes.  But, hard to help -- I couldn't think of a reasonable, more
abbreviated name for the page title.

>> .SH NAME
>> pthread_attr_setaffinity_np, pthread_attr_getaffinity_np \- set/get
>> CPU affinity of a thread
>
> You surely mean: "CPU affinity attribute of a thread"

Acchh.  You caught cut-and-paste-Pete at work.  Fixed:

=3D=3D
pthread_attr_setaffinity_np, pthread_attr_getaffinity_np \- set/get
CPU affinity attribute in thread attributes object
=3D=3D

[...]

>> .SH RETURN VALUE
>> On success, these functions return 0;
>> on error, they return a non-zero error number.
>> .SH ERRORS
>> .TP
>> .B EINVAL
>> .I attr
>> or
>> .I cpuset
>> is invalid.
>
> I beg your pardon, but I couldn't find where those checks are perform=
ed in
> the relevant glibc files... Perhaps I am not looking at the right pla=
ce?

Hmmm.  I'm not sure how I came to add that text.  I've removed it now.

>> .TP
>> .BR EINVAL
>> .RB ( pthread_attr_setaffinity_np ())
>> .I cpuset
>> specified a CPU that was outside the range
>> permitted by the kernel data type
>> .\" cpumask_t
>> used to represent CPU sets.
>> .\" The raw sched_getaffinity() system call returns the size (in byt=
es)
>> .\" of the cpumask_t type.
>> This range is determined by the kernel configuration option
>> .BR CONFIG_NR_CPUS .

(While we're here: I changed the text of this EINVAL error to be the
same as the revised EINVAL error text in ptherad_setaffinity_np(3).)

> <check>
> Hmmm. What does happen if CPU set contains no CPU physically on the s=
ystem
> when the thread is created? I guess pthread_create() fails?
> </check>

I would expect pthread_create() to fail with EINVAL, and testing
confirms this.  (There is an EINVAL error diagnostic in
pthread_create(3): "Invalid settings in attr".)

>> .TP
>> .B EINVAL
>> .RB ( pthread_getaffinity_np ())
>
> This should be: pthread_attr_getaffinity_np().

=46ixed now.

>> A CPU in the affinity mask of the thread attributes object referred =
to by
>> .I attr
>> lies outside the range specified by
>> .IR cpusetsize .
>
> For the application programmer, this means that the structure I passe=
d for
> storing the CPU set wasn't big enough to store thread's CPU set witho=
ut
> loosing "affinity information".

I simply added the words:

(i.e., cpuset/cpusetsize is too small)

>> .TP
>> .B ENOMEM
>> .RB ( pthread_attr_setaffinity_np ())
>> Could not allocate memory.
>
> Correct. However, the glibc looks somewhat suspicious to me: I had ex=
pected
> the memory allocated by iattr->cpuset to be bounded (by the size of t=
he
> underlying kernel structure).
>
> Or perhaps I am just missing my coffeine :o

Not sure if you are suggesting that I need to change anything here?

[...]

>> .SH SEE ALSO
>> .BR sched_setaffinity (2),
>> .BR sched_setscheduler (2),
>
> Why the reference to sched_setscheduler()?

I had thought to include it since it gives some background generally
about CPU scheduling.  Maybe it's not really necessary: I've removed
it now.

Thanks for these comments Loic.

The revised page is below.

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
=2ETH PTHREAD_ATTR_SETAFFINITY_NP 3 2008-11-14 "Linux" "Linux Programme=
r's Manual"
=2ESH NAME
pthread_attr_setaffinity_np, pthread_attr_getaffinity_np \- set/get
CPU affinity attribute in thread attributes object
=2ESH SYNOPSIS
=2Enf
=2EB #define _GNU_SOURCE
=2EB #include <pthread.h>

=2EBI "int pthread_attr_setaffinity_np(pthread_attr_t " attr ,
=2EBI "                   size_t " cpusetsize ", const cpu_set_t *" cpu=
set );
=2EBI "int pthread_attr_getaffinity_np(pthread_attr_t " attr ,
=2EBI "                   size_t " cpusetsize ", cpu_set_t *" cpuset );
=2Esp
Compile and link with \fI\-pthread\fP.
=2ESH DESCRIPTION
The
=2EBR pthread_attr_setaffinity_np ()
sets the CPU affinity mask attribute of the
thread attributes object referred to by
=2EI attr
to the value specified in
=2EIR cpuset .
This attribute determines the CPU affinity mask
of a thread created using the thread attributes object
=2EIR attr .

The
=2EBR pthread_attr_getaffinity_np ()
returns the CPU affinity mask attribute of the thread attributes object
referred to by
=2EIR attr
in the buffer pointed to by
=2EIR cpuset .

The argument
=2EI cpusetsize
is the length (in bytes) of the buffer pointed to by
=2EIR cpuset .
Typically, this argument would be specified as
=2EIR sizeof(cpu_set_t) .

=46or more details on CPU affinity masks, see
=2EBR sched_setaffinity (2).
=46or a description of a set of macros
that can be used to manipulate and inspect CPU sets, see
=2EBR CPU_SET (3).
=2ESH RETURN VALUE
On success, these functions return 0;
on error, they return a non-zero error number.
=2ESH ERRORS
=2ETP
=2EBR EINVAL
=2ERB ( pthread_attr_setaffinity_np ())
=2EI cpuset
specified a CPU that was outside the set supported by the kernel.
(The kernel configuration option
=2EBR CONFIG_NR_CPUS
defines the range of the set supported by the kernel data type
=2E\" cpumask_t
used to represent CPU sets.)
=2E\" The raw sched_getaffinity() system call returns the size (in byte=
s)
=2E\" of the cpumask_t type.
=2ETP
=2EB EINVAL
=2ERB ( pthread_attr_getaffinity_np ())
A CPU in the affinity mask of the thread attributes object referred to =
by
=2EI attr
lies outside the range specified by
=2EIR cpusetsize
(i.e.,
=2EIR cpuset / cpusetsize
is too small).
=2ETP
=2EB ENOMEM
=2ERB ( pthread_attr_setaffinity_np ())
Could not allocate memory.
=2ESH VERSIONS
These functions are provided by glibc since version 2.3.4.
=2ESH CONFORMING TO
These functions are non-standard GNU extensions;
hence the suffix "_np" (non-portable) in the names.
=2ESH NOTES
In glibc 2.3.3 only,
versions of these functions were provided that did not have a
=2EI cpusetsize
argument.
Instead the CPU set size given to the underlying system calls was alway=
s
=2EIR sizeof(cpu_set_t) .
=2ESH SEE ALSO
=2EBR sched_setaffinity (2),
=2EBR pthread_attr_init (3),
=2EBR pthread_setaffinity_np (3),
=2EBR cpuset (7),
=2EBR pthreads (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
