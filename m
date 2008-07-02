From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: getcpu(2) man page
Date: Wed, 02 Jul 2008 21:57:20 +0200
Message-ID: <486BDDA0.4070306@firstfloor.org>
References: <486BD19B.7040302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <486BD19B.7040302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:

> .\" FIXME(ak) If the following formulation is correct, I think it would
> .\" be better to substitute it instead of the next sentence:
> .\"     The information placed in \fIcpu\fP is only guaranteed to be
> .\"     current at the time of the call: ...

At least sched_setaffinity should be still mentioned.
Feel free to rephrase it if you think it's better in some other way.

> .\" FIXME(ak) In the following, what precisely do you mean by "advisory"?
> .\" It is not really clear to me whether you mean the information
> .\" may not be "true", or whether you are just reiterating the point that
> .\" the CPU/node might already have changed by the time the call returns.

It's reiterating the point, but in general the caller has to consider
it advisory as a hint only because it cannot rely on it 100% (unless it set the affinity)

> .\" FIXME(ak) what does the phrase "but might query the current state
> .\" only during a short implementation specific interval" mean?
> it will be faster, but might query the current state only during
> a short implementation specific interval.

Originally the cache had a time stamp and then would only get the CPU
information once each jiffie. That works well because the CPU affinity
is typically hold long enough.

Unfortunately someone who didn't understand the design and didn't think
it through took that out  so currently applications have to reimplement that
mechanism in a usually inferior and slower way (querying timers is much slower in
general user space) or do "endless caches" which are also bad


-Andi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
