From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setaffinity_np.3
Date: Fri, 14 Nov 2008 10:04:18 -0500
Message-ID: <cfd18e0f0811140704l18e5741fgdbb5a6c52fb8cbe7@mail.gmail.com>
References: <cfd18e0f0811041447w57dd5de4he68ca780ed963074@mail.gmail.com>
	 <4916133A.8060209@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4916133A.8060209-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Lo=EFc,

> this one is not 'straightforward' for me as I needed to look into the=
 glibc
> and kernel source...
>
> I am not very knowledgeable in that area, so my review comments are i=
n
> consequence...

No problem.  Thanks for looking over the page.  My responses below.

[...]

>> The argument
>> .I cpusetsize
>> is the length (in bytes) of the buffer pointed to by
>> .IR cpuset .
>> Normally this argument would be specified as
>> .IR sizeof(cpu_set_t) .
>> The constant
>> .B CPU_SETSIZE
>> specifies a value one greater than the
>> maximum CPU number that can be stored in a CPU set.
>
> I came independently to the same conclusion than you. AFAICS,glibc de=
fines
> the cpu_set_t to be a 1024 bits long structure. But the kernel define=
s the
> corresponding structure to be a bit field of appropriate length to st=
ore
> NR_CPUS.
>
> Interesting enough, the exact size of the kernel structure is determi=
ned by
> the glibc on the 1st call to pthread_setaffinity_np().
>
> We'll run into troubles if run this on a server with more than 1K cor=
e ;-)

As noted by Bert Wesarg, recent glibc provides some macros to deal
with this, and I created CPU_SET.3 to document them.

[...]

>> .TP
>> .B EINVAL
>> .RB ( pthread_setaffinity_np ())
>> The affinity bit mask
>> .I mask
>> contains no processors that are physically on the system.
>
> If I got it right, it seems that Linux supports (or is preparing) hot=
plug of
> CPUs cards... So when you say that "mask contains no processors that =
are
> physically on the system", it should be understood: at the point of t=
ime
> where pthread_setaffinity_np() has been issued.

To hint at this, I added the word "currently"

=3D=3D
=2ETP
=2EB EINVAL
=2ERB ( pthread_setaffinity_np ())
The affinity bit mask
=2EI mask
contains no processors that are currently physically on the system.
=3D=3D

> .TP
>> .BR EINVAL
>> .RB ( pthread_setaffinity_np ())
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
>
> True. But what does it mean for an application programmer? That I am
> requesting a processor which is outside of the set supported by the k=
ernel
> (structure). Strictly speaking, this processor could be physically pr=
esent.
>
> So, If I sum-up the two EINVAL cases above, I get something like:
>
> The affinity bit mask <code>mask</code> contains no processors that a=
re
> physically on the system, or contains a processor outside of the set
> supported by the kernel.

Okay, I agree it could be clearer.  So, what I did was reword the
second EINVAL error somewhat:

=3D=3D
=2ETP
=2EBR EINVAL
=2ERB ( pthread_setaffinity_np ())
=2EI cpuset
specified a CPU that was outside the set supported by the kernel.
(The kernel configuration option
=2EBR CONFIG_NR_CPUS
defines the range of the set supported by the kernel data type
=2E\" cpumask_t
used to represent CPU sets.)
=3D=3D

>> In glibc 2.3.3 only,
>> versions of these functions were provided that did not have a
>> .I cpusetsize
>> argument.
>> Instead the CPU set size given to the underlying system calls was al=
ways
>> .IR sizeof(cpu_set_t) .
>
> That's funny. Didn't you mention above that "the cpusetsize should be
> sizeof(cpu_set_t)"... So for now, it's not that much different ;-)

Yes, once could get that impression.  In the light of your comments,
Bert's comments, and my changes (CPU_SET.3), elsewhere in the page, I
have now added this explanation elsewhere in the page:

=3D=3D
The argument
=2EI cpusetsize
is the length (in bytes) of the buffer pointed to by
=2EIR cpuset .
Typically, this argument would be specified as
=2EIR sizeof(cpu_set_t) .
(It may be some other value, if using the macros described in
=2EBR CPU_SET (3)
for dynamically allocating a CPU set.)
=3D=3D

[...]

>>    /* Check the actual affinity mask assigned to the thread */
>>
>>    s =3D pthread_getaffinity_np(thread, sizeof(cpu_set_t), &cpuset);
>>    if (s !=3D 0)
>>        errExitEN(s, "sched_getaffinity");
>>
>>    printf("Set returned by pthread_getaffinity_np() contained:\\n");
>>    for (j =3D 0; j < CPU_SETSIZE; j++)
>>        if (CPU_ISSET(j, &cpuset))
>>            printf("    CPU %d\\n", j);
>>
>>    exit(EXIT_SUCCESS);
>> }
>> .fi
>
> This might be obvious to all of you, but it wasn't to me... The CPU s=
et used
> for the affinity is the intersection of the set passed to
> pthread_setaffinity_np() and the set of processors supported by the
> kernel...
>
> That's why your example shall work, even if the system where it runs =
has
> less than 8 processors.

It's true.  The page should say something to make this clearer.  I
added this text to NOTES

       After a call to  pthread_setaffinity_np(3),  the  set  of
       CPUs  on which the thread will actually run is the inter-
       section of the set specified in the cpuset  argument  and
       the set of CPUs actually present on the system.  The sys-
       tem may further restrict the set of  CPUs  on  which  the
       thread  runs  if  the  "cpuset"  mechanism  described  in
       cpuset(7) is  being  used.   These  restrictions  on  the
       actual  set  of  CPUs  on  which  the thread will run are
       silently imposed by the kernel.

Thanks for these insightful comments Lo=EFc!

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
