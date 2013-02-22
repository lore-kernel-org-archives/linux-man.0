From: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] capabilities.7: add a note about /proc/PID/status
Date: Fri, 22 Feb 2013 15:24:25 +0400
Message-ID: <1361532265-5962-1-git-send-email-avagin@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since kernel 3.6.8, all non-existent capabilities (above CAP_LAST_CAP)
are not shown.

Signed-off-by: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
---
 man7/capabilities.7 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index b8f2a75..5e4e6bf 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -1034,7 +1034,11 @@ The
 file can be used to view the capability sets of a thread.
 The
 .I /proc/PID/status
-file shows the capability sets of a process's main thread.
+file shows the capability sets of a process's main thread. Since kernel 3.6.8,
+all non-existent capabilities (above
+.B CAP_LAST_CAP)
+are not shown.
+.\" 7b9a7ec565505699f503b4fcf61500dceb36e744
 
 The
 .I libcap
-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
