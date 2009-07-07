From: Zhang Xiliang <zhangxiliang-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] Add the pthread_rwlock_rdlock() different point explanation
 between Linux and POSIX
Date: Tue, 07 Jul 2009 17:04:27 +0800
Message-ID: <4A530F9B.8010508@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk-manpages-hi6Y0CQ0nG0@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I tested the scheduler of rwlock in Linux, and found that when write lock is blocked
(a read process has acquired read lock), the other read process can acquire
read lock again.

A read process                       <--acquired read lock
  ->A write process                  <--block for the reading process unlock
    ->The other read process         <--it acquired read lock again
      ->The write process            <--block for the two reading process unlock

In pthread_rwlock_rdlock() manual, the other read process should be blocked when 
a write process blocked. Write locks shall take precedence over read locks by
default.

The diffrent point between Linux and POSIX should be listed in linux-glibc man page.

Signed-off-by: Zhang Xiliang <zhangxiliang-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3p/pthread_rwlock_rdlock.3p |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/man3p/pthread_rwlock_rdlock.3p b/man3p/pthread_rwlock_rdlock.3p
index b63adbf..6e471d8 100644
--- a/man3p/pthread_rwlock_rdlock.3p
+++ b/man3p/pthread_rwlock_rdlock.3p
@@ -77,6 +77,12 @@ If a signal is delivered to a thread waiting for a read-write lock
 for reading, upon return from the signal handler the thread
 resumes waiting for the read-write lock for reading as if it was not
 interrupted.
+.SH DIFFERENCE BETWEEN LINUX and POSIX
+.LP
+In linux, when the threads involved in the lock are executing with 
+the scheduling policies SCHED_FIFO or SCHED_RR, if a reader holds the 
+lock and writers of higher or equal priority are blocked on the lock, 
+the other readers also hold the lock by default.
 .SH RETURN VALUE
 .LP
 If successful, the \fIpthread_rwlock_rdlock\fP() function shall return


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
