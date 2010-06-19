From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: man-pages text for MAV_MERGEABLE and MADV_UNMERGEABLE
Date: Sat, 19 Jun 2010 14:29:18 +0200
Message-ID: <20100619122918.GJ18946@basil.fritz.box>
References: <AANLkTinX4TlNfvwrCtjfkU-bar3URnpvmPJB-sOi-9aT@mail.gmail.com>
 <20100619085849.GD18946@basil.fritz.box>
 <AANLkTikNEECT9CgPuCKy0h1LVKfjdXM-lavzW-TnUTz-@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikNEECT9CgPuCKy0h1LVKfjdXM-lavzW-TnUTz--JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, hugh.dickins-IWqWACnzNjwqdlJmJB21zg@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jun 19, 2010 at 02:22:33PM +0200, Michael Kerrisk wrote:
> Hi Andi,
> 
> On Sat, Jun 19, 2010 at 10:58 AM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> >> +.IR len .
> >> +The KSM daemon
> >> +.RI ( ksmd )
> >
> > You should probably make clear it's a kernel thread, not a classic
> > daemon.
> 
> Thanks. I changed it to "KSM kernel thread"
> 
> >> +periodically scans those areas of user memory that have
> >> +been marked as mergeable,
> >> +looking for pages with identical content.
> >
> > Overall it seems like an internal implementation detail.
> 
> Not sure how I could improve this. Did you have some specific idea in mind?

Just dropping the sentence or using soft language like "the kernel regularly
attempts to merge pages" 

-Andi

-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
