From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [patch] sched/autogroup: Fix 64bit kernel nice adjustment
Date: Wed, 23 Nov 2016 15:12:21 +0100
Message-ID: <1479910341.4306.46.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
         <1479897217.4306.6.camel@gmx.de>
         <d21cf0b2-5c62-5a49-8758-58793c454cc2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d21cf0b2-5c62-5a49-8758-58793c454cc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2016-11-23 at 14:47 +0100, Michael Kerrisk (man-pages) wrote:
> Hello Mike,
> 
> On 11/23/2016 11:33 AM, Mike Galbraith wrote:
> > On Tue, 2016-11-22 at 16:59 +0100, Michael Kerrisk (man-pages)
> > wrote:
> > 
> > >        ┌─────────────────────────────────────────────────────┐
> > >        │FIXME                                                │
> > >        ├─────────────────────────────────────────────────────┤
> > >        │Regarding the previous paragraph...  My tests  indi‐ │
> > >        │cate  that writing *any* value to the autogroup file │
> > >        │causes the task group to get a lower priority.  This │
> > 
> > Because autogroup didn't call the then meaningless scale_load()...
> 
> So, does that mean that this buglet kicked in starting (only) in 
> Linux 4.7 with commit 2159197d66770ec01f75c93fb11dc66df81fd45b?

Yeah, that gave it teeth.

	-Mike
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
