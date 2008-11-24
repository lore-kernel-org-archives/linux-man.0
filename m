From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_setcancelstate.3
Date: Mon, 24 Nov 2008 21:56:07 +0100
Message-ID: <492B14E7.30403@domaigne.com>
References: <cfd18e0f0811140926r40781376t8a6340479bf8426f@mail.gmail.com>	 <4927AEAF.6060802@domaigne.com> <cfd18e0f0811241023n55ef2a9dk3ed77455b5c36841@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811241023n55ef2a9dk3ed77455b5c36841-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday Michael,


>> The paragraph is important, but I found it somewhat difficult to rea=
d.
>=20
> Yes, I see.  There was at least one clumsy wording "Since...since"
> which made that over-long sentence had to parse.

[...]

> Thanks Loic.  I took some pieces of your suggestion, and arrived at
> the following
>=20
>        Setting  the  cancelability type to PTHREAD_CANCEL_ASYNCHRONOU=
S
>        is rarely useful.  Since the thread could be  canceled  at  an=
y
>        time, it cannot safely reserve resources (e.g., allocating mem=
-
>        ory with malloc(3)), acquire mutexes, semaphores, or locks, an=
d
>        so  on.   Reserving  resources is unafe because the applicatio=
n

s/unafe/unsafe/

>        has no way of knowing what the state of these resources is whe=
n
>        the  thread is canceled; that is, did cancellation occur befor=
e
>        the resources were reserved, while they were reserved, or afte=
r
>        they  were  released?  Consequently, clean-up handlers cease t=
o

worse: the invariant of some internal structures might get violated=20
(e.g. if a list is used to manage chunk of memory malloc'ed, and the=20
thread gets asynchronously canceled while updating the list).

>        be useful.  Functions that can be  safely  asynchronously  can=
-
>        celed  are  called  async-cancel-safe  functions.  POSIX.1-200=
1
>        only requires that pthread_cancel(3), pthread_setcancelstate()=
,
>        and  pthread_setcanceltype() be async-cancel-safe.  In general=
,
>        other library functions can't be safely called  from  an  asyn=
