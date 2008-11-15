From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_attr_setaffinity_np.3
Date: Sat, 15 Nov 2008 20:51:27 +0100
Message-ID: <491F283F.5000300@domaigne.com>
References: <cfd18e0f0811050617h75c6ed47q31a10058fd257842@mail.gmail.com>	 <491B509E.6070801@domaigne.com> <cfd18e0f0811140842k78d935a3g4af1e9c81efd74d1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811140842k78d935a3g4af1e9c81efd74d1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,


>>> .TH PTHREAD_ATTR_SETAFFINITY_NP 3 2008-11-05 "Linux" "Linux Program=
mer's
>>> Manual"
>> Title looks weird on a 80x24 terminal.
>=20
> Yes.  But, hard to help -- I couldn't think of a reasonable, more
> abbreviated name for the page title.

Sure. I just reviewed using the '-pedantic' flag :-D


>>> .TP
>>> .BR EINVAL
>>> .RB ( pthread_attr_setaffinity_np ())
>>> .I cpuset
>>> specified a CPU that was outside the range
>>> permitted by the kernel data type
>>> .\" cpumask_t
>>> used to represent CPU sets.
>>> .\" The raw sched_getaffinity() system call returns the size (in by=
tes)
>>> .\" of the cpumask_t type.
>>> This range is determined by the kernel configuration option
>>> .BR CONFIG_NR_CPUS .
>=20
> (While we're here: I changed the text of this EINVAL error to be the
> same as the revised EINVAL error text in ptherad_setaffinity_np(3).)
>=20
>> <check>
>> Hmmm. What does happen if CPU set contains no CPU physically on the =
system
>> when the thread is created? I guess pthread_create() fails?
>> </check>
>=20
> I would expect pthread_create() to fail with EINVAL, and testing
> confirms this.  (There is an EINVAL error diagnostic in
> pthread_create(3): "Invalid settings in attr".)

=46ine. I expected something like that, but I didn't got the opportunit=
y=20
to check it. Thanks.


>>> .TP
>>> .B ENOMEM
>>> .RB ( pthread_attr_setaffinity_np ())
>>> Could not allocate memory.
>> Correct. However, the glibc looks somewhat suspicious to me: I had e=
xpected
>> the memory allocated by iattr->cpuset to be bounded (by the size of =
the
>> underlying kernel structure).
>>
>> Or perhaps I am just missing my coffeine :o
>=20
> Not sure if you are suggesting that I need to change anything here?

I suggest to change the glibc code, not your description.


> .\" Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
> .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

[snip]

The revised version looks good to me.

Cheers,
Lo=EFc.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
