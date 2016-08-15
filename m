From: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Mon, 15 Aug 2016 15:34:29 +0300
Message-ID: <20160815123429.GF1857@uranus.lan>
References: <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
 <20160814084026.GA1857@uranus.lan>
 <20160814104856.GA12246@pc.thejh.net>
 <20160814201441.GC1857@uranus.lan>
 <20160814204635.GA2803@pc.thejh.net>
 <20160814221359.GD1857@uranus.lan>
 <20160814224546.GA32168@pc.thejh.net>
 <20160815085004.GE1857@uranus.lan>
 <20160815115333.GA11115@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160815115333.GA11115-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Vagin <avagin-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Aug 15, 2016 at 01:53:33PM +0200, Jann Horn wrote:
> > 
> > I happen to know how this code work, i've been writting it. And it's the same
> > as reading plain pids: you might miss freshly created pids completely until
> > the re-read. The rule of thumb is to re-validate the results, always, or
> > stop the processes first.
> 
> Ah, I think maybe I understad what you're saying. If you want a list of PIDs that
> includes all stable children of a given running process, you have to read the
> "children" file in a loop until two reads return the same list, using the fact
> that the children are ordered by the time they became children of the target
> process and therefore the read following a read that triggered the slowpath
> always returns something different unless all children following the position
> that triggered the slowpath are replaced? Or something like that?

Exactly. In criu (if freezer cgroup is not used) we do check if the children
we've read are still valid when we start operating with the PIDs. In short
it's like: seize task and fetch its children (no new children may apprer since
task is seized) and then iterate over each children and check the parent pid is not
changed (simultaneously each children get seized). Run-time application should
compare output to be the same if they are not seizing processes, just like you
said.

> (If you just read "children" without the loop-until-stable rule, as far as I can
> tell, no amount of revalidation will prevent you from missing dropped children.)

Yeah. For tools like top/htop the reader should make a few reads if it needs
more-less precise results. In turn if only a rough picture is needed plain
single read is enough. Look, the read of @children it extremelly fast and
may be combined with traditional walk over procfs. IIRC someone been lookin
into using this feature in top-like utility. But I don't remember the
details if they successed.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
