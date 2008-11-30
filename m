From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_cleanup_push.3
Date: Sun, 30 Nov 2008 21:10:24 +0100
Message-ID: <4932F330.1010603@domaigne.com>
References: <cfd18e0f0811140919g11e625a2i8546b3296d008dce@mail.gmail.com>	 <4927B203.3000702@domaigne.com> <cfd18e0f0811241404o1415d18bq497ff34b29502263@mail.gmail.com> <492C69E6.3030402@domaigne.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <492C69E6.3030402-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday Michael,

IIRC, I had an issue left:

>>> I see a major deficiency in your code. Unless I am mistaken, the gl=
obal
>>> variable <done> and <cleanup_pop_arg> are accessed from two differe=
nt
>>> threads.
>>
>> True.
>>
>>> Following the POSIX memory model, you need mutex to synchronize the
>>> visibility.
>>
>> Please educate me about the POSIX memory model ;-).  Say some more
>> here please.  Are you meaning that the change made in main are not
>> guaranteed to visible in the other thread, unless I use a
>> synchronization mechanism?  (or, perhaps, a barrier?)
>=20
> Oh, that's a long story. Tomorrow perhaps (I just came home, and I gu=
ess=20
> Antje would like to spend some time with me...)

Please refer to St Butenhof's bible "Programming with POSIX Threads",=20
=A73.4, pp88-95.

An excerpt can be found at:
http://markmail.org/message/24zdwjjkbe4dqz5o

Basically:

1) the values you write prior to pthread_create(3) can be seen in the=20
new thread.

2) the values you write prior to mutex_unlock(3) can be seen in any=20
thread that locks later the same mutex.

3) the values you write prior to terminating a thread can be seen in th=
e=20
thread that joins.

4) the values you write prior to pthread_cond_{signal,broadcast}(3) can=
=20
be seen by any thread that is awakened.

=46ailing to comply these rules may cause your program to fail in very=20
subtle ways on multi-processors machine. Even if I may save here and=20
there a mutex; I apply those rules religiously (but, yeah, I am a=20
Pthreads fanatic ;-)

HTH,
Lo=EFc.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
