From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature
Date: Wed, 23 Nov 2016 16:33:49 +0100
Message-ID: <1479915229.4306.106.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
         <1479901185.4306.38.camel@gmx.de>
         <327586fa-4672-d070-0ded-850654586273@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <327586fa-4672-d070-0ded-850654586273-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2016-11-23 at 14:54 +0100, Michael Kerrisk (man-pages) wrote:
> Hi Mike,
> 
> First off, I better say that I'm not at all intimate with the details
> of the scheduler, so bear with me...
> 
> On 11/23/2016 12:39 PM, Mike Galbraith wrote:
> > On Tue, 2016-11-22 at 16:59 +0100, Michael Kerrisk (man-pages) wrote:
> > 
> > >        ┌─────────────────────────────────────────────────────┐
> > >        │FIXME                                                │
> > >        ├─────────────────────────────────────────────────────┤
> > >        │The following is a little vague. Does it need to  be │
> > >        │made more precise?                                   │
> > >        └─────────────────────────────────────────────────────┘
> > >        The CFS scheduler employs an algorithm that distributes the CPU
> > >        across task groups.  As a result of this  algorithm,  the  pro‐
> > >        cesses  in task groups that contain multiple CPU-intensive pro‐
> > >        cesses are in effect disfavored by the scheduler.
> > 
> > Mmmm, they're actually equalized (modulo smp fairness goop), but I see
> > what you mean.
> 
> I couldn't quite grok that sentence. My problem is resolving "they".
> Do you mean: "the CPU scheduler equalizes the distribution of
> CPU cycles across task groups"?

Sort of.  "They" are scheduler entities, runqueue (group) or task.  The
scheduler equalizes entity vruntimes.
 
> > >        │FIXME                                                │
> > >        ├─────────────────────────────────────────────────────┤
> > >        │Is the following correct? Does the statement need to │
> > >        │be  more  precise? (E.g., in precisely which circum‐ │
> > >        │stances does the use of cgroups override autogroup?) │
> > >        └─────────────────────────────────────────────────────┘
> > >        The use of the cgroups(7) CPU controller overrides  the  effect
> > >        of autogrouping.
> > 
> > Correct, autogroup defers to cgroups.  Perhaps mention that moving a
> > task back to the root task group will result in the autogroup again
> > taking effect.
> 
> In what circumstances does a process get moved back to the root 
> task group?

Userspace actions, tool or human fingers.
 
 
> Actually, can you define for me what the root task group is, and 
> why it exists? That may be worth some words in this man page.

I don't think we need group scheduling details, there's plenty of
documentation elsewhere for those who want theory.  Autogroup is for
those who don't want to have to care (which is also why it should have
never grown nice knob).

	-Mike
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
