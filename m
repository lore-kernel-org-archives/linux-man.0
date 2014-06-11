From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] locale.7: tfix
Date: Wed, 11 Jun 2014 21:24:54 +0400
Message-ID: <1402507494-4481-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/locale.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/locale.7 b/man7/locale.7
index 1ef0c89..3bcbfc8 100644
--- a/man7/locale.7
+++ b/man7/locale.7
@@ -183,7 +183,7 @@ the thousands separator and the radix character
 (a period in most English-speaking countries,
 but a comma in many other regions).
 It affects functions such as
-.BR printf (3)
+.BR printf (3),
 .BR scanf (3),
 and
 .BR strtod (3).
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
