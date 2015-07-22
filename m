From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: What *is* the API for sched_getaffinity? Should sched_getaffinity
 always succeed when using cpu_set_t?
Date: Wed, 22 Jul 2015 18:02:15 +0200
Message-ID: <55AFBE87.1040006@redhat.com>
References: <51E42BFE.7000301@redhat.com> <51E4A0BB.2070802@gmail.com>
 <51E4A123.9070001@gmail.com> <51E6F3ED.8000502@redhat.com>
 <51E6F956.5050902@gmail.com> <51E714DE.6060802@redhat.com>
 <CAHGf_=oZW3kNA3V-9u+BZNs3tL3JKCsO2a0Q6f0iJzo=N4Wb8w@mail.gmail.com>
 <51E7B205.3060905@redhat.com>
 <20130722214335.D9AFF2C06F@topped-with-meat.com>
 <51EDB378.8070301@redhat.com> <558D6171.1060901@gmail.com>
 <558DB0A0.2040707@gmail.com> <5593DF14.2060804@redhat.com>
 <55AE5F33.3080105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AE5F33.3080105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>
Cc: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/21/2015 05:03 PM, Michael Kerrisk (man-pages) wrote:
> Hello Florian,
>=20
> Thanks for your comments, and sorry for the delayed follow-up.
>=20
> On 07/01/2015 02:37 PM, Florian Weimer wrote:
>> On 06/26/2015 10:05 PM, Michael Kerrisk (man-pages) wrote:
>>
>>> +.SS Handling systems with more than 1024 CPUs
>>> +The
>>> +.I cpu_set_t
>>> +data type used by glibc has a fixed size of 128 bytes,
>>> +meaning that the maximum CPU number that can be represented is 102=
3.
>>> +.\" FIXME . See https://sourceware.org/bugzilla/show_bug.cgi?id=3D=
15630
>>> +.\" and https://sourceware.org/ml/libc-alpha/2013-07/msg00288.html
>>> +If the system has more than 1024 CPUs, then calls of the form:
>>> +
>>> +    sched_getaffinity(pid, sizeof(cpu_set_t), &mask);
>>> +
>>> +will fail with the error
>>> +.BR EINVAL ,
>>> +the error produced by the underlying system call for the case wher=
e the
>>> +.I mask
>>> +size specified in
>>> +.I cpusetsize
>>> +is smaller than the size of the affinity mask used by the kernel.
>>
>> I think it is best to leave this as unspecified as possible.  Kernel
>> behavior already changed once, and I can imagine it changing again.
>=20
> Hmmm. Something needs to be said about what the kernel is doing thoug=
h.
> Otherwise, it's hard to make sense of this subsection. Did you have a
> suggested rewording that removes the piece you find problematic?

What about this?

=E2=80=9CIf the kernel affinity mask is larger than 1024 then
=E2=80=A6
is smaller than the size of the affinity mask used by the kernel.
Depending on the system CPU topology, the kernel affinity mask can
be substantially larger than the number of active CPUs in the system.
=E2=80=9D

I.e., make clear that the size of the mask can be quite different from
the CPU count.

>    Handling systems with more than 1024 CPUs
>        The  underlying  system calls (which represent CPU masks as bi=
t
>        masks of type unsigned long *) impose  no  restriction  on  th=
e
>        size of the CPU mask.  However, the cpu_set_t data type used b=
y
>        glibc has a fixed size of 128 bytes, meaning that  the  maximu=
m
>        CPU  number that can be represented is 1023.  If the system ha=
s
>        more than 1024 CPUs, then calls of the form:
>=20
>            sched_getaffinity(pid, sizeof(cpu_set_t), &mask);
>=20
>        will fail with the error EINVAL,  the  error  produced  by  th=
e
>        underlying  system call for the case where the mask size speci=
=E2=80=90
>        fied in cpusetsize is smaller than the  size  of  the  affinit=
y
>        mask used by the kernel.
>=20
>        When  working  on  systems  with  more than 1024 CPUs, one mus=
t
>        dynamically allocate the mask argument.   Currently,  the  onl=
y
>        way  to do this is by probing for the size of the required mas=
k
>        using sched_getaffinity()  calls  with  increasing  mask  size=
s
>        (until the call does not fail with the error EINVAL).
>=20
> Better?

=E2=80=9Cmore than 1024 CPUs=E2=80=9D should be =E2=80=9Clarge [kernel =
CPU] affinity masks=E2=80=9D
throughout.

--=20
=46lorian Weimer / Red Hat Product Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
