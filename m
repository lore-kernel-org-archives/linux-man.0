From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: cgroups(7): documenting cgroups v2 thread mode
Date: Wed, 10 Jan 2018 06:47:08 -0800
Message-ID: <20180110144708.GC3668920@devbig577.frc2.facebook.com>
References: <b2d54ae2-62db-7402-ed99-7a0e72f90ff4@gmail.com>
 <20180109211000.GT3668920@devbig577.frc2.facebook.com>
 <5c9ea5dd-12dc-99d6-7905-40fdbc34e6ae@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cgroups-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5c9ea5dd-12dc-99d6-7905-40fdbc34e6ae-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: cgroups-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, cgroups-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Li Zefan <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Paul Turner <pjt-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, kernel-team-b10kYP2dOMg@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Johannes Weiner <hannes-druUgvl0LCNAfugRpC6u6w@public.gmane.org>, Lauro Venancio <lvenanci-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Waiman Long <longman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

On Tue, Jan 09, 2018 at 11:54:03PM +0100, Michael Kerrisk (man-pages) wrote:
> One more thing. I added the following sentence to the text:
> 
>        The  cgroup.threads file is writable only for the cgroups inside a
>        threaded subtree.
> 
> Can you confirm that that is correct, please.

The only extra restriction is that the domain cgroup must be the same
for the source and destination, which is true for the entire threaded
subtree (the threaded domain).  As each domain cgroup is its own
unique domain, cgroup.threads in them would only allow migrating to
self which is a noop; otherwise, it'd return -EOPNOTSUPP.

Thanks.

-- 
tejun
