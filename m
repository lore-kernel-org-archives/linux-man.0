From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Tue, 30 Dec 2014 18:05:29 -0500
Message-ID: <20141230230529.GT4574@brightrain.aerifal.cx>
References: <54A2C8A6.9050100@redhat.com>
 <ork318eoj4.fsf@livre.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ork318eoj4.fsf-o1YuAO9g/txBDLzU/O5InQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 30, 2014 at 08:55:11PM -0200, Alexandre Oliva wrote:
> On Dec 30, 2014, "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
> >   Note that reetrant functions need not be AS-safe nor MT-safe.
> 
> How?
> 
> I suppose it might depend on the definition of reentrant, but if you can
> reenter it in multiple threads, and you can reenter it within a thread
> in which it is active (e.g., in a signal handler that may have
> interrupted its own execution), then it definitely is reentrant.
> 
> Conversely, if it is reentrant, then you can safely reenter it in
> multiple threads (MT-Safe) and within signal handlers (AS-Safe), no?
> 
> 
> What definition of reentrant could make a function be reentrant without
> being both MT- and AS-Safe, or be both MT- and AS-Safe without being
> reentrant?
> 
> 
> I suppose there might be scenarios in which a function doesn't qualify
> for AS-Safe because it doesn't support async recursion, but it could
> still be reentered by means of (indirect?) recursion safely.  However, I
> can't see how this could be the case without the function being at least
> MT-Safe.  It looks like any window that could bring trouble for async
> signals would also do so for other threads.  Unless...  Recursive locks?
> Those would avoid trouble for other threads (making the function
> MT-Safe), but not for async signals (so AS-Unsafe), and sync recursion
> could enable reentrancy while avoid pitfalls that async signals would
> bring about and that recursive locks wouldn't aovid.  Is this the case
> you had in mind?  Is it the only one in which a function can be
> Reentrant, MT-Safe and AS-Unsafe?
> 
> Can you think of any that is AS-Safe, MT-Unsafe and Reentrant?

Anything written without memory barriers but that has proper compiler
barriers for AS-safety/reentrancy.

> Can you think of any that is AS-Unsafe, MT-Unsafe and Reentrant?

Anything written without memory or compiler barriers but that uses
global state in a reentrant way.

> Can you think of any that is non-Reentrant but that is MT-Safe or
> AS-Safe?

Non-reentrant but MT-safe: anything with non-recursive locks.

Non-reentrant but AS-safe: anything that achieves AS-safety by
blocking signals for the duration of the operation or any operation
that accesses the same data.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
