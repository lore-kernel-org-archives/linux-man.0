From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] perf_event_open.2: tfix
Date: Mon, 28 Oct 2013 20:39:57 -0400
Message-ID: <1383007197-1518-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/perf_event_open.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index f4cb5bd..9fc774c 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1289,7 +1289,7 @@ When the mapping is
 the
 .I data_tail
 value should be written by user space to reflect the last read data.
-In this case the kernel will not over-write unread data.
+In this case the kernel will not overwrite unread data.
 .PP
 The following 2^n ring-buffer pages have the layout described below.
 
@@ -2133,7 +2133,7 @@ When
 .B E2BIG
 is returned, the perf_event_attr
 .I size 
-field is over-written by the kernel to be the size of the structure
+field is overwritten by the kernel to be the size of the structure
 it was expecting.
 .TP
 .B EINVAL
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
