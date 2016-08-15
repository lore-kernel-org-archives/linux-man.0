From: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Mon, 15 Aug 2016 11:50:04 +0300
Message-ID: <20160815085004.GE1857@uranus.lan>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
 <20160814084026.GA1857@uranus.lan>
 <20160814104856.GA12246@pc.thejh.net>
 <20160814201441.GC1857@uranus.lan>
 <20160814204635.GA2803@pc.thejh.net>
 <20160814221359.GD1857@uranus.lan>
 <20160814224546.GA32168@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160814224546.GA32168-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Vagin <avagin-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Aug 15, 2016 at 12:45:46AM +0200, Jann Horn wrote:
> > > 
> > > That's pretty much inherent when you're inspecting a moving system - by the
> > > time you've collected your information, it might be stale. So what?
> > 
> > What "what"? I told you that the information you fetch from running system
> > only valid when kernel does its work, once you jump back to userspace
> > the information might not be valid anymore. And the @children does the
> > same: in native procfs read you may miss freshly created processes,
> > in @children read you may miss exited processes. It's the same nature.
> 
> "in @children read you may miss exited processes"? If that was the extent of it,
> everything would be fine. But that's not what's happening. Read the comment in
> get_children_pid():
> 
> 	 * We might miss some children here if children
> 	 * are exited while we were not holding the lock,
> 	 * but it was never promised to be accurate that
> 	 * much.
> 	 *
> 	 * "Just suppose that the parent sleeps, but N children
> 	 *  exit after we printed their tids. Now the slow paths
> 	 *  skips N extra children, we miss N tasks." (c)
> 
> "skips N extra children". *NOT* necessarily the same N children that exited, but
> also children that were running before you started reading the "children" file
> and are still running afterwards.

I happen to know how this code work, i've been writting it. And it's the same
as reading plain pids: you might miss freshly created pids completely until
the re-read. The rule of thumb is to re-validate the results, always, or
stop the processes first.

> That's the big difference between the interfaces: Normal procfs reads might not
> return new or outdated information, which is mostly inherent when you're

Really? It returns outdated information all the time: for example read
@maps output, once userspace buffer is filled this data no longer valid.
If you need a precise results stop the process first.

> inspecting a running system, but the "children" interface can also drop
> information about completely stable task relationships.

> > > > > I think these should work for obtaining a sufficiently consistent view
> > > > > of the process structure of a running system.
> > > > > 
> > > > > But yeah, safely using this interface isn't easy, and more
> > > > > inode-centered APIs for interaction with processes would be nice to
> > > > > have. (E.g. an entry in /proc/$pid that points to the parent inode,
> > > > > maybe a directory containing entries that point to the child inodes,
> > > > > and process directory entries offering functionality equivalent to
> > > > > syscalls like kill(), sched_setscheduler() and prlimit().)
> > > > 
> > > > Well, all this really waste a huge amount of time, that's why we needed
> > > > $children. In general more preferred way might be task-diag interface
> > > > which Andrew implemented (I'm not sure which exactly state of the
> > > > series at the moment, have it been merged or not https://lkml.org/lkml/2016/4/11/932)
> > > 
> > > Yuck. Everything is PID-based? That's ugly.
> > 
> > That happened the process are pid based things.
> 
> PID-based interfaces suck unless you're the ptracer or reaper of all the
> tasks you're inspecting, and an interface based on less reusable handles
> (like procfs directory file descriptors or unique 64-bit identifiers or
> whatever) would be much safer.
> 
> Yes, I know that all those traditional APIs use PIDs, but that doesn't
> change that those interfaces suck. When you kill -9 a daemon that doesn't
> quit when asked to quit, for example, there's a chance that the daemon
> actually does quit and its PID is reallocated to some vital system
> service just before you call kill() - and then your system breaks in
> some unpleasant way.

/me shrugs

Some unique uiids instead of pids might be better (and in distributed
environments they are the only option) but there is no need to make
things more complex than they already are. For kill -9 example, indeed
once you're typed the command the process might be already dead and pid
reused by someone else. Still, you can simply write your own utility
which would use ptrace to kill exactly process you need, but usually
we go an easy way and simply zap hunging taks by "kill". That's fine.
Everyone knows that there is a risk zapping someone else instead of
a target.

	Cyrill
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
