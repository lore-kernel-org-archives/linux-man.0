From: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Mon, 15 Aug 2016 01:13:59 +0300
Message-ID: <20160814221359.GD1857@uranus.lan>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
 <20160814084026.GA1857@uranus.lan>
 <20160814104856.GA12246@pc.thejh.net>
 <20160814201441.GC1857@uranus.lan>
 <20160814204635.GA2803@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160814204635.GA2803-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Iago =?iso-8859-1?Q?L=F3pez?= Galeiras <iago-973cpzSjLbNWk0Htik3J/w@public.gmane.org>, Andrey Vagin <avagin-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Aug 14, 2016 at 10:46:35PM +0200, Jann Horn wrote:
> On Sun, Aug 14, 2016 at 11:14:41PM +0300, Cyrill Gorcunov wrote:
> > On Sun, Aug 14, 2016 at 12:48:56PM +0200, Jann Horn wrote:
> > > > 
> > > > Hi! First of all, sorry for delay. Guys, this is not really true. The same
> > > > applies to plain "ls /proc".
> > > 
> > > It does not. /proc is wobbly in a running system, /proc/$pid/children is
> > > completely unreliable.
> > 
> > Nope -- look into how pids are instantinated: once pids are read new ones
> > may appear which you won't notice without re-read. You still may miss freshly
> > created pids.
> 
> That's pretty much inherent when you're inspecting a moving system - by the
> time you've collected your information, it might be stale. So what?

What "what"? I told you that the information you fetch from running system
only valid when kernel does its work, once you jump back to userspace
the information might not be valid anymore. And the @children does the
same: in native procfs read you may miss freshly created processes,
in @children read you may miss exited processes. It's the same nature.

> > In turn children doesn't guarantee that the pid you've fetched
> > is still valid, and for validation sake we've been using ptrace + test of
> > children's parent pid being the same after the read. So no, I wouldn't call
> > it _completely_ unreliable. It rather may give misses on tasks which are
> > using fork/execve intensively, but it's acceptable trade off in a sake
> > of speed (and the speed was the primary target why we've added this
> > interface).
> 
> It's an "acceptable trade off" when such an interface drops information about
> a relationship that existed before the caller starts inspecting the process
> relationships and continues to exist while the inspection runs?

Sigh, even task state may change right after it written back into
seq output. Jann, I really not follow what you're trying to say.
The output procfs produces changes all the time, it's running system,
if you need a sold state -- stop/freeze all processes first and
the output will be valid.

> Interfaces that ususally work but sometimes, randomly, silently drop
> information just suck, at least if you're trying to write software that
> actually works. 

@children interface works as expected and as intended: a cheap way
to get children list in one pass.

> > > > You can fetch pid from the procfs and then
> > > > process get dead just right after you've finished reading. So this interface
> > > > works "properly" all the time, but if one needs precise results it should
> > > > stop/freeze processes first. In contrary I think it worth switching into
> > > > children interface in user-space programs because it incredibly fast.
> > > 
> > > In procfs, when you want to enumerate all tasks that are currently running,
> > > you can do the following:
> > > 
> > >  - Read /proc with readdir() or so, but discard all information except for
> > >    the PIDs.
> > >  - For each PID:
> > >   - chdir() into /proc/$pid
> > >   - stat '.' and read files inside '.'
> > > 
> > > This will yield information about all tasks that were running at the start
> > > of the operation and are still running. AFAIK, the internal consistency of
> > 
> > No, they may start exiting while you examinate them, but task structure
> > and linked data won't disapper until reference is decremented.
> 
> ... so?

See above: to get solid/valid state one have to stop/freeze tasks he is
expecting, that's all.

...
> > > I think these should work for obtaining a sufficiently consistent view
> > > of the process structure of a running system.
> > > 
> > > But yeah, safely using this interface isn't easy, and more
> > > inode-centered APIs for interaction with processes would be nice to
> > > have. (E.g. an entry in /proc/$pid that points to the parent inode,
> > > maybe a directory containing entries that point to the child inodes,
> > > and process directory entries offering functionality equivalent to
> > > syscalls like kill(), sched_setscheduler() and prlimit().)
> > 
> > Well, all this really waste a huge amount of time, that's why we needed
> > $children. In general more preferred way might be task-diag interface
> > which Andrew implemented (I'm not sure which exactly state of the
> > series at the moment, have it been merged or not https://lkml.org/lkml/2016/4/11/932)
> 
> Yuck. Everything is PID-based? That's ugly.

That happened the process are pid based things.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
