From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: What *is* the API for sched_getaffinity? Should sched_getaffinity
 always succeed when using cpu_set_t?
Date: Tue, 21 Jul 2015 17:03:15 +0200
Message-ID: <55AE5F33.3080105@gmail.com>
References: <51E42BFE.7000301@redhat.com> <51E4A0BB.2070802@gmail.com> <51E4A123.9070001@gmail.com> <51E6F3ED.8000502@redhat.com> <51E6F956.5050902@gmail.com> <51E714DE.6060802@redhat.com> <CAHGf_=oZW3kNA3V-9u+BZNs3tL3JKCsO2a0Q6f0iJzo=N4Wb8w@mail.gmail.com> <51E7B205.3060905@redhat.com> <20130722214335.D9AFF2C06F@topped-with-meat.com> <51EDB378.8070301@redhat.com> <558D6171.1060901@gmail.com> <558DB0A0.2040707@gmail.com> <5593DF14.2060804@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5593DF14.2060804-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Florian,

Thanks for your comments, and sorry for the delayed follow-up.

On 07/01/2015 02:37 PM, Florian Weimer wrote:
> On 06/26/2015 10:05 PM, Michael Kerrisk (man-pages) wrote:
>=20
>> +.SS Handling systems with more than 1024 CPUs
>> +The
>> +.I cpu_set_t
>> +data type used by glibc has a fixed size of 128 bytes,
>> +meaning that the maximum CPU number that can be represented is 1023=
=2E
>> +.\" FIXME . See https://sourceware.org/bugzilla/show_bug.cgi?id=3D1=
5630
>> +.\" and https://sourceware.org/ml/libc-alpha/2013-07/msg00288.html
>> +If the system has more than 1024 CPUs, then calls of the form:
>> +
>> +    sched_getaffinity(pid, sizeof(cpu_set_t), &mask);
>> +
>> +will fail with the error
>> +.BR EINVAL ,
>> +the error produced by the underlying system call for the case where=
 the
>> +.I mask
>> +size specified in
>> +.I cpusetsize
>> +is smaller than the size of the affinity mask used by the kernel.
>=20
> I think it is best to leave this as unspecified as possible.  Kernel
> behavior already changed once, and I can imagine it changing again.

Hmmm. Something needs to be said about what the kernel is doing though.
Otherwise, it's hard to make sense of this subsection. Did you have a
suggested rewording that removes the piece you find problematic?

> Carlos and I tried to get clarification of the future direction of th=
e
> kernel interface here:
>=20
>   <https://sourceware.org/ml/libc-alpha/2015-06/msg00210.html>
>=20
> No reply so far, unless I missed something.

Okay

>> +.PP
>> +The underlying system calls (which represent CPU masks as bit masks=
 of type
>> +.IR "unsigned long\ *" )
>> +impose no restriction on the size of the mask.
>> +To handle systems with more than 1024 CPUs, one must dynamically al=
locate the
>> +.I mask
>> +argument using
>> +.BR CPU_ALLOC (3)
>> +and manipulate the mask using the "_S" macros described in
>> +.BR CPU_ALLOC (3).
>> +Using an allocation based on the number of online CPUs:
>> +
>> +    cpu_set_t *mask =3D CPU_ALLOC(CPU_ALLOC_SIZE(
>> +                                sysconf(_SC_NPROCESSORS_CONF)));
>=20
> I believe this is incorrect in several ways:
>=20
> CPU_ALLOC uses the raw CPU counts.  CPU_ALLOC_SIZE converts from the =
raw
> count to the size in bytes.  (This API is misdesigned.)

D'oh! Yes, the use of CPU_ALLOC_SIZE() was clearly misguided.

> sysconf(_SC_NPROCESSORS_CONF) is not related to the kernel CPU mask
> size, so it is not the correct value.

Yes, I understand now.

>> +is probably sufficient, although the value returned by the
>> +.BR sysconf ()
>> +call can in theory change during the lifetime of the process.
>> +Alternatively, one can obtain a value that is guaranteed to be stab=
le for
>> +the lifetime of the process by proby for the size of the required m=
ask using
>> +.BR sched_getaffinity ()
>> +calls with increasing mask sizes until the call does not fail with =
the error
>=20
> This is the only possible way right now if you do not want to read
> sysconf values.

Okay. I've amended the text to remove the first piece.

> It's also worth noting that the system call and the glibc function ha=
ve
> different return values.

Yes, I already cover that elsewhere in the page. See the quoted text be=
low.

Okay, so now I have:

   C library/kernel differences
       This manual page describes the  glibc  interface  for  the  CPU
       affinity  calls.   The actual system call interface is slightly
       different, with  the  mask  being  typed  as  unsigned  long *,
       reflecting  the  fact that the underlying implementation of CPU
       sets is a simple bit mask.  On success, the raw sched_getaffin=E2=
=80=90
       ity()  system call returns the size (in bytes) of the cpumask_t
       data type that is used internally by the  kernel  to  represent
       the CPU set bit mask.

   Handling systems with more than 1024 CPUs
       The  underlying  system calls (which represent CPU masks as bit
       masks of type unsigned long *) impose  no  restriction  on  the
       size of the CPU mask.  However, the cpu_set_t data type used by
       glibc has a fixed size of 128 bytes, meaning that  the  maximum
       CPU  number that can be represented is 1023.  If the system has
       more than 1024 CPUs, then calls of the form:

           sched_getaffinity(pid, sizeof(cpu_set_t), &mask);

       will fail with the error EINVAL,  the  error  produced  by  the
       underlying  system call for the case where the mask size speci=E2=
=80=90
       fied in cpusetsize is smaller than the  size  of  the  affinity
       mask used by the kernel.

       When  working  on  systems  with  more than 1024 CPUs, one must
       dynamically allocate the mask argument.   Currently,  the  only
       way  to do this is by probing for the size of the required mask
       using sched_getaffinity()  calls  with  increasing  mask  sizes
       (until the call does not fail with the error EINVAL).

Better?

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
