From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_setaffinity_np.3
Date: Sat, 15 Nov 2008 20:41:05 +0100
Message-ID: <491F25D1.8020007@domaigne.com>
References: <cfd18e0f0811041447w57dd5de4he68ca780ed963074@mail.gmail.com>	 <4916133A.8060209@domaigne.com>	 <cfd18e0f0811140704l18e5741fgdbb5a6c52fb8cbe7@mail.gmail.com> <cfd18e0f0811140750r5a22255bx7bd53c580b42cc6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811140750r5a22255bx7bd53c580b42cc6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael!

Looks good to me. I have only one minor comment left, regarding EINVAL=20
for pthread_setaffinity_np():

> .TP
> .BR EINVAL
> .RB ( pthread_setaffinity_np ())
> .I cpuset
> specified a CPU that was outside the set supported by the kernel.
> (The kernel configuration option
> .BR CONFIG_NR_CPUS
> defines the range of the set supported by the kernel data type
> .\" cpumask_t
> used to represent CPU sets.)
> .\" The raw sched_getaffinity() system call returns the size (in byte=
s)
> .\" of the cpumask_t type.

In the light of Bert's comment, it seems that the Linux kernel folks=20
wants to make the cpumask_t dynamic. So CONFIG_NR_CPUS might become=20
obsolete in the future...

But for now, your explanation is fine.

Cheers,
Lo=EFc.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
