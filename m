From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Wed, 17 Aug 2011 13:55:43 +0200
Message-ID: <20110817115543.GA8745@redhat.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201108162011.p7GKBcY0023134-AB4EexQrvXRQetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org, kay.sievers-tD+1rO4QERM@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/16, Andrew Morton wrote:
>
> From: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
>
> Userspace service managers/supervisors need to track their started
> services.  Many services daemonize by double-forking and get implicitely
> re-parented to PID 1.  The process manager will no longer be able to
> receive the SIGCHLD signals for them.
>
> With this prctl, a service manager can mark itself as a sort of 'sub-init'
> process, able to stay as the parent process for all processes created by
> the started services.  All SIGCHLD signals will be delivered to the
> service manager.

I try to never argue with the new features. But to be honest, this
doesn't look very good to me.

OK, a service manager M does prctl(PR_SET_CHILD_REAPER), then it forks
a service X which forks another child C and exits. Then C exits and
notifies M.

But. How can M know that the service X should be restarted? It only
knows the pid. What if wait(WEXITED) succeeds because C in turn does
fork + exit? What M has 2 or more services?




Anyway, the implementation is certainly buggy.

> @@ -1296,6 +1296,8 @@ struct task_struct {
>  				 * execve */
>  	unsigned in_iowait:1;
>
> +	/* Reparent child processes to this process instead of pid 1. */
> +	unsigned child_reaper:1;

First of all - this is already very wrong imho. This should be
per-process, not per-thread.

> +	/* find the first ancestor which is marked as child_reaper */
> +	for (reaper = father->parent;
> +	     reaper != &init_task && reaper != pid_ns->child_reaper;
> +	     reaper = reaper->parent)

This loop can never reach init_task/child_reaper and crash the kernel.
For example, father->parent can point to init_task's sub-thread.

OTOH you shouldn't use init_task at all.

Also. You shouldn't do this if the sub-namespace init exits, this is
wrong.

> +		if (reaper->child_reaper)
> +			return reaper;

No, we can't blindly return this task, it can be dead/exiting. More
precisely, we must not do this if it has already passed
forget_original_parent(). That is why the code above checks PF_EXITING.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
