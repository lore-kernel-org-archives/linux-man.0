From: Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org>
Subject: Re: epoll_wait() - Honor Order of Specification of fds to epoll_ctl()
Date: Mon, 3 Feb 2014 06:51:24 +0000
Message-ID: <20140203065124.GC2112@dcvr.yhbt.net>
References: <000301cf209b$cbf95ad0$63ec1070$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <000301cf209b$cbf95ad0$63ec1070$@gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Network Nut <sillystack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "'Michael Kerrisk (man-pages)'" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Network Nut <sillystack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I believe that epoll_wait should guarantee that it will yield the triggered
> fd's in the order in which they were specified to epoll_ctl. 

That would require reworking/redesigning the internal data structures of
epoll to preserve order.  It would very likely penalize the performance
for existing users who do not care about ordering (outside of order in
which events fire).

> Just yesterday, I had a situation where I needed this guarantee. I had four
> queues that are annotated with semaphores. I intended to use epoll_wait to
> wait on the semaphores, in addition to several other fd's. When my thread
> unblocks, I need two of the semaphores to take priority over the other two.
> Normally, I would specify those two fd's first in my array to epoll_ctl.

Use poll on the high prio FD(s) and epoll_fd instead, then only use
epoll_wait with a timeout of zero seconds.  Something like this
(in pseudocode, my C brain isn't working well)

	pollset = { high_prio_fd => POLLIN, epoll_fd => POLLIN }
	poll(pollset, pollset.size, timeout=-1)
	if pollset.include?(high_prio_fd)
		<< high priority stuff >>
	elsif pollset.include?(epoll_fd)
		epoll_wait(epoll_fd, ..., timeout=0)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
