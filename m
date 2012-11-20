From: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 3/3] man-pages: Add man page for vmpressure_fd(2)
Date: Mon, 19 Nov 2012 22:24:00 -0800
Message-ID: <20121120062400.GA9468@lizard>
References: <20121107105348.GA25549@lizard>
 <20121107110152.GC30462@lizard>
 <20121119215211.6370ac3b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121119215211.6370ac3b.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Nov 19, 2012 at 09:52:11PM -0800, Andrew Morton wrote:
> On Wed, 7 Nov 2012 03:01:52 -0800 Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >        Upon  these  notifications,  userland programs can cooperate with
> >        the kernel, achieving better system's memory management.
> 
> Well I read through the whole thread and afaict the above is the only
> attempt to describe why this patchset exists!

Thanks for taking a look. :)

> How about we step away from implementation details for a while and
> discuss observed problems, use-cases, requirements and such?  What are
> we actually trying to achieve here?

We try to make userland freeing resources when the system becomes low on
memory. Once we're short on memory, sometimes it's better to discard
(free) data, rather than let the kernel to drain file caches or even start
swapping.

In Android case, the data includes all idling applications' state, some of
which might be saved on the disk anyway -- so we don't need to swap apps,
we just kill them. Another Android use-case is to kill low-priority tasks
(e.g. currently unimportant services -- background/sync daemons, etc.).

There are other use cases: VPS/containers balancing, freeing browser's old
pages renders on desktops, etc. But I'll let folks speak for their use
cases, as I truly know about Android/embedded only.

But in general, it's the same stuff as the in-kernel shrinker, except that
we try to make it available for the userland: the userland knows better
about its memory, so we want to let it help with the memory management.

Thanks,
Anton.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
