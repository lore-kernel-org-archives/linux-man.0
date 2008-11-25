From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_setcancelstate.3
Date: Tue, 25 Nov 2008 21:48:01 +0100
Message-ID: <492C6481.9090809@domaigne.com>
References: <cfd18e0f0811140926r40781376t8a6340479bf8426f@mail.gmail.com>	 <4927AEAF.6060802@domaigne.com>	 <cfd18e0f0811241023n55ef2a9dk3ed77455b5c36841@mail.gmail.com>	 <492B14E7.30403@domaigne.com> <cfd18e0f0811241446x79b93ac1u37078317f328e5fa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811241446x79b93ac1u37078317f328e5fa-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

Looks good to me.

Lo=EFc.
--

> Hi Loic,
>=20
> On Mon, Nov 24, 2008 at 3:56 PM, Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org> wr=
ote:
>> Gidday Michael,
>>
>>
>>>> The paragraph is important, but I found it somewhat difficult to r=
ead.
>>> Yes, I see.  There was at least one clumsy wording "Since...since"
>>> which made that over-long sentence had to parse.
>> [...]
>>
>>> Thanks Loic.  I took some pieces of your suggestion, and arrived at
>>> the following
>>>
>>>       Setting  the  cancelability type to PTHREAD_CANCEL_ASYNCHRONO=
US
>>>       is rarely useful.  Since the thread could be  canceled  at  a=
ny
>>>       time, it cannot safely reserve resources (e.g., allocating me=
m-
>>>       ory with malloc(3)), acquire mutexes, semaphores, or locks, a=
nd
>>>       so  on.   Reserving  resources is unafe because the applicati=
on
>> s/unafe/unsafe/
>=20
> Fixed.
>=20
>>>       has no way of knowing what the state of these resources is wh=
en
>>>       the  thread is canceled; that is, did cancellation occur befo=
re
>>>       the resources were reserved, while they were reserved, or aft=
er
>>>       they  were  released?  Consequently, clean-up handlers cease =
to
>> worse: the invariant of some internal structures might get violated =
(e.g. if
>> a list is used to manage chunk of memory malloc'ed, and the thread g=
ets
>> asynchronously canceled while updating the list).
>=20
> Yes, maybe it's worth emphasizing that.  I added a sentence, so now w=
e have:
>=20
>        Setting  the  cancelability type to PTHREAD_CANCEL_ASYNCHRONOU=
S
>        is rarely useful.  Since the thread could be  canceled  at  an=
y
>        time, it cannot safely reserve resources (e.g., allocating mem=
-
>        ory with malloc(3)), acquire mutexes, semaphores, or locks, an=
d
>        so  on.   Reserving resources is unsafe because the applicatio=
n
>        has no way of knowing what the state of these resources is whe=
n
>        the  thread is canceled; that is, did cancellation occur befor=
e
>        the resources were reserved, while they were reserved, or afte=
r
>        they were released?  Furthermore, some internal data structure=
s
>        (e.g., the linked list of free blocks managed by the  malloc(3=
)
>        family  of  functions)  may be left in an inconsistent state i=
f
>        cancellation occurs in the middle of the function call.  Conse=
-
>        quently,  clean-up handlers cease to be useful.  Functions tha=
t
>        can be safely asynchronously canceled are called  async-cancel=
-
>        safe  functions.   POSIX.1-2001 only requires that pthread_can=
