From: Mike Crowe <mac-6JwzNyXSCK3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] epoll_wait.2: Clarify that the timeout is measured against CLOCK_MONOTONIC
Date: Thu, 15 Sep 2016 10:17:53 +0100
Message-ID: <1473931073-26587-1-git-send-email-mac@mcrowe.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Crowe <mac-6JwzNyXSCK3QT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The existing page left the choice of clock as ambiguous. My reading of the
kernel implementation is that CLOCK_MONOTONIC is always used since ep_poll
calls schedule_hrtimeout_range, which calls schedule_hrtimeout_range_clock
passing CLOCK_MONOTONIC.

References:
 http://lxr.free-electrons.com/source/fs/eventpoll.c?v=4.7#L1614
 http://lxr.free-electrons.com/source/kernel/time/hrtimer.c?v=4.7#L1785

The "measured against" terminology was borrowed from nanosleep.2.

I've checked all the way back to Linux v2.6.12 where the calculation was
done using jiffies so I think that this has effectively always been true.

Signed-off-by: Mike Crowe <mac-6JwzNyXSCK3QT0dZR+AlfA@public.gmane.org>
---
 man2/epoll_wait.2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/epoll_wait.2 b/man2/epoll_wait.2
index 9637906..48bb281 100644
--- a/man2/epoll_wait.2
+++ b/man2/epoll_wait.2
@@ -55,6 +55,9 @@ The
 argument specifies the number of milliseconds that
 .BR epoll_wait ()
 will block.
+Time is measured against the
+.B CLOCK_MONOTONIC
+clock.
 The call will block until either:
 .IP * 3
 a file descriptor delivers an event;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
