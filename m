From: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Wed, 7 Nov 2012 04:06:26 -0800
Message-ID: <20121107120626.GB32565@lizard>
References: <20121107105348.GA25549@lizard>
 <CAOJsxLFz+Zi=A0uyuNMj411ngjwpstakNY3fEWy6tW_h4whr7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOJsxLFz+Zi=A0uyuNMj411ngjwpstakNY3fEWy6tW_h4whr7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Nov 07, 2012 at 01:30:16PM +0200, Pekka Enberg wrote: [...]
> I love the API and implementation simplifications but I hate the new
> ABI. It's a specialized, single-purpose syscall and bunch of procfs
> tunables and I don't see how it's 'extensible' to anything but VM

It is extensible to VM pressure notifications, yeah. We're probably not
going to add the raw vmstat values to it (and that's why we changed the
name). But having three levels is not the best thing we can do -- we can
do better. As I described here:

	http://lkml.org/lkml/2012/10/25/115

That is, later we might want to tell the kernel how much reclaimable
memory userland has. So this can be two-way communication, which to me
sounds pretty cool. :) And who knows what we'll do after that.

But these are just plans. We might end up not having this, but we always
have an option to have it one day.

> If people object to vmevent_fd() system call, we should consider using
> something more generic like perf_event_open() instead of inventing our
> own special purpose ABI.

Ugh. While I *love* perf, but, IIUC, it was designed for other things:
handling tons of events, so it has many stuff that are completely
unnecessary here: we don't need ring buffers, formats, 7+k LOC, etc. Folks
will complain that we need the whole perf stuff for such a simple thing
(just like cgroups).

Also note that for pre-OOM we have to be really fast, i.e. use shortest
possible path (and, btw, that's why in this version the read() now can be
blocking -- and so we no longer have to do two poll()+read() syscalls,
just single read is now possible).

So I really don't see the need for perf here: it doesn't result in any
code reuse, but instead it just complicates our task. As for ABI
maintenance point of view, it is just the same thing as the dedicated
syscall.

Thanks,
Anton.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
