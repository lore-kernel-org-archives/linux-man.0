From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] cgroups.7: tfix
Date: Fri, 26 Jan 2018 14:40:26 +0100
Message-ID: <20180126134026.2960-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/cgroups.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/cgroups.7 b/man7/cgroups.7
index 1d7edd6e5..bf32aa958 100644
--- a/man7/cgroups.7
+++ b/man7/cgroups.7
@@ -1286,7 +1286,7 @@ becomes
 .IP *
 All of the descendant cgroups of
 .I x
-that are were not already of type
+that were not already of type
 .IR threaded
 are converted to type
 .IR "domain invalid" .
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
