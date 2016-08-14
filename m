From: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Sun, 14 Aug 2016 23:14:41 +0300
Message-ID: <20160814201441.GC1857@uranus.lan>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
 <20160814084026.GA1857@uranus.lan>
 <20160814104856.GA12246@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160814104856.GA12246-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Iago =?iso-8859-1?Q?L=F3pez?= Galeiras <iago-973cpzSjLbNWk0Htik3J/w@public.gmane.org>, Andrey Vagin <avagin-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Aug 14, 2016 at 12:48:56PM +0200, Jann Horn wrote:
> > 
> > Hi! First of all, sorry for delay. Guys, this is not really true. The same
> > applies to plain "ls /proc".
> 
> It does not. /proc is wobbly in a running system, /proc/$pid/children is
> completely unreliable.

Nope -- look into how pids are instantinated: once pids are read new ones
may appear which you won't notice without re-read. You still may miss freshly
created pids. In turn children doesn't guarantee that the pid you've fetched
is still valid, and for validation sake we've been using ptrace + test of
children's parent pid being the same after the read. So no, I wouldn't call
it _completely_ unreliable. It rather may give misses on tasks which are
using fork/execve intensively, but it's acceptable trade off in a sake
of speed (and the speed was the primary target why we've added this
interface).

> 
> > You can fetch pid from the procfs and then
> > process get dead just right after you've finished reading. So this interface
> > works "properly" all the time, but if one needs precise results it should
> > stop/freeze processes first. In contrary I think it worth switching into
> > children interface in user-space programs because it incredibly fast.
> 
> In procfs, when you want to enumerate all tasks that are currently running,
> you can do the following:
> 
>  - Read /proc with readdir() or so, but discard all information except for
>    the PIDs.
>  - For each PID:
>   - chdir() into /proc/$pid
>   - stat '.' and read files inside '.'
> 
> This will yield information about all tasks that were running at the start
> of the operation and are still running. AFAIK, the internal consistency of

No, they may start exiting while you examinate them, but task structure
and linked data won't disapper until reference is decremented.

> per-task data has the following guarantee: All data that was collected as
> per-task data really belongs to the same task; PID reuse has no effect on
> that (because the /proc/$pid inode will not be reassociated with a new
> task that reuses the PID). Of course, different pieces of data that were
> collected at different points in time can still be somewhat inconsistent -
> especially if an execve() call happens in the meantime.
> 
> Looking up the procfs inodes corresponding to the parents or children of
> a process is a bit more complicated, but still doable. To look up the
> parent inode for a /proc/$pid inode:
> 
>  - Grab the ppid number from the "stat" entry in the process inode.
>  - Take a reference (a file descriptor) to the inode at /proc/$ppid.
>  - re-read the "stat" entry in the process inode and check whether the
>    ppid changed. if not, you're done. if yes, retry.
> 
> This works because, while the parent of a task can change multiple
> times, each such change changes the PPID to a value it never had before.
> This is true because all subreapers of a process have to be ancestors of
> it, and the ancestors of a process have to already exist when it spawns,
> so they can't spawn after the death of the process, so they can't reuse
> the PID of the process. So with this trick, you can determine the parent
> of a process in a stable way.
> 
> This approach can then be reused to find the children of a process with
> inode fd $ppid_fd:
> 
>  - Read the PID from "stat" under $ppid_fd.
>  - Create an empty result set $result that can hold file descriptors.
>  - For each numeric entry in /proc/:
>   - chdir() into /proc/$pid.
>   - Read "stat"; if the PPID isn't $wanted_ppid, go to next iteration.
>   - Add openat(".") to $result.
>  - If "stat" under $ppid_fd is still readable (as opposed to returning
>    -ESRCH on openat()), return $result.
>  - Return an empty result set or an error or so; the parent's PID has
>    been deallocated.
> 
> I think these should work for obtaining a sufficiently consistent view
> of the process structure of a running system.
> 
> But yeah, safely using this interface isn't easy, and more
> inode-centered APIs for interaction with processes would be nice to
> have. (E.g. an entry in /proc/$pid that points to the parent inode,
> maybe a directory containing entries that point to the child inodes,
> and process directory entries offering functionality equivalent to
> syscalls like kill(), sched_setscheduler() and prlimit().)

Well, all this really waste a huge amount of time, that's why we needed
$children. In general more preferred way might be task-diag interface
which Andrew implemented (I'm not sure which exactly state of the
series at the moment, have it been merged or not https://lkml.org/lkml/2016/4/11/932)

	Cyrill
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
