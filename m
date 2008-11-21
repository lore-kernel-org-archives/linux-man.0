From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_setschedparam.3
Date: Fri, 21 Nov 2008 20:06:55 +0100
Message-ID: <492706CF.7080105@domaigne.com>
References: <cfd18e0f0811060945n3224567du5e98adecb074b5e@mail.gmail.com> <491F3AA6.6050303@domaigne.com> <4922C81F.6070907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4922C81F.6070907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday Michael,

> Okay, here I'll revisit this piece.
>=20
>>> The returned priority value is that set by the most recent
>>> .BR pthread_setschedparam (),
>>> .BR pthread_setschedprio (3),
>>> or
>>> .BR pthread_create (3)
>>> call that affected
>>> .IR thread .
>>
>> Hmm, that's perfectly right from a POSIX point of view. Knowing how=20
>> Linux implements threads, I have been interested about the effect of=
=20
>> sched_setscheduler() on a MT-process (since NPTL uses 1:1 model, thi=
s=20
>> should be a NOP).
>=20
> Why should it be a NOP?

Because it is stated in SuSv3 TC2:

<copy>
Each process shall be controlled by an associated scheduling policy and
priority. These parameters may be specified by explicit application
execution of the sched_setscheduler() or sched_setparam() functions.

The effect of the process scheduling attributes on individual threads
in the process is dependent on the scheduling contention scope of the
threads, see <ref>Thread Scheduling</ref>:

(*) For threads with system scheduling contention scope, the process
scheduling attributes shall have no effect on the scheduling attributes
or behavior either of the visible POSIX thread or an underlying kernel
scheduling entity dedicated to that thread.

[...]

</copy>

Since NPTL uses 1:1 model, i.e. all threads have system scheduling=20
contention scope. Hence, sched_setscheduler() should not affect the=20
current threads scheduling.

It happens that I know this part of the standard quite well, because I=20
reworked it together with David Butenhof 4 years ago (XSH ERN 52)... We=
=20
attempt to describe in a better way what 1003.1-2004 meant in this rega=
rd.

By the way, on GNU/Linux sched_setscheduler() might possibly affect the=
=20
scheduling of the calling thread (and not only the main thread, as=20
stated in my previous email). This was the true some Glibc version ago.=
=2E.

See also:
http://groups.google.de/group/comp.unix.programmer/browse_thread/thread=
/2531f90c0b05ef95/e66e69ad57349f7f
https://www.opengroup.org/sophocles/show_mail.tpl?CALLER=3Dshow_archive=
=2Etpl&source=3DL&listname=3Daustin-group-l&id=3D8143
http://groups.google.de/group/comp.unix.programmer/browse_thread/thread=
/5c305e82eef3f975/3cbb9722f1f49c15
http://www.qnx.com/developers/docs/6.3.2/neutrino/lib_ref/s/sched_setsc=
heduler.html


HTH,
Lo=EFc.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
