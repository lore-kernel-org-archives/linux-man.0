From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] Document struct sigevent in sigevent(7)
Date: Wed, 24 Feb 2010 21:15:48 +0100
Message-ID: <20100224201548.GA19115@machine.or.cz>
References: <20090415111442.GN8940@machine.or.cz>
 <20090920150500.GO3674@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090920150500.GO3674-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Sep 20, 2009 at 05:05:00PM +0200, Petr Baudis wrote:
> On Wed, Apr 15, 2009 at 01:14:42PM +0200, Petr Baudis wrote:
> > The sigevent structure is used as a common interface for several
> > asynchronous pthreads functions; also, getaddrinfo_a() uses it
> > and in the future, other library functions might.
> > 
> > Currently, it is completely non-descript in some cases, plus
> > there are two competing descriptions in timer_create(2) and
> > mq_notify(3) (the former appears to be based on the latter).
> > This patch attempts to unify the descriptions in a single
> > manual page and networks it to the rest, so that I do not
> > have to add yet another description for the getaddrinfo_a(3)
> > manual page (currently in the works).
> > 
> > P.S.: There are two unresolved issues with this patch - the
> > timer_create(2) requirement of real-time signal requirements
> > is somewhat confusing and it seems that SIGEV_THREAD_ID can
> > be or'd with SIGEV_SIGNAL or not. I did not have time to research
> > this so far, so I decided to rather send it in and see if someone
> > knows about this off the top of their head.
> > 
> > Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
> 
> Ping...

Ping... :-)

P.S.: I'm sorry that I have not been of any help with maintaining
manpages contrary to what I promised - it turns out I'm currently way
too swamped by other stuff.. :-(

-- 
				Petr "Pasky" Baudis
A great many people think they are thinking when they are merely
rearranging their prejudices. -- William James
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
