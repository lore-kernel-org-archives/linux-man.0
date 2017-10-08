From: Fangrui Song <i@maskray.me>
Subject: [patch] pow10.3: tfix
Date: Sat, 7 Oct 2017 23:03:15 -0700
Message-ID: <59d9c1f2.97f5620a.1ea0a.78a7@mx.google.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Fangrui Song <i@maskray.me>
---
 man3/pow10.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/pow10.3 b/man3/pow10.3
index bd2a5601c..58feb5b43 100644
--- a/man3/pow10.3
+++ b/man3/pow10.3
@@ -44,7 +44,7 @@ These functions return the value of 10 raised to the power
 These functions perform exactly the same task as the functions described in
 .BR exp10 (3),
 with the difference that the latter functions are now standardized
-in TS\ 1866104.
+in TS\ 18661-4:2015.
 Those latter functions should be used in preference
 to the functions described in this page.
 .SH VERSIONS
-- 
2.14.2.920.gcf0c67979c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
