From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Fri, 19 Aug 2011 14:25:03 +0200
Message-ID: <20110819122503.GA8411@redhat.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org> <20110817115543.GA8745@redhat.com> <CAPXgP12rYf2HmmsJAuJw=nrtcjTRR1WzDhLNM47eKhKA1UTfJQ@mail.gmail.com> <20110817134516.GA14136@redhat.com> <20110818124353.GA2839@tango.0pointer.de> <20110818142508.GA30959@redhat.com> <1313691091.1107.9.camel@mop> <20110818184857.GA12094@redhat.com> <1313717521.991.4.camel@mop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313717521.991.4.camel@mop>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/19, Kay Sievers wrote:
>
> On Thu, 2011-08-18 at 20:48 +0200, Oleg Nesterov wrote:
> > On 08/18, Kay Sievers wrote:
>
> > No, this doesn't look right.
> >
> > This code should do something like
> >
> > 		for (reaper = father->real_parent;
> > 		     !same_thread_group(reaper, pid_ns->child_reaper);
>
> Without that check, bootup immediately hangs. The problem is, I expect,
> that we need to exit the loop for re-parenting kernel threads,

Argh. Indeed, I forgot about kthreads. See below.

> - optimization: let processes inherit a flag to indicate that there is
>   a subreaper to lookup, in case they need to be re-parented.

I'll write another email about this...

>  static struct task_struct *find_new_reaper(struct task_struct *father)
>  	__releases(&tasklist_lock)
> @@ -724,6 +725,23 @@ static struct task_struct *find_new_reap
>  		 * forget_original_parent() must move them somewhere.
>  		 */
>  		pid_ns->child_reaper = init_pid_ns.child_reaper;
> +	} else if (father->signal->has_child_subreaper) {
> +		struct task_struct *reaper;
> +
> +		/* find the first ancestor marked as child_subreaper */
> +		for (reaper = father->real_parent;
> +		     reaper != reaper->real_parent;

This looks mysterious. This relies on the fact that INIT_TASK(tsk)
sets .real_parent = tsk. "reaper != &init_task" looks much more clean.
And we can't use PF_KTHREAD because of usermodehelper.

But. Now that you check ->has_child_subreaper before the lookup,
this problem should go away? I mean, if ->has_child_subreaper == T
then some of our parents is the userspace task. Even if it was
spawned by kthread and then exited, we can't miss ->child_reaper
in the parents chain.

Or I missed something?


> +			if (!reaper->signal->is_child_subreaper)
> +				continue;
> +			thread = reaper;
> +			do {
> +				if (!(thread->flags & PF_EXITING))
> +					return reaper;
> +			} while_each_thread(reaper, thread);

Yes, this looks correct.

> +		case PR_SET_CHILD_SUBREAPER:
> +			me->signal->is_child_subreaper = !!arg2;
> +			me->signal->has_child_subreaper = true;

Hmm. This looks wrong... why do we set ->has_child_subreaper?

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
