From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] epoll_wait.2: Clarify that the timeout is measured
 against CLOCK_MONOTONIC
Date: Tue, 20 Sep 2016 14:33:45 +0200
Message-ID: <5e86d5bf-0520-4dec-dac6-599ba600b67a@gmail.com>
References: <1473931073-26587-1-git-send-email-mac@mcrowe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473931073-26587-1-git-send-email-mac-6JwzNyXSCK3QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Crowe <mac-6JwzNyXSCK3QT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/15/2016 11:17 AM, Mike Crowe wrote:
> The existing page left the choice of clock as ambiguous. My reading of the
> kernel implementation is that CLOCK_MONOTONIC is always used since ep_poll
> calls schedule_hrtimeout_range, which calls schedule_hrtimeout_range_clock
> passing CLOCK_MONOTONIC.
> 
> References:
>  http://lxr.free-electrons.com/source/fs/eventpoll.c?v=4.7#L1614
>  http://lxr.free-electrons.com/source/kernel/time/hrtimer.c?v=4.7#L1785
> 
> The "measured against" terminology was borrowed from nanosleep.2.
> 
> I've checked all the way back to Linux v2.6.12 where the calculation was
> done using jiffies so I think that this has effectively always been true.

Thanks, Mike. I've applied this patch.

Cheers,

Michael

> Signed-off-by: Mike Crowe <mac-6JwzNyXSCK3QT0dZR+AlfA@public.gmane.org>
> ---
>  man2/epoll_wait.2 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/man2/epoll_wait.2 b/man2/epoll_wait.2
> index 9637906..48bb281 100644
> --- a/man2/epoll_wait.2
> +++ b/man2/epoll_wait.2
> @@ -55,6 +55,9 @@ The
>  argument specifies the number of milliseconds that
>  .BR epoll_wait ()
>  will block.
> +Time is measured against the
> +.B CLOCK_MONOTONIC
> +clock.
>  The call will block until either:
>  .IP * 3
>  a file descriptor delivers an event;
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
