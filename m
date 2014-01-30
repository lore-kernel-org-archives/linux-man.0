From: "Network Nut" <sillystack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: RE: FW: WaitForMultipleObjects/etc. In Kernel
Date: Thu, 30 Jan 2014 14:04:30 -0600
Message-ID: <007c01cf1df6$7ccbe010$7663a030$@gmail.com>
References: <00d901cf1a19$0ea62db0$2bf28910$@gmail.com> <52E554EC.3090900@ladisch.de> <012d01cf1ae3$6543e340$2fcba9c0$@gmail.com> <52E6219A.3020405@ladisch.de> <00f001cf1ba5$b22f45b0$168dd110$@gmail.com> <52E8DA80.7080204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52E8DA80.7080204-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-us
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "'Michael Kerrisk (man-pages)'" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> -----Original Message-----
> From: Michael Kerrisk (man-pages) [mailto:mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Wednesday, January 29, 2014 4:40 AM
> To: Network Nut
> Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: FW: WaitForMultipleObjects/etc. In Kernel
> 
> On 01/27/2014 10:21 PM, Network Nut wrote:
> > See below.
> >
> > -----Original Message-----
> > From: Clemens Ladisch [mailto:clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org]
> > Sent: Monday, January 27, 2014 3:07 AM
> > To: Network Nut
> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: WaitForMultipleObjects/etc. In Kernel
> >
> >> BTW, the man page for epoll_wait seems to be incorrect.
> >
> > <https://www.kernel.org/doc/man-pages/reporting_bugs.html>
> >
> >> "The timeout argument specifies the minimum number of milliseconds
> >>        that epoll_wait() will block."
> >>
> >> I think the word "minimum" should be "maximum".
> 
> I've removed the word "minimum" from the sentence. Note that
> "maximum" would not be correct. See the surrounding text for an
> explanation of why.
> 
> Thanks for the report.
> 
> Cheers,
> 
> Michael

Hi Michael,

I re-read the sentence with the word "minimum" being removed. It makes sense
now, at least for those of us who already understand how it should work
[WaitForMultipleObjects]. But I wonder....Imagine a programmer who is
relatively new to synchronization, just discovering the power of waiting for
multiple fd's. Reading that statement, s/he might be inclined to believe
that the function really will wait, say, 1000 milliseconds, without regard
for signaling state of any of the fd's that might transition during the call
to epoll_wait. The reason would be that s/he has no reason to believe
otherwise, as that is what the man page says. By contrast, those of us who
already know the nature of this function would not be confused because we
would think, "Ok, I know that epoll_wait will not actually wait 1000 ms in
all cases, but ..." 

Not trying to teach the teacher here. :) Just saying'. [Yes, it's a
nit-pick.]

Since we are on the subject, I also believe that the man page for epoll_wait
should state whether sequence of the signaled fd's is guaranteed to be
correlated to the order in which they were specified. As you know, there are
many situations where programmer might want to wait on, say, eventfd that
says that thread should exit, plus four other semaphores, etc. If the four
other semaphores guard queues that are, in general, never empty, then on
each loop, the semaphores will be triggered. If then, on one of the loops,
the eventfd for "exit" is triggered, there is no guarantee, according to the
man page, that the "exit" eventfd will be returned in the triggered-set. It
would seem natural that, if the "exit" eventfd is added to the first
position with epoll_ctl, then of any trigger-set where "exit" eventfd is
set, that "exit" eventfd ~must~ be included as a matter of explicit
prioritization. Guaranteeing a correlation between specified order in
epoll_ctrl and yielded order in epoll_wait would allow the programmer to
specify maxevents=1 to epoll_wait, at which point, the "exit" eventfd, if
triggered, would preempt any of the semaphores.

Or...maybe I am missing something else?

-Nut

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
