From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH 3/3] getrusage.2: Bump revision
Date: Thu, 27 May 2010 12:49:35 +0100 (BST)
Message-ID: <alpine.NEB.2.01.1005271220220.21247@jrf.vwaro.pbz>
References: <1272228153-11825-1-git-send-email-mark@pogo.org.uk>  <1272228153-11825-4-git-send-email-mark@pogo.org.uk> <AANLkTikYUdg2o9JAH8NOK0Wjk6aWQlr-x2k4-Ts_XF3Z@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikYUdg2o9JAH8NOK0Wjk6aWQlr-x2k4-Ts_XF3Z-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 24 May 2010, Michael Kerrisk wrote:

> Your patches prompted me to add various other pieces to the man page. 
> Your comments welcome, if you have a chance to review.

Sure, no problem.

The extra detail to the descriptions is good, but I have some comments on 
the unmaintained ones:

> .IR ru_ixrss " (unmaintained)"
> On some systems, this is the integral of the text segment memory consumption,
> expressed in kilobyte-seconds.
> .TP
> .IR ru_idrss " (unmaintained)"
> On some systems, this is the integral of the data segment memory consumption,
> expressed in kilobyte-seconds.
> .TP
> .IR ru_isrss " (unmaintained)"
> On some systems, this is the integral of the stack memory consumption,
> expressed in kilobyte-seconds.
> .TP
[...]
> .IR ru_nswap  " (unmaintained)"
> On some systems, this is the number of swaps out of physical memory.
> .TP
[...]
> .IR ru_msgsnd " (unmaintained)"
> .\" On FreeBSD 6.2, this appears to measure messages sent on sockets
> On some systems,
> this field records the number of messages sent over sockets.
> .TP
> .IR ru_msgrcv " (unmaintained)"
> .\" On FreeBSD 6.2, this appears to measure messages received on sockets
> On some systems,
> this field records the number of messages received over sockets.
> .TP
> .IR ru_nsignals " (unmaintained)"
> On some systems, this field records the numner of signals received.
> .TP

In my changes I decided specifically to leave out the unmaintained fields. 
My reasoning was an assumption that the man page is to document the Linux 
getrusage() call. If something is unimplemented on Linux then a 
explanation of what it does or "appears to" do on another platform is not 
relevant, and will easily be misleading or out of date; that information 
can easily and definitively be found in documentation for the other 
platforms.

Including them has opened a can of worms already: what is the difference 
between messages "sent on" sockets, or "sent over" sockets?

There's a typo: "numner".

Thanks for applying the patches.

-- 
Mark
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
