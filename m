From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Tue, 30 Dec 2014 20:55:11 -0200
Message-ID: <ork318eoj4.fsf@livre.home>
References: <54A2C8A6.9050100@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A2C8A6.9050100-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Carlos O'Donell's message of "Tue,
	30 Dec 2014 10:45:42 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Dec 30, 2014, "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

>   Note that reetrant functions need not be AS-safe nor MT-safe.

How?

I suppose it might depend on the definition of reentrant, but if you can
reenter it in multiple threads, and you can reenter it within a thread
in which it is active (e.g., in a signal handler that may have
interrupted its own execution), then it definitely is reentrant.

Conversely, if it is reentrant, then you can safely reenter it in
multiple threads (MT-Safe) and within signal handlers (AS-Safe), no?


What definition of reentrant could make a function be reentrant without
being both MT- and AS-Safe, or be both MT- and AS-Safe without being
reentrant?


I suppose there might be scenarios in which a function doesn't qualify
for AS-Safe because it doesn't support async recursion, but it could
still be reentered by means of (indirect?) recursion safely.  However, I
can't see how this could be the case without the function being at least
MT-Safe.  It looks like any window that could bring trouble for async
signals would also do so for other threads.  Unless...  Recursive locks?
Those would avoid trouble for other threads (making the function
MT-Safe), but not for async signals (so AS-Unsafe), and sync recursion
could enable reentrancy while avoid pitfalls that async signals would
bring about and that recursive locks wouldn't aovid.  Is this the case
you had in mind?  Is it the only one in which a function can be
Reentrant, MT-Safe and AS-Unsafe?

Can you think of any that is AS-Safe, MT-Unsafe and Reentrant?

Can you think of any that is AS-Unsafe, MT-Unsafe and Reentrant?

Can you think of any that is non-Reentrant but that is MT-Safe or
AS-Safe?

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
