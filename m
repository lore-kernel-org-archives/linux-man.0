From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_cancel.3
Date: Sat, 22 Nov 2008 07:52:32 +0100
Message-ID: <4927AC30.6030107@domaigne.com>
References: <cfd18e0f0811140917q5340504akc53d7ffa3eea483@mail.gmail.com> <4921C900.6040302@domaigne.com> <4922C93D.1010804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4922C93D.1010804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday Michael,

>>> Asynchronous cancelability
>>> means that the thread can be canceled at any time
>>> (usually immediately, but the system does not guarantee this).
>>> Deferred cancelability means that cancellation will be delayed unti=
l
>>> the thread next calls a function that is a
>>> .IR "cancellation point" .
>>> A list of functions that are or may be cancellation points is=20
>>> provided in
>>> .IR pthreads (7).
>>
>> It is very important to document the list of functions that are/are=20
>> not CP in the "may be a CP" list: this is system specific and belong=
s=20
>> to the system documentation.
>=20
> For man-pages-3.14, I have added POSIX.1's lists of "are" and "may be=
"
> cancellation points to pthreads.7.
>=20
> However, it unclear to me how one determines the list of functions
> that are cancellation points under glibc.  Do you have some ideas
> about this?

I checked out, and I found no obvious to extract the information=20
automatically from the source. We may have to ask support from the Glib=
c=20
folks.


>>> .SH NOTES
>>> On Linux, cancellation is implemented using signals.
>>> Under the NPTL threading implementation,
>>> the first real-time signal (i.e., signal 32) is used for this purpo=
se.
>>
>> Hmmm... You are right: NPTL uses the first real-time signal (32)=20
>> provided by the *kernel*. As a matter of fact, Glibc reserves kernel=
=20
>> real-time signals 32 and 33 for NPTL; real-time queued signals=20
>> available to the application ranges from SIGRTMIN (34) to SIGRTMAX(6=
4).
>=20
> Yes... exactly.
>=20
>>> On LinuxThreads, the second real-time signal is used,
>>> if real-time signals are available, otherwise
>>> .B SIGUSR2
>>> is used.
>>
>> IIRC, this was true on 'older LinuxThreads'. Never used real-time=20
>> queued signals as well ? (To verify...)
>=20
> I'm not quite sure what you want to say there.  Can you say some
> more please.

Sorry, typo and missing words make this sentence hard to understand...=20
Second try:

Newer version of LinuxThreads uses RT signal as well? (this claim has t=
o=20
be verified).

>=20
>>> .SH EXAMPLE
> [...]
>=20
>> sleep(3) is a CP on Linux (AFAIR, sleep is a "may be CP").
>=20
> Not sure what you are wanting to saying here; should something
> be changed in the page?  (BTW: sleep() *is* a CP in POSIX.1.)
>=20
> [...]

I hadn't the list at hand, and I thought mistakenly that sleep() is not=
=20
a mandatory CP. Thanks for the note.

Cheers,
Lo=EFc.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
