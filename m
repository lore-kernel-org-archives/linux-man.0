From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/4] io_setup.2: clarify nr_events
Date: Mon, 22 Apr 2013 10:01:06 -0400
Message-ID: <x497gjuoeal.fsf@segfault.boston.devel.redhat.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com>
	<1365104218-26042-5-git-send-email-jmoyer@redhat.com>
	<20130422133039.GB3975@rei>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130422133039.GB3975@rei> (chrubis-AlSwsSmVLrQ@public.gmane.org's message of "Mon,
	22 Apr 2013 15:30:39 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chrubis-AlSwsSmVLrQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

chrubis-AlSwsSmVLrQ@public.gmane.org writes:

> Hi!
> Looking carefully at the io_setup.2 man page it says:
>
> ...
> The  io_setup() system call creates an asynchronous I/O context capable
> of concurrently processing at least nr_events.
> ...
>                             ^
> 			    The 'at least' caught my eye, as it is it
> 			    may suggest that the nr_events is low limit
> 			    on the number of events.
>
>
> Wouldn't be 'at most' more appropriate here? Quick look in the kernel
> sources suggest that it allocates buffers for nr_events elements.
>
> Or am I missing something?

When the kernel ring buffer is setup, it is created in page size
chunks, and nr_events is rounded up:

        /* Compensate for the ring buffer's head/tail overlap entry */
        nr_events += 2; /* 1 is required, 2 for good luck */

        size = sizeof(struct aio_ring);
        size += sizeof(struct io_event) * nr_events;
        nr_pages = (size + PAGE_SIZE-1) >> PAGE_SHIFT;

        if (nr_pages < 0)
                return -EINVAL;

        nr_events = (PAGE_SIZE * nr_pages - sizeof(struct aio_ring)) / sizeof(struct io_event);

Cheers,
Jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
