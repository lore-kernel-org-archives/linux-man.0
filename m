From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] perf_event_open.2: pfix
Date: Sun, 17 Nov 2013 12:16:16 -0400
Message-ID: <1384704976-3877-3-git-send-email-taffit@debian.org>
References: <1384704976-3877-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384704976-3877-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/perf_event_open.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 9d37b44..d2237e2 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2374,7 +2374,7 @@ ioctl argument was broken and would repeatedly operate
 on the event specified rather than iterating across
 all sibling events in a group.
 
-From Linux 3.4 to Linux 3.11 the mmap
+From Linux 3.4 to Linux 3.11, the mmap
 .I cap_usr_rdpmc
 and
 .I cap_usr_time
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
