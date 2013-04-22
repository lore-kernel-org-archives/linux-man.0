From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH 4/4] io_setup.2: clarify nr_events
Date: Mon, 22 Apr 2013 16:21:33 +0200
Message-ID: <20130422142132.GB4845@rei>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com>
 <1365104218-26042-5-git-send-email-jmoyer@redhat.com>
 <20130422133039.GB3975@rei>
 <x497gjuoeal.fsf@segfault.boston.devel.redhat.com>
 <20130422140703.GA4845@rei>
 <x4938uiodvg.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <x4938uiodvg.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
> >> When the kernel ring buffer is setup, it is created in page size
> >> chunks, and nr_events is rounded up:
> >> 
> >>         /* Compensate for the ring buffer's head/tail overlap entry */
> >>         nr_events += 2; /* 1 is required, 2 for good luck */
> >> 
> >>         size = sizeof(struct aio_ring);
> >>         size += sizeof(struct io_event) * nr_events;
> >>         nr_pages = (size + PAGE_SIZE-1) >> PAGE_SHIFT;
> >> 
> >>         if (nr_pages < 0)
> >>                 return -EINVAL;
> >> 
> >>         nr_events = (PAGE_SIZE * nr_pages - sizeof(struct aio_ring)) / sizeof(struct io_event);
> >
> > Ah, now it all makes sense.
> >
> > And I'm thinking if it is worth of adding more clear description.
> 
> I don't think so, since it's an implementation detail and subject to
> change.

That is for sure, but I would like to advice the user of the interface
that nr_events is the maximum that could be expected to portably work.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
