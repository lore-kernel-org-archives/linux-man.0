From: Zhang Xiliang <zhangxiliang-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] Add the pthread_rwlock_unlock() different point explanation
 between Linux and POSIX
Date: Mon, 20 Jul 2009 09:52:57 +0800
Message-ID: <4A63CDF9.6040603@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk-manpages-hi6Y0CQ0nG0@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I tested the unlock order of rwlock in Linux with SCHED_FIFO and SCHED_RR, and found 
that when readers blocked has higher priority than writers, writers always shall 
take precedence over readers.

A write process                         <--unlock the rwlock
  ->A higher priority read process      <--block
  ->A lower priority write process      <--acquired rwlock

In pthread_rwlock_rdlock() manual, it says: If the Thread Execution Scheduling option is
supported, when threads executing with the scheduling policies SCHED_FIFO, SCHED_RR, or 
SCHED_SPORADIC are waiting on the lock, they shall acquire the lock in priority order
when the lock becomes available.

Signed-off-by: Zhang Xiliang <zhangxiliang-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3p/pthread_rwlock_unlock.3p |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/man3p/pthread_rwlock_unlock.3p b/man3p/pthread_rwlock_unlock.3p
index 3e726d0..4508536 100644
--- a/man3p/pthread_rwlock_unlock.3p
+++ b/man3p/pthread_rwlock_unlock.3p
@@ -49,6 +49,11 @@ locks.
 .LP
 Results are undefined if any of these functions are called with an
 uninitialized read-write lock.
+.SH DIFFERENCE BETWEEN LINUX and POSIX
+.LP
+In Linux, when threads executing with the scheduling policies SCHED_FIFO, 
+SCHED_RR are waiting on the block, write locks always shall take precedence 
+over read lockswhich have higher priority.
 .SH RETURN VALUE
 .LP
 If successful, the \fIpthread_rwlock_unlock\fP() function shall return

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
