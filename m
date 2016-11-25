From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 21:54:05 +0100
Message-ID: <af075c46-152a-0392-d33f-c7956d3c8a0b@gmail.com>
References: <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
 <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
 <1480089063.4075.80.camel@gmx.de>
 <d3d491d3-0770-d017-4f3c-43d88346835c@gmail.com>
 <20161125161810.GR3092@twins.programming.kicks-ass.net>
 <2cc53b76-668b-edf1-6aa7-e6cb5a9801e1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2cc53b76-668b-edf1-6aa7-e6cb5a9801e1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Peter,

On 11/25/2016 05:34 PM, Michael Kerrisk (man-pages) wrote:
> On 11/25/2016 05:18 PM, Peter Zijlstra wrote:
>> On Fri, Nov 25, 2016 at 05:08:44PM +0100, Michael Kerrisk (man-pages) wrote:
>>> On 11/25/2016 04:51 PM, Mike Galbraith wrote:
>>> Well that's one way of looking at it. So, the change 
>>> that I'm talking about came in 2.6.32 with CFS then?
>>
>> cfs-cgroup landed later I think, and it was fairly wobbly in the first
>> few release (as per usual I'd say for major features).
> 
> So I've been searching git logs and elsewhere, but didn't yet
> find a likely commit(s). Any clues what I should be looking for.
> I'd like this info, because while documenting the changes, I'd
> also like to document when they occurred.

So, part of what I was struggling with was what you meant by cfs-cgroup.
Do you mean the CFS bandwidth control features added in Linux 3.2?

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
