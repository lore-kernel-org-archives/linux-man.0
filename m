From: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC 3/3] man-pages: Add man page for vmpressure_fd(2)
Date: Wed, 21 Nov 2012 15:01:50 +0000
Message-ID: <20121121150149.GE8218@suse.de>
References: <20121107105348.GA25549@lizard>
 <20121107110152.GC30462@lizard>
 <20121119215211.6370ac3b.akpm@linux-foundation.org>
 <20121120062400.GA9468@lizard>
 <alpine.DEB.2.00.1211201004390.4200@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1211201004390.4200-X6Q0R45D7oAcqpCFd4KODRPsWskHk0ljAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Nov 20, 2012 at 10:12:28AM -0800, David Rientjes wrote:
> On Mon, 19 Nov 2012, Anton Vorontsov wrote:
> 
> > We try to make userland freeing resources when the system becomes low on
> > memory. Once we're short on memory, sometimes it's better to discard
> > (free) data, rather than let the kernel to drain file caches or even start
> > swapping.
> > 
> 
> To add another usecase: its possible to modify our version of malloc (or 
> any malloc) so that memory that is free()'d can be released back to the 
> kernel only when necessary, i.e. when keeping the extra memory around 
> starts to have a detremental effect on the system, memcg, or cpuset.  When 
> there is an abundance of memory available such that allocations need not 
> defragment or reclaim memory to be allocated, it can improve performance 
> to keep a memory arena from which to allocate from immediately without 
> calling the kernel.
> 

A potential third use case is a variation of the first for batch systems. If
it's running low priority tasks and a high priority task starts that
results in memory pressure then the job scheduler may decide to move the
low priority jobs elsewhere (or cancel them entirely).

A similar use case is monitoring systems running high priority workloads
that should never swap. It can be easily detected if the system starts
swapping but a pressure notification might act as an early warning system
that something is happening on the system that might cause the primary
workload to start swapping.

-- 
Mel Gorman
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
