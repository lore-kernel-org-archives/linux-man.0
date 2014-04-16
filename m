From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 -- expand ERRORS section
Date: Wed, 16 Apr 2014 09:18:34 +0200
Message-ID: <534E2ECA.5030605@bfs.de>
References: <alpine.DEB.2.10.1404070052310.16856@vincent-weaver-1.um.maine.edu> <5346F5EC.6080600@gmail.com> <alpine.DEB.2.10.1404101621260.30596@vincent-weaver-1.um.maine.edu> <534BBC07.7040105@gmail.com> <alpine.DEB.2.10.1404151342450.15528@vincent-weaver-1.um.maine.edu>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1404151342450.15528-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 15.04.2014 20:25, schrieb Vince Weaver:
> On Mon, 14 Apr 2014, Michael Kerrisk (man-pages) wrote:
>=20
>>
>>        EACCES Returned when the requested event requires root  permi=
s=E2=80=90
>>               sions  (or  a  more  permissive perf_event paranoid se=
t=E2=80=90
>>               ting).  Some common cases where an unprivileged  proce=
ss
>>               may  encounter  this  error:  are attaching to a proce=
ss
>>               owned by a different user; monitoring all processes on=
 a
>>               given CPU; and not setting exclude_kernel when the par=
a=E2=80=90
>>               noid setting requires it.
>>
>> But, now I have some more questions:
>>
>> * What are "root permissions" here? It's these days usual to express
>>   things precisely in terms of the required capability.
>=20
> Yes, I guess that should really be CAP_SYS_ADMIN
>=20
>> * I am puzzled by "monitoring all processes on a CPU"? So, monitorin=
g=20
>>   _some_ (i.e., < all) processes on a CPU won't trigger this error?
>=20
> I was a bit confused here.
>=20
> A regular user can monitor "the specified process on CPU X" or "the=20
> specified process on any CPU".
>=20
> A user running as root can also monitor "all procceses belonging to a=
nyone=20
> on CPU X"
>=20

why not "can monitor any process" ?

re,
 wh

> Other combinations aren't possible.
>=20
>>>>> +.B EPERM
>>>>> +Returned if sufficient permissions not available to create the e=
vent.
>>
>> Again, somewhere here, the text should mention the required capabili=
ty.
>=20
> Yes, it's CAP_SYS_ADMIN again.
>=20
>>> This is a recent change. =20
>>
>> So, the text should mention a kernel version number. Could you patch=
=20
>> that please. I guess it should be something like:
>>
>>     and (since Linux 3.??) setting an ftrace function-trace tracepoi=
nt
>=20
> Yes, I'll do that.
>=20
> Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
