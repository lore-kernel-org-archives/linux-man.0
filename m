From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] perf_event_open.2: cfix
Date: Mon, 22 Jul 2013 15:01:19 -0400
Message-ID: <1374519679-1390-2-git-send-email-taffit@debian.org>
References: <1374519679-1390-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374519679-1390-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/perf_event_open.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index b1a7114..ef89b05 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1673,7 +1673,7 @@ memory hierarchy level hit or miss, a bitwise combination of
 .B PERF_MEM_LVL_REM_CCE1
 (remote cache 1 hop),
 .B PERF_MEM_LVL_REM_CCE2
-(remote Cache 2 hops),
+(remote cache 2 hops),
 .B PERF_MEM_LVL_IO
 (I/O memory), and
 .B PERF_MEM_LVL_UNC
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
