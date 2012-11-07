From: Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Wed, 7 Nov 2012 13:30:16 +0200
Message-ID: <CAOJsxLFz+Zi=A0uyuNMj411ngjwpstakNY3fEWy6tW_h4whr7w@mail.gmail.com>
References: <20121107105348.GA25549@lizard>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121107105348.GA25549@lizard>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Anton,

On Wed, Nov 7, 2012 at 12:53 PM, Anton Vorontsov
<anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This is the third RFC. As suggested by Minchan Kim, the API is much
> simplified now (comparing to vmevent_fd):
>
> - As well as Minchan, KOSAKI Motohiro didn't like the timers, so the
>   timers are gone now;
> - Pekka Enberg didn't like the complex attributes matching code, and
>   so it is no longer there;
> - Nobody liked the raw vmstat attributes, and so they were eliminated
>   too.

I love the API and implementation simplifications but I hate the new
ABI. It's a specialized, single-purpose syscall and bunch of procfs
tunables and I don't see how it's 'extensible' to anything but VM

If people object to vmevent_fd() system call, we should consider using
something more generic like perf_event_open() instead of inventing our
own special purpose ABI.

                        Pekka
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
