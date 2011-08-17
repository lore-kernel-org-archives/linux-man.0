From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Wed, 17 Aug 2011 15:45:16 +0200
Message-ID: <20110817134516.GA14136@redhat.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org> <20110817115543.GA8745@redhat.com> <CAPXgP12rYf2HmmsJAuJw=nrtcjTRR1WzDhLNM47eKhKA1UTfJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPXgP12rYf2HmmsJAuJw=nrtcjTRR1WzDhLNM47eKhKA1UTfJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/17, Kay Sievers wrote:
>
> On Wed, Aug 17, 2011 at 13:55, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > I try to never argue with the new features. But to be honest, this
> > doesn't look very good to me.
> >
> > OK, a service manager M does prctl(PR_SET_CHILD_REAPER), then it fo=
rks
> > a service X which forks another child C and exits. Then C exits and
> > notifies M.
> >
> > But. How can M know that the service X should be restarted? It only
> > knows the pid.
>
> Legacy services write pid files and we read them, so we know the pid
> to watch for. Proper services never double-fork and reparent in a
> modern init environment.

OK. So, this patch can only help to handle the legacy services? And
the service should participate (write pid files for example). And,

>
> > What if wait(WEXITED) succeeds because C in turn does
> > fork + exit?
>
> Nothing is really doing this.

OK. But this means you propose this patch to solve the very specific
problems. IOW, imho this doesn't look very useful "in general" to me.

May be we need something else instead... And iiuc you don't really
need to change the reparenting, you only want the notification if
the process exits.



> >> @@ -1296,6 +1296,8 @@ struct task_struct {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* e=
xecve */
> >> =A0 =A0 =A0 unsigned in_iowait:1;
> >>
> >> + =A0 =A0 /* Reparent child processes to this process instead of p=
id 1. */
> >> + =A0 =A0 unsigned child_reaper:1;
> >
> > First of all - this is already very wrong imho. This should be
> > per-process, not per-thread.
>
> What do you mean? That would go where instead?

You should mark the whole process as sub-reaper, not a single thread
which does prctl(). The parent/child relationship is process-wide.

If nothing else. Suppose that application does pthread_create(), the
new thread does prctl(REAPER) and exits.

> >> + =A0 =A0 /* find the first ancestor which is marked as child_reap=
er */
> >> + =A0 =A0 for (reaper =3D father->parent;
> >> + =A0 =A0 =A0 =A0 =A0reaper !=3D &init_task && reaper !=3D pid_ns-=
>child_reaper;
> >> + =A0 =A0 =A0 =A0 =A0reaper =3D reaper->parent)
> >
> > This loop can never reach init_task/child_reaper and crash the kern=
el.
>
> You mean: *if* this loop can never ...?

Yes.

> > For example, father->parent can point to init_task's sub-thread.
> >
> > OTOH you shouldn't use init_task at all.
>
> What would we use instead?

You should check ->child_reaper only. But see above, it can be multithr=
eaded.

> > Also. You shouldn't do this if the sub-namespace init exits, this i=
s
> > wrong.
>
> It we find a sub-init, before the namespace PID1, why wouldn't we ret=
urn it?

Ah, I meant pid_ns->child_reaper, not task->child_reaper.

If pid_ns->child_reaper exits we should never try to "reparent" its
children, see zap_pid_ns_processes() in particular. IOW, this should
go into the "else" branch of "if (pid_ns->child_reaper =3D=3D father)"

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
