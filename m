From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setaffinity_np.3
Date: Thu, 6 Nov 2008 14:32:46 -0500
Message-ID: <cfd18e0f0811061132u5f4026b5lc9238757c6ccf0e8@mail.gmail.com>
References: <cfd18e0f0811041447w57dd5de4he68ca780ed963074@mail.gmail.com>
	 <36ca99e90811051000j619ff316u8c836352627fe4a0@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90811051000j619ff316u8c836352627fe4a0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, =?ISO-8859-1?Q?Loic_Domaign=E9?= <loic-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Bert,

Thanks for looking the page over.

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
> Yeah, I like this naming confusion:
>
> http://sourceware.org/ml/libc-alpha/2008-03/msg00080.html
>
>>
>> For more details on CPU affinity masks,
>> as well as a description of a set of macros
>> that can be used to manipulate and inspect CPU sets, see
>> .BR sched_setaffinity (2)
>> for details.
>> .SH RETURN VALUE
>> On success, these functions return 0;
>> on error, they return a non-zero error number.
>> .SH ERRORS
>> .TP
>> .B EFAULT
>> A supplied memory address was invalid.
>> .TP
>> .B EINVAL
>> .RB ( pthread_setaffinity_np ())
>> The affinity bit mask
>> .I mask
>> contains no processors that are physically on the system.
>> .TP
>> .BR EINVAL
>> .RB ( pthread_setaffinity_np ())
>> .I cpuset
>> specified a CPU that was outside the range
>> permitted by the kernel data type
>> .\" cpumask_t
>> used to represent CPU sets.
>> .\" The raw sched_getaffinity() system call returns the size (in bytes)
>> .\" of the cpumask_t type.
> Maybe a more detailed hint is needed, that cpumask_t and cpu_set_t are
> the 'same', the former inside the kernel the latter in user space. But
> I think such deep kernel internals doesn't belong to a API description
> (because cpumask_t may gone, see 'struct cpumask' patches). I would
> just replace cpumask_t by cpu_set_t.

But they are not the same think (which makes things a little weird).
The kernel's cpumask_t is

typedef struct { DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;

Where NR_CPUS depends on the CONFIG_NR_CPUS config option.

But in userspace, cpu_set_t is

# define __CPU_SETSIZE  1024
# define __NCPUBITS     (8 * sizeof (__cpu_mask))

/* Data structure to describe CPU mask.  */
typedef struct
{
  __cpu_mask __bits[__CPU_SETSIZE / __NCPUBITS];
} cpu_set_t;

That is, cpu_mask_t is always 1024 bits, but cpumask_t may be (and
typically is) smaller.

[...]

>> .SH SEE ALSO
>> .BR sched_getaffinity (2),
>> .BR sched_setaffinity (2),
>> .BR sched_getscheduler (2),
>> .BR pthread_getaffinity_np (3),
>> .BR pthread_setaffinity_np (3),
> Maybe pthread__attr_{set,get}affinity_np, too.
>
>> .BR cpuset (7),
>> .BR pthreads (7)

Good idea.  And in fact, I had already changed it to:

.SH SEE ALSO
.BR sched_getcpu (3),
.BR sched_setaffinity (2),
.BR sched_setscheduler (2),
.BR pthread_attr_setaffinity_np (3),
.BR pthread_self (3),
.BR cpuset (7),
.BR pthreads (7)

(Some "get" functions disappeared from the list since they are
documented in the corresponding "set" page.)

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
