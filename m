From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 -- expand ERRORS section
Date: Mon, 14 Apr 2014 12:44:23 +0200
Message-ID: <534BBC07.7040105@gmail.com>
References: <alpine.DEB.2.10.1404070052310.16856@vincent-weaver-1.um.maine.edu> <5346F5EC.6080600@gmail.com> <alpine.DEB.2.10.1404101621260.30596@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1404101621260.30596-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Vince,

On 04/10/2014 10:30 PM, Vince Weaver wrote:
> On Thu, 10 Apr 2014, Michael Kerrisk (man-pages) wrote:
>=20
>> I've applied this, but have a question or two below.
>>
>> On 04/07/2014 06:56 AM, Vince Weaver wrote:
>=20
>>> +.B EACCES
>>> +Returned when the requested event requires root permissions
>>> +(or a more permissive perf_event paranoid setting).
>>> +Some common causes are attaching to a process owned by a different=
 user,
>>> +monitoring all processes on a given cpu,
>>
>> I don't understand that line above. Could you clarify. How is
>> "monitoring all processes on a given given cpu" a cause of=20
>> this error."
>=20
> If you configure to monitor all processes by setting cpu=3D-1 then yo=
u
> are potentially measuring processes belonging to other users, which
> would be a security leak.  So you get EACCES.

I was just thrown a bit by your wording. I revised this a little to=20
the following. Does it look okay?

       EACCES Returned when the requested event requires root  permis=E2=
=80=90
              sions  (or  a  more  permissive perf_event paranoid set=E2=
=80=90
              ting).  Some common cases where an unprivileged  process
              may  encounter  this  error:  are attaching to a process
              owned by a different user; monitoring all processes on a
              given CPU; and not setting exclude_kernel when the para=E2=
=80=90
              noid setting requires it.

But, now I have some more questions:

* What are "root permissions" here? It's these days usual to express
  things precisely in terms of the required capability.
* I am puzzled by "monitoring all processes on a CPU"? So, monitoring=20
  _some_ (i.e., < all) processes on a CPU won't trigger this error?

>>> +.B EPERM
>>> +Returned if sufficient permissions not available to create the eve=
nt.

Again, somewhere here, the text should mention the required capability.

>>> +This includes attempting to set a breakpoint on a kernel address
>>> +and setting a ftrace function trace tracepoint.
>>
>> I don't understand the previous line. Why is "setting a ftrace funct=
ion=20
>> trace tracepoint" a cause of EPERM?
>=20
> Would it be cleared if it were "ftrace function-trace tracepoint"?

That would help.

> This is a recent change. =20

So, the text should mention a kernel version number. Could you patch=20
that please. I guess it should be something like:

    and (since Linux 3.??) setting an ftrace function-trace tracepoint

> It was a lockup bug we found, it turns out
> that letting an average user set function-trace tracepoints can cause
> problems, if for example they set a tracepoint in an interrupt handle=
r
> that causes an overflow that triggers an interrupt you get a recursiv=
e=20
> loop.  The easy solution was to just make function-trace tracepoints
> root-only (meaning that yes, root can crash the kernel easily using=20
> perf_event_open() ).
>=20
> Now why it returns EPERM not EACCES, I don't know.
>=20
> I can try to update the text in these two cases to be a bit more clea=
r.
> I'm never sure how much extra details like this are suitable without
> overwhelming the document with extraneous details.

If you could send some patch(es) to fix the above, that would be good.
As ever, thanks for your great work on this page.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
