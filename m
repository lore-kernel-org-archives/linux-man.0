From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] perf_event_open.2: cfix
Date: Sat,  1 Feb 2014 16:24:49 -0400
Message-ID: <1391286290-24188-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/perf_event_open.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index eaeb9c0..3f40fad 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2052,7 +2052,7 @@ Synchronous abort (related to the reported instruction).
 Asynchronous abort (not related to the reported instruction).
 .TP
 .B PERF_TXN_RETRY
-retryable abort (retrying the transaction may have succeeded).
+Retryable abort (retrying the transaction may have succeeded).
 .TP
 .B PERF_TXN_CONFLICT
 Abort due to memory conflicts with other threads.
-- 
1.9.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
