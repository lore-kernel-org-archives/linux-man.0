From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/2] futex.2: tfix
Date: Mon,  4 Jan 2016 16:59:35 +0100
Message-ID: <1451923175-4316-2-git-send-email-jwilk@jwilk.net>
References: <1451923175-4316-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451923175-4316-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

diff --git a/man2/futex.2 b/man2/futex.2
index 8c6c023..7cf0d0b 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -516,7 +516,7 @@ unlock(A);
 If a waker thread used
 .BR FUTEX_WAKE ,
 then all waiters waiting on B would be woken up,
-and they would would all try to acquire lock A.
+and they would all try to acquire lock A.
 However, waking all of the threads in this manner would be pointless because
 all except one of the threads would immediately block on lock A again.
 By contrast, a requeue operation wakes just one waiter and moves
-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
