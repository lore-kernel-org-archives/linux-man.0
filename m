From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 3/3] man-pages: Add man page for vmpressure_fd(2)
Date: Tue, 20 Nov 2012 10:12:28 -0800 (PST)
Message-ID: <alpine.DEB.2.00.1211201004390.4200@chino.kir.corp.google.com>
References: <20121107105348.GA25549@lizard> <20121107110152.GC30462@lizard> <20121119215211.6370ac3b.akpm@linux-foundation.org> <20121120062400.GA9468@lizard>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121120062400.GA9468@lizard>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 19 Nov 2012, Anton Vorontsov wrote:

> We try to make userland freeing resources when the system becomes low on
> memory. Once we're short on memory, sometimes it's better to discard
> (free) data, rather than let the kernel to drain file caches or even start
> swapping.
> 

To add another usecase: its possible to modify our version of malloc (or 
any malloc) so that memory that is free()'d can be released back to the 
kernel only when necessary, i.e. when keeping the extra memory around 
starts to have a detremental effect on the system, memcg, or cpuset.  When 
there is an abundance of memory available such that allocations need not 
defragment or reclaim memory to be allocated, it can improve performance 
to keep a memory arena from which to allocate from immediately without 
calling the kernel.

Our version of malloc frees memory back to the kernel with 
madvise(MADV_DONTNEED) which ends up zaping the mapped ptes.  With 
pressure events, we only need to do this when faced with memory pressure; 
to keep our rss low, we require that thp's max_ptes_none tunable be set to 
0; we don't want our applications to use any additional memory.  This 
requires splitting a hugepage anytime memory is free()'d back to the 
kernel.

I'd like to use this as a hook into malloc() for applications that do not 
have strict memory footprint requirements to be able to increase 
performance by keeping around a memory arena from which to allocate.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
