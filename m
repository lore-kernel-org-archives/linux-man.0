From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] posix_fallocate.3: Mention glibc emulation caveats.
Date: Thu, 08 Oct 2015 23:10:18 +0200
Message-ID: <5616DBBA.2080906@gmail.com>
References: <560E0567.7040204@redhat.com> <56123D86.9050601@gmail.com> <561521D6.50106@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561521D6.50106-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 10/07/2015 02:44 PM, Carlos O'Donell wrote:
> On 10/05/2015 05:06 AM, Michael Kerrisk (man-pages) wrote:
>> Hi Carlos,
>>
>> On 10/02/2015 05:17 AM, Carlos O'Donell wrote:
>>> Michael,
>>>
>>> You're going to really enjoy reading this patch ;-)
>>
>> Thanks for the patch. What a sad story :-{
> 
> I've gotten at least one hate mail for documenting how broken
> it is when the underlying filesystem doesn't support it ;-)
> 
> Florian Weimer (Red Hat) started a rather long and interesting
> discussion on libc-alpha about removing the emulation layer,
> but we found that it was impossible to do without breaking a
> lot of userspace applications that operate over NFS, are
> single-threaded, and expect posix_fallocate to work correctly.
> 
> The best compromise was to document the behaviour, and wait
> for everyone to use NFS 4.2, at which point the issue goes
> away. Until then we need to help users cope.
> 
> The worst case scenario would be that we remove the fallback
> and all the downstream users start implementing their own
> incorrect and poorly tested fallback. One fallback
> in one project, reviewed by a dozen people is sane.

<nod>

>> Thanks. I've applied. I tweaked the wording a bit in a further
>> commit, and then made a further commit where I tried to fine tune
>> the  technical details a little. Could you please check commit
>> 624fbe44d9c1ef54eb3fd36328f59a5037b87986 and let me know if there
>> ia any technical misstep there?
> 
> Looks perfect. The goal is to scare you into reviewing your code ;-)

Thanks for checking it, Carlos.

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
