From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH 4/4] io_setup.2: clarify nr_events
Date: Mon, 22 Apr 2013 15:30:39 +0200
Message-ID: <20130422133039.GB3975@rei>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com>
 <1365104218-26042-5-git-send-email-jmoyer@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1365104218-26042-5-git-send-email-jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
Looking carefully at the io_setup.2 man page it says:

...
The  io_setup() system call creates an asynchronous I/O context capable
of concurrently processing at least nr_events.
...
                            ^
			    The 'at least' caught my eye, as it is it
			    may suggest that the nr_events is low limit
			    on the number of events.


Wouldn't be 'at most' more appropriate here? Quick look in the kernel
sources suggest that it allocates buffers for nr_events elements.

Or am I missing something?

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
