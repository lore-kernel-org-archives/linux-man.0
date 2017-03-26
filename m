From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ttyname.3: document ENODEV error code
Date: Sun, 26 Mar 2017 14:47:32 +0200
Message-ID: <c3bc0470-b6a6-2ecb-dcb2-97e355c1e307@gmail.com>
References: <20170320205104.GA27434@altlinux.org>
 <CAPP7u0WL2wa2MLavq22q616=-pHNPyNXqLpPGzR4JqYzGA16-A@mail.gmail.com>
 <20170320215823.GA28075@altlinux.org>
 <a3314168-ac99-28ef-2916-4da65adc8377@gmail.com>
 <CAPP7u0Ux2_pKFdS1X0_5SbR_MmvAmcR7+f=XcUOXWJ1Fr0naWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPP7u0Ux2_pKFdS1X0_5SbR_MmvAmcR7+f=XcUOXWJ1Fr0naWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Brauner <christian.brauner-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Hallyn <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?St=c3=a9phane_Graber?= <stgraber-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/24/2017 03:53 PM, Christian Brauner wrote:
> Sorry, for the late reply.
> 
> On Fri, Mar 24, 2017 at 3:40 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Dmitry,
>>
>> On 03/20/2017 10:58 PM, Dmitry V. Levin wrote:
>>> Hi,
>>>
>>> On Mon, Mar 20, 2017 at 10:02:15PM +0100, Christian Brauner wrote:
>>>> Hi,
>>>>
>>>> Thanks Dmitry. One comment
>>>>
>>>> On 20 Mar 2017 9:51 p.m., "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org> wrote:
>>>>
>>>> ---
>>>>  man3/ttyname.3 | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/man3/ttyname.3 b/man3/ttyname.3
>>>> index 14c24e7..0be50c6 100644
>>>> --- a/man3/ttyname.3
>>>> +++ b/man3/ttyname.3
>>>> @@ -71,6 +71,11 @@ File descriptor does not refer to a terminal device.
>>>>  .RB ( ttyname_r ())
>>>>  .I buflen
>>>>  was too small to allow storing the pathname.
>>>> +.TP
>>>> +.\" glibc commit 15e9a4f378c8607c2ae1aa465436af4321db0e23
>>>> +.B ENODEV
>>>> +File descriptor refers to a slave pseudoterminal device
>>>> +but the corresponding pathname could not be found.
>>>>
>>>> I think it would be good to explicitly mention that ENODEV is set in case
>>>> the fd does not refer to a pts device in its namespace. Otherwise users
>>>> might take this as an indication that this is a more generic error which is
>>>> not the case.
>>>
>>> In fact, this is a more generic error than a namespace mismatch, although
>>> the latter is the most likely reason.
>>>
>>> Imagine that the corresponding file inside /dev/pts/ is not available for
>>> some reason and the stat call has failed.  This situation could be
>>> reproduced e.g. by bind-mounting an empty directory to /dev/pts.
>>> A subsequent ttyname invocation would end up with ENODEV because the device
>>> is literally not available although it's withing the same namespace.
>>>
>>> I don't mind if you change the description to mention the namespace case
>>> as the most likely, but please do not make it the only case when ENODEV
>>> can happen.
>>
>> I'm open on this point. If someone wants to write a suitable patch, I'll
>> probably take it.
> 
> This point is in my opinion crucial. The over-mounting scenario is
> still a valid case for most programs that do not actually care about
> what /dev/pts/<n> is actually used to go on which is a nice side-effect
> of the patch. The namespace part should be mentioned since ttyname{_r}()
> explicitly does not return anything when it detects that
> /proc/self/fd/<n> points to /dev/pts/<n> but /dev/pts/<n> does not exist
> in the same namespace. This was the original motivation when we
> wrote the patch. So users that get ENODEV from ttyname{_r}() should
> be aware that resolving the symlink manually afterwards doesn't give them
> a /dev/pts/<n> path valid in the current namespace.
> 
> I'll put this on my TODO list but if someone is willing to send a
> patch right away
> please do so. :)

Hi Christian,

I think you may be best placed to know what you want to convey here.
I'd be happy to receive a patch.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
