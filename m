From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setschedparam.3
Date: Tue, 18 Nov 2008 07:04:18 -0500
Message-ID: <cfd18e0f0811180404v39215fa8rc367591eeb596d01@mail.gmail.com>
References: <cfd18e0f0811060945n3224567du5e98adecb074b5e@mail.gmail.com>
	 <491F3AA6.6050303@domaigne.com>
	 <cfd18e0f0811171023l38ae6a0ci1bbece2dcc9e441d@mail.gmail.com>
	 <4921C470.5070807@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4921C470.5070807-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Loic,

On Mon, Nov 17, 2008 at 2:22 PM, Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org> wrot=
e:
> Hi Michael,
>
> I've only a minor comment left.
>
> I've set the following reminder:
>
> <reminder>
>
> - effect of sched_setscheduler() on MT-process.

Will follow up shortly.

> - priority adjustment =3D> later, when dealing with the topic on prio
> inheritance/ceiling.

There remains the FIXME in the page source.

> </reminder>
>
> Cheers,
> Lo=EFc.
> --
>
>>>> .PP
>>>> .BR pthread_setschedparam ()
>>>> may additionally fail with the following errors:
>>>> .TP
>>>> .B EINVAL
>>>> .I policy
>>>> is not a recognized policy, or
>>>> .I param
>>>> does not make sense for the
>>>> .IR policy .
>>>
>>> I got troubled by the "may additionally", as "may" has a particular
>>> meaning
>>> in POSIX.1...
>>>
>>> But I guess, you just want to express that pthread_setschedparam() =
shall
>>> fail if the policy or the param is invalid, right?
>>
>> Yes.
>
> What about using "pthread_setschedparam() can additionally [...]" in =
a
> similar fashion to pthread_setcancelstate(3)" ?

Done.

Thanks,

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
