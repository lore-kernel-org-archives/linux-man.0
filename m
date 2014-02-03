From: "Network Nut" <sillystack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: epoll_wait() - Honor Order of Specification of fds to epoll_ctl()
Date: Sun, 2 Feb 2014 22:52:52 -0600
Message-ID: <000301cf209b$cbf95ad0$63ec1070$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-us
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "'Michael Kerrisk (man-pages)'" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> -----Original Message-----
> From: Michael Kerrisk (man-pages) [mailto:mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> 
> > Since we are on the subject, I also believe that the man page for
epoll_wait
> > should state whether sequence of the signaled fd's is guaranteed to be
> > correlated to the order in which they were specified.
> 
> There is not such a guarantee, as far as I know.
> 
> > As you know, there are
> > many situations where programmer might want to wait on, say, eventfd
> that
> > says that thread should exit, plus four other semaphores, etc. If the
four
> > other semaphores guard queues that are, in general, never empty, then on
> > each loop, the semaphores will be triggered. If then, on one of the
loops,
> > the eventfd for "exit" is triggered, there is no guarantee, according to
the
> > man page, that the "exit" eventfd will be returned in the triggered-set.
It
> > would seem natural that, if the "exit" eventfd is added to the first
> > position with epoll_ctl, then of any trigger-set where "exit" eventfd is
> > set, that "exit" eventfd ~must~ be included as a matter of explicit
> > prioritization. Guaranteeing a correlation between specified order in
> > epoll_ctrl and yielded order in epoll_wait would allow the programmer to
> > specify maxevents=1 to epoll_wait, at which point, the "exit" eventfd,
if
> > triggered, would preempt any of the semaphores.
> >
> > Or...maybe I am missing something else?
> 
> The only guarantee that I know of is that if multiple FDs a ready and
> epoll_wait() requests fewer events than there are FDs ready, then
> successive calls will cycle though the list of ready FDs. This helps avoid
> starvation.

I am starting a new thread since my last question was answered sufficiently
to get my work done.

I believe that epoll_wait should guarantee that it will yield the triggered
fd's in the order in which they were specified to epoll_ctl. 

Just yesterday, I had a situation where I needed this guarantee. I had four
queues that are annotated with semaphores. I intended to use epoll_wait to
wait on the semaphores, in addition to several other fd's. When my thread
unblocks, I need two of the semaphores to take priority over the other two.
Normally, I would specify those two fd's first in my array to epoll_ctl.

As is known, WaitForMultipleObjects, under Windows, yields  only 1 fd per
invocation, and that fd is the first fd in the array that was specified to
WaitForMultipleObjects that has become triggered. This gives the programmer
a convenient to specifying arbitration (prioritizations) among
simultaneously triggered fd's. 

With epoll_wait, if say, 4 fd's are triggered, without a guarantee to honor
order-of-specification, the programmer would effectively have to sort the
triggered fd's in the order that makes sense for his/her application to
determine if one or more "critical" fd's have been triggered.

-Nut


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
