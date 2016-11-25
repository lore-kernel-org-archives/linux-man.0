From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 22:49:36 +0100
Message-ID: <20161125214936.GB3045@worktop.programming.kicks-ass.net>
References: <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
 <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
 <1480089063.4075.80.camel@gmx.de>
 <d3d491d3-0770-d017-4f3c-43d88346835c@gmail.com>
 <20161125161810.GR3092@twins.programming.kicks-ass.net>
 <2cc53b76-668b-edf1-6aa7-e6cb5a9801e1@gmail.com>
 <af075c46-152a-0392-d33f-c7956d3c8a0b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <af075c46-152a-0392-d33f-c7956d3c8a0b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Nov 25, 2016 at 09:54:05PM +0100, Michael Kerrisk (man-pages) wrote:
> So, part of what I was struggling with was what you meant by cfs-cgroup.
> Do you mean the CFS bandwidth control features added in Linux 3.2?

Nope, /me digs around for a bit... around here I suppose:

 68318b8e0b61 ("Hook up group scheduler with control groups")

68318b8e0b61 v2.6.24-rc1~151

But I really have no idea what that looked like.

In any case, for the case of autogroup, the behaviour has always been,
autogroups came quite late.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
