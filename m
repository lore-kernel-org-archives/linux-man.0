From: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Wed, 7 Nov 2012 04:28:13 -0800
Message-ID: <20121107122813.GA4968@lizard>
References: <20121107105348.GA25549@lizard>
 <20121107112136.GA31715@shutemov.name>
 <20121107114346.GA32565@lizard>
 <20121107121110.GA32402@shutemov.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121107121110.GA32402-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Cc: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Glauber Costa <glommer-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Nov 07, 2012 at 02:11:10PM +0200, Kirill A. Shutemov wrote:
[...]
> >    We can have plenty of "free" memory, of which say 90% will be caches,
> >    and say 10% idle. But we do want to differentiate these types of memory
> >    (although not going into details about it), i.e. we want to get
> >    notified when kernel is reclaiming. And we also want to know when the
> >    memory comes from swapping others' pages out (well, actually we don't
> >    call it swap, it's "new allocations cost becomes high" -- it might be a
> >    result of many factors (swapping, fragmentation, etc.) -- and userland
> >    might analyze the situation when this happens).
> > 
> >    Exposing all the VM details to userland is not an option
> 
> IIUC, you want MemFree + Buffers + Cached + SwapCached, right?
> It's already exposed to userspace.

How? If you mean vmstat, then no, that interface is not efficient at all:
we have to poll it from userland, which is no go for embedded (although,
as a workaround it can be done via deferrable timers in userland, which I
posted a few months ago).

But even with polling vmstat via deferrable timers, it leaves us with the
ugly timers-based approach (and no way to catch the pre-OOM conditions).
With vmpressure_fd() we have the synchronous notifications right from the
core (upon which, you can, if you want to, analyze the vmstat).

>> 2. The last time I checked, cgroups memory controller did not (and I guess
>>    still does not) not account kernel-owned slabs. I asked several times
>>    why so, but nobody answered.
>
> Almost there. Glauber works on it.

It's good to hear, but still, the number of "used KBs" is a bad (or
irrelevant) metric for the pressure. We'd still need to analyze the memory
in more details, and "'limit - used' KBs" doesn't tell us anything about
the cost of the available memory.

Thanks,
Anton.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
