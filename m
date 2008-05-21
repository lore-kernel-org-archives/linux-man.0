From: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Subject: Re: epoll(7) redux
Date: Wed, 21 May 2008 12:01:06 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0805211200490.7822@alien.or.mcafeemobile.com>
References: <cone.1207739243.602382.23947.500@commodore.email-scan.com>
 <cfd18e0f0804090415m1ddb36bahce8e6b724e60da7d@mail.gmail.com>
 <Pine.LNX.4.64.0804091209270.7000@alien.or.mcafeemobile.com>
 <cone.1207780987.222099.27997.500@commodore.email-scan.com> <483461AE.9080305@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <483461AE.9080305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 21 May 2008, Michael Kerrisk wrote:

> 
> 
> Sam Varshavchik wrote:
> > Davide Libenzi writes:
> > 
> >> On Wed, 9 Apr 2008, Michael Kerrisk wrote:
> >>
> >>> On Wed, Apr 9, 2008 at 1:07 PM, Sam Varshavchik
> >>> <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
> >>> > Q2
> >>> >
> >>> >   Can two epoll sets wait for the same file descriptor? If so, are
> >>> events
> >>> > reported to both epoll file descriptors?
> >>> >
> >>> > A2
> >>> >
> >>> >   Yes, and events would be reported to both. However, it is not
> >>> recommended.
> >>> >
> >>> > =========
> >>> >
> >>> > It's not clear what "not recommended" means. Furthermore, I don't
> >>> think
> >>> > there's anything wrong with two epoll file descriptors waiting for
> >>> different
> >>> > events on the same file descriptor. One's waiting for POLLIN, the
> >>> other for
> >>> > POLLOUT. What's wrong with that?
> >>>
> >>> Perhaps Davide has some thought to offer here?
> >>
> >> You can do it. No problem as far as epoll goes. The "recommended" bit
> >> was more because it is very easy to get things wrong from an
> >> application perspective POV, when doing that.
> >> In the case above, first POLLOUT is "almost" always signaled, so
> >> you'll receive continuous events over there. Second, if both events
> >> shows up at the same time (say in two different threads) and you do
> >> not take care of it, you'll end up handling the same fd, at the same
> >> time, in two different threads.
> > 
> > That's what I had in mind. One thread has the fd in its epoll fd for
> > POLLIN, and handles the read aspect of it. Another thread puts the fd
> > into a different epoll fd, for POLLOUT, and handles the writing aspect
> > of it. It shouldn't be too difficult for both threads to correctly
> > implement their corresponding semantics.
> 
> 
> So how about I change:
> 
> A2. Yes, and events would be reported to both. However, it is
> not recommended.
> 
> to:
> 
> Yes, and events would be reported to both. However, careful programming
> may be needed to do this correctly.
> 
> ?

Looks OK to me.



- Davide


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
