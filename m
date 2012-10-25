From: Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 0/2] vmevent: A bit reworked pressure attribute + docs +
 man page
Date: Thu, 25 Oct 2012 17:53:09 +0900
Message-ID: <20121025085309.GC15767@bbox>
References: <20121022111928.GA12396@lizard>
 <20121025064009.GA15767@bbox>
 <CAOJsxLGsjTe13WjY_Q=BLBELwQXOjuwo7PiEKwONHUfR4mQmig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOJsxLGsjTe13WjY_Q=BLBELwQXOjuwo7PiEKwONHUfR4mQmig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Pekka,

On Thu, Oct 25, 2012 at 09:44:52AM +0300, Pekka Enberg wrote:
> On Thu, Oct 25, 2012 at 9:40 AM, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > Your description doesn't include why we need new vmevent_fd(2).
> > Of course, it's very flexible and potential to add new VM knob easily but
> > the thing we is about to use now is only VMEVENT_ATTR_PRESSURE.
> > Is there any other use cases for swap or free? or potential user?
> > Adding vmevent_fd without them is rather overkill.
> 
> What ABI would you use instead?

I thought /dev/some_knob like mem_notify and epoll is enough but please keep in mind
that I'm not against vmevent_fd strongly. My point is that description should include
explain about why other candidate is not good or why vmevent_fd is better.
(But at least, I don't like vmevent timer polling still and I hope we use it
as last resort once we can find another)

> 
> On Thu, Oct 25, 2012 at 9:40 AM, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > I don't object but we need rationale for adding new system call which should
> > be maintained forever once we add it.
> 
> Agreed.
> 
> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo-Bw31MaZKKs0EbZ0PF+XxCw@public.gmane.org  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=mailto:"dont-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org"> email-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org </a>

-- 
Kind regards,
Minchan Kim
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
