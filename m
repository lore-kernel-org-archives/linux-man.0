From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] perf_event_open.2: cfix
Date: Sat, 27 Jul 2013 12:14:53 +0200
Message-ID: <51F39D9D.7080102@gmail.com>
References: <1374519679-1390-1-git-send-email-taffit@debian.org> <1374519679-1390-2-git-send-email-taffit@debian.org> <51EE6858.1050607@gmail.com> <alpine.DEB.2.10.1307232019570.22444@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1307232019570.22444-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/24/13 02:22, Vince Weaver wrote:
> On Tue, 23 Jul 2013, Michael Kerrisk (man-pages) wrote:
>=20
>> On 07/22/13 21:01, David Pr=E9vot wrote:
>>> ---
>>>  man2/perf_event_open.2 | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> I'm not so sure that the change below is correct. Maybe Vince has so=
me
>> input.
>=20
> it's probably best to have consistent capitalization, and lower case=20
> is probably fine.
>=20
> I should research further what "remote cache 2 hops" really means, bu=
t=20
> that is probably a job for another day.

Okay. I've applied the patch.

Cheers,

Michael


>>> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
>>> index b1a7114..ef89b05 100644
>>> --- a/man2/perf_event_open.2
>>> +++ b/man2/perf_event_open.2
>>> @@ -1673,7 +1673,7 @@ memory hierarchy level hit or miss, a bitwise=
 combination of
>>>  .B PERF_MEM_LVL_REM_CCE1
>>>  (remote cache 1 hop),
>>>  .B PERF_MEM_LVL_REM_CCE2
>>> -(remote Cache 2 hops),
>>> +(remote cache 2 hops),
>>>  .B PERF_MEM_LVL_IO
>>>  (I/O memory), and
>>>  .B PERF_MEM_LVL_UNC
>>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
