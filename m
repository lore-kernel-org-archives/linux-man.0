From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 23:48:16 +0100
Message-ID: <20161125224816.GC3045@worktop.programming.kicks-ass.net>
References: <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
 <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
 <20161125160456.GP3092@twins.programming.kicks-ass.net>
 <c0f61369-9601-0c90-8b85-61e75e4f4e82@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c0f61369-9601-0c90-8b85-61e75e4f4e82-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Nov 25, 2016 at 05:33:23PM +0100, Michael Kerrisk (man-pages) wrote:

> Okay -- you're really quite the ASCII artist. And somehow,
> I think you needed to compose the mail in LaTeX. But thanks
> for the detail. It's helpful, for me at least.

Hehe, its been a while since I did LaTeX, so I'd probably make a mess of
it :-) Glad my ramblings made sense.

> > Note that this property, where the weight of the server entity is
> > independent from its child entities is a desired feature. Without that
> > it would be impossible to control the relative weights of groups, and
> > that is the sole parameter of the WFQ model.
> > 
> > It is also why Linus so likes autogroups, each session competes equally
> > amongst one another.
> 
> I get it. But, the behavior changes for the process nice value are
> undocumented, and they should be documented. I understand
> what the behavior change was. But not yet when.

Well, its all undocumented -- I suppose you're about to go fix that :-)

But think of it differently, think of the group as a container, then the
behaviour inside the container is exactly as expected.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
