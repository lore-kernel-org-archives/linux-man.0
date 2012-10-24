From: Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/2] vmevent: Implement pressure attribute
Date: Wed, 24 Oct 2012 12:03:10 +0300 (EEST)
Message-ID: <alpine.LFD.2.02.1210241159590.13035@tux.localdomain>
References: <20121022111928.GA12396@lizard> <20121022112149.GA29325@lizard>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121022112149.GA29325@lizard>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 22 Oct 2012, Anton Vorontsov wrote:
> This patch introduces VMEVENT_ATTR_PRESSURE, the attribute reports Linux
> virtual memory management pressure. There are three discrete levels:
> 
> VMEVENT_PRESSURE_LOW: Notifies that the system is reclaiming memory for
> new allocations. Monitoring reclaiming activity might be useful for
> maintaining overall system's cache level.
> 
> VMEVENT_PRESSURE_MED: The system is experiencing medium memory pressure,
> there is some mild swapping activity. Upon this event applications may
> decide to free any resources that can be easily reconstructed or re-read
> from a disk.

Nit:

s/VMEVENT_PRESSURE_MED/VMEVENT_PRESSUDE_MEDIUM/

Other than that, I'm OK with this. Mel and others, what are your thoughts 
on this?

Anton, have you tested this with real world scenarios? How does it stack 
up against Android's low memory killer, for example?

			Pekka
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
