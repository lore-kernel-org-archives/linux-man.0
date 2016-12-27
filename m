From: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] getline.3: document ENOMEM error case
Date: Tue, 27 Dec 2016 16:01:36 +0100
Message-ID: <1482850896-85601-1-git-send-email-jannh@google.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

see the error handling in libio/iogetdelim.c

Signed-off-by: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 man3/getline.3 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man3/getline.3 b/man3/getline.3
index 7020777..5f1d9c8 100644
--- a/man3/getline.3
+++ b/man3/getline.3
@@ -134,6 +134,9 @@ or
 is NULL, or
 .I stream
 is not valid).
+.TP
+.B ENOMEM
+Allocation or reallocation of the line buffer failed.
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
 .BR attributes (7).
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
