From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] open_by_handle_at.2: file_handle is named handle
Date: Fri, 18 Apr 2014 22:00:56 +0200
Message-ID: <1397851256-11226-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/open_by_handle_at.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open_by_handle_at.2 b/man2/open_by_handle_at.2
index 8a67143..55dbd1f 100644
--- a/man2/open_by_handle_at.2
+++ b/man2/open_by_handle_at.2
@@ -276,7 +276,7 @@ points outside your accessible address space.
 includes an invalid bit value.
 .TP
 .B EINVAL
-.IR handle_bytes\->handle_bytes
+.IR handle\->handle_bytes
 is greater than
 .BR MAX_HANDLE_SZ .
 .TP
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
