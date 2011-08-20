From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Sat, 20 Aug 2011 17:33:31 +0200
Message-ID: <20110820153331.GA22577@redhat.com>
References: <20110818124353.GA2839@tango.0pointer.de> <20110818142508.GA30959@redhat.com> <1313691091.1107.9.camel@mop> <20110818184857.GA12094@redhat.com> <1313717521.991.4.camel@mop> <20110819122503.GA8411@redhat.com> <CAPXgP11KC2fTWBVYo6CBXe924YAyTGhx9=UTBDf4cP5Acuo0NA@mail.gmail.com> <20110819131339.GB8411@redhat.com> <1313763653.1119.12.camel@mop> <20110819145815.GA15420@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110819145815.GA15420-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/19, Oleg Nesterov wrote:
>
> On 08/19, Kay Sievers wrote:
> >
> > version 4:
>
> Looks correct... But I don't trust myself. Especially after I missed
> the problem with klthreads ;)

And I missed another problem. So. We do need to check that
father != init_task even if we check has_child_subreaper.



Suppose that a kernel thread execs the usermode task T which
does prctl(REAPER). Suppose that its grandchild C exits, it
should be reparented to T.

If T is alive - everything fine, the lookup finds T with
->is_sub_reaper set.

If T has exited - everything fine again, C->parent was already
reparented to pid_ns->child_reaper (or another sub-reaper).

But! If T exits, there is a window between setting PF_EXITING
and forget_original_parent() which should re-parent C->parent.
If C exits in this window, it will see PF_EXITING and continue
the lookup, but it will never reach pid_ns->child_reaper.

(if we could check ->exit_state instead of PF_EXITING, everything
 would be fine).





And cough... there is another, not that subtle problem ;) That
task T can _clear_ ->is_child_subreaper after forking the child.
But since this obviously can't clear C->has_child_subreaper, we
can't trust it.




So. please add this check back. I insisted you should remove it,
but I was wrong. Otherwise looks correct.





Damn. And why do we check PF_EXITING but not exit_state? this is
because we have to drop tasklist for exit_task_namespaces(), see
762a24beed3f3ab93224bd447710e6c36fcf1968. However, there were a
lot of changes since then. Afaics we can change do_notify_parent()
to use task_active_pid_ns(tsk->parent) and then we can call
exit_task_namespaces() before exit_notify(). In this case we can
change exit_notify/forget_original_parent to reparent and set
exit_state under tasklist, this also saves unlock+lock.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
