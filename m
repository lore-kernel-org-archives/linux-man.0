From: Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Add EINVAL to errors list of open(2)
Date: Fri, 16 Aug 2013 15:57:47 -0500
Message-ID: <1376686667-6686-1-git-send-email-cardoe@cardoe.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

EINVAL can be returned by open(2) when the underlying filesystem doesn't
support O_DIRECT. It is documented in the NOTES section but this patch
adds it to the list of possible errors.
---
 man2/open.2 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man2/open.2 b/man2/open.2
index 9ebc0a0..93a9e7d 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -611,6 +611,13 @@ While blocked waiting to complete an open of a slow device
 the call was interrupted by a signal handler; see
 .BR signal (7).
 .TP
+.B EINVAL
+The filesystem does not support the
+.BR O_DIRECT
+flag. See
+.BR NOTES
+for more information.
+.TP
 .B EISDIR
 .I pathname
 refers to a directory and the access requested involved writing
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
