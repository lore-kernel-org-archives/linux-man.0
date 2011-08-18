From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Thu, 18 Aug 2011 20:48:57 +0200
Message-ID: <20110818184857.GA12094@redhat.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org> <20110817115543.GA8745@redhat.com> <CAPXgP12rYf2HmmsJAuJw=nrtcjTRR1WzDhLNM47eKhKA1UTfJQ@mail.gmail.com> <20110817134516.GA14136@redhat.com> <20110818124353.GA2839@tango.0pointer.de> <20110818142508.GA30959@redhat.com> <1313691091.1107.9.camel@mop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313691091.1107.9.camel@mop>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Kay,

I need to go away, I'll read this patch (and the whole email) tomorrow.

Just a quick note right now,

On 08/18, Kay Sievers wrote:
>
>  static struct task_struct *find_new_reaper(struct task_struct *father)
>  	__releases(&tasklist_lock)
> @@ -724,6 +725,19 @@ static struct task_struct *find_new_reap
>  		 * forget_original_parent() must move them somewhere.
>  		 */
>  		pid_ns->child_reaper = init_pid_ns.child_reaper;
> +	} else {
> +		/* find the first ancestor which is marked as child_reaper */
> +		for (thread = father->real_parent;
> +		     thread != thread->real_parent;
> +		     thread = thread->real_parent) {
> +			if (thread == pid_ns->child_reaper)
> +				break;
> +			if (!thread->signal->child_reaper)
> +				continue;
> +			if (thread->flags & PF_EXITING)
> +				continue;
> +			return thread;

No, this doesn't look right.

This code should do something like

		for (reaper = father->real_parent;
		     !same_thread_group(reaper, pid_ns->child_reaper);
		     reaper = reaper->real_parent) {
			if (!signal->child_reaper)
				continue;

			if (there is a !PF_EXITING thread)
				return thread;
		}

And I forgot to mention, could you please-please rename child_reaper?
Say, is_child_reaper or is_sub_reaper. Or whatever. I do not really
care about the naming. But I use grep very often, and personally I
dislike the task->child_reaper/signal->child_reaper confusion.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
