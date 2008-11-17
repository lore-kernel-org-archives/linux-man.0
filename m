From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_setschedparam.3
Date: Mon, 17 Nov 2008 20:22:24 +0100
Message-ID: <4921C470.5070807@domaigne.com>
References: <cfd18e0f0811060945n3224567du5e98adecb074b5e@mail.gmail.com>	 <491F3AA6.6050303@domaigne.com> <cfd18e0f0811171023l38ae6a0ci1bbece2dcc9e441d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811171023l38ae6a0ci1bbece2dcc9e441d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

I've only a minor comment left.

I've set the following reminder:

<reminder>

- effect of sched_setscheduler() on MT-process.
- priority adjustment =3D> later, when dealing with the topic on prio=20
inheritance/ceiling.

</reminder>

Cheers,
Lo=EFc.
--

>>> .PP
>>> .BR pthread_setschedparam ()
>>> may additionally fail with the following errors:
>>> .TP
>>> .B EINVAL
>>> .I policy
>>> is not a recognized policy, or
>>> .I param
>>> does not make sense for the
>>> .IR policy .
>> I got troubled by the "may additionally", as "may" has a particular =
meaning
>> in POSIX.1...
>>
>> But I guess, you just want to express that pthread_setschedparam() s=
hall
>> fail if the policy or the param is invalid, right?
>=20
> Yes.

What about using "pthread_setschedparam() can additionally [...]" in a=20
similar fashion to pthread_setcancelstate(3)" ?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
