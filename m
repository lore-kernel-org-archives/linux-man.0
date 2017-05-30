From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 10:04:01 -0700
Message-ID: <CA+55aFwC_8RWygnZWtgT+COY8mGY_RnDSW_vrD=+1x_NyPxChw@mail.gmail.com>
References: <alpine.DEB.2.20.1705301402270.1950@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1705301402270.1950@nanos>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, May 30, 2017 at 6:21 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
>
> Linus, any recollection?
>
> IMO, it's perfectly reasonable to discard ignored signals even when the
> signal is in the blocked mask. When its unblocked and SIG_IGN is replaced
> then the next signal will be delivered. But hell knows, how much user space
> depends on this weird behaviour by now.

Is there any real reason you care? Because clearly we're doing what
POSIX allows, and I'd be nervous about changing existing behavior.

There are various races wrt signals that happen particularly around
fork/exec, and the way that programs handle those races is to block
signals. I don't know that anybody cares about the exact semantics of
this, but I could *imagine* that they do.

Our current behavior is actually very nice: blocking a signal
basically guarantees that you're now "atomic" wrt that signal. You
won't lose signaling events after the blocking, unless you explicitly
throw them away.

So I would suggest *not* changing the semantics unless you have a
major real reason for wanting to do that.

                     Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
