From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_attr_setaffinity_np.3
Date: Sat, 15 Nov 2008 11:17:37 +0100
Message-ID: <491EA1C1.9000809@domaigne.com>
References: <cfd18e0f0811050617h75c6ed47q31a10058fd257842@mail.gmail.com>	 <491B509E.6070801@domaigne.com> <36ca99e90811121323u2b3895dbld7a046d0545da9b3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90811121323u2b3895dbld7a046d0545da9b3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Bert!


>>> .TP
>>> .B ENOMEM
>>> .RB ( pthread_attr_setaffinity_np ())
>>> Could not allocate memory.

>> Correct. However, the glibc looks somewhat suspicious to me: I had e=
xpected
>> the memory allocated by iattr->cpuset to be bounded (by the size of =
the
>> underlying kernel structure).
> But this kernel structure is not bounded, it depends on the compile
> time constant CONFIG_NR_CPUS (or in the future on the kernel runtime
> variable nr_cpus_id), therefore glibc can't know this a-priori. (but =
I
> haven't looked into the code)

AFAICS, the kernel structure size is determined at runtime by glibc on=20
the first call of pthread_setaffinity_np() or=20
pthread_attr_setaffinity_np(). Please refer to the function=20
__determine_cpumask_size() in=20
nptl/sysdeps/unix/sysv/linux/pthread_setaffinity.c

Once you know this structure size, there is no reason to allocate a=20
bigger room for the attribute cpuset iattr->cpuset. As of glibc-2.7, th=
e=20
memory size allocated is based on the cupsetsize argument passed to=20
pthread_attr_setaffinity_np() without respect to the underlying kernel=20
structure.

Of course the Linux & Glibc folks might have some future plans that may=
=20
not be easily inferred from the actual source.

Lo=C3=AFc.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
