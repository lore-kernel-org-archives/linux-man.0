From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] perf_event_open.2: ffix
Date: Mon, 22 Jul 2013 15:01:18 -0400
Message-ID: <1374519679-1390-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/perf_event_open.2 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 60de993..b1a7114 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1618,8 +1618,7 @@ or else the maximum record size.
 is the stack data.
 .I dyn_size
 is the amount of data actually dumped (can be less than
-.I size
-).
+.IR size ).
 .TP
 .I weight
 If
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
