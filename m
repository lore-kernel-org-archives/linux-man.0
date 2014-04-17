From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 -- expand ERRORS section
Date: Thu, 17 Apr 2014 11:03:23 +0200
Message-ID: <CAKgNAkhAoMoML2Upvd3BVOpXEiVKDAFsO8UYFPpUy9Kdr4td+Q@mail.gmail.com>
References: <alpine.DEB.2.10.1404070052310.16856@vincent-weaver-1.um.maine.edu>
 <5346F5EC.6080600@gmail.com> <alpine.DEB.2.10.1404101621260.30596@vincent-weaver-1.um.maine.edu>
 <534BBC07.7040105@gmail.com> <alpine.DEB.2.10.1404151342450.15528@vincent-weaver-1.um.maine.edu>
 <534E2ECA.5030605@bfs.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534E2ECA.5030605-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Apr 16, 2014 at 9:18 AM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>
>
> Am 15.04.2014 20:25, schrieb Vince Weaver:
>> On Mon, 14 Apr 2014, Michael Kerrisk (man-pages) wrote:
>>
>>>
>>>        EACCES Returned when the requested event requires root  perm=
is=E2=80=90
>>>               sions  (or  a  more  permissive perf_event paranoid s=
et=E2=80=90
>>>               ting).  Some common cases where an unprivileged  proc=
ess
>>>               may  encounter  this  error:  are attaching to a proc=
ess
>>>               owned by a different user; monitoring all processes o=
n a
>>>               given CPU; and not setting exclude_kernel when the pa=
ra=E2=80=90
>>>               noid setting requires it.
>>>
>>> But, now I have some more questions:
>>>
>>> * What are "root permissions" here? It's these days usual to expres=
s
>>>   things precisely in terms of the required capability.
>>
>> Yes, I guess that should really be CAP_SYS_ADMIN
>>
>>> * I am puzzled by "monitoring all processes on a CPU"? So, monitori=
ng
>>>   _some_ (i.e., < all) processes on a CPU won't trigger this error?
>>
>> I was a bit confused here.
>>
>> A regular user can monitor "the specified process on CPU X" or "the
>> specified process on any CPU".
>>
>> A user running as root can also monitor "all procceses belonging to =
anyone
>> on CPU X"
>>
>
> why not "can monitor any process" ?

Thanks for the heads-up, Walter. The wording *is* confusing, but I
believe the fix is different from what you suspect:

[[
@@ -2404,8 +2404,9 @@ permissions (or a more permissive perf_event
paranoid setting).
Some common cases where an unprivileged process
may encounter this error:
attaching to a process owned by a different user;
-monitoring all processes (including those not belonging to the user)
-on a given CPU;
+monitoring all processes on a given CPU (i.e., specifying the
+.I pid
+argument as \-1);
and not setting
=2EI exclude_kernel
when the paranoid setting requires it.
]]

Cheers

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
