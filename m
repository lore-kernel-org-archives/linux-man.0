From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 3/3] ulimit.3: tfix
Date: Mon,  1 May 2017 23:30:04 +0200
Message-ID: <20170501213004.2199-3-jwilk@jwilk.net>
References: <20170501213004.2199-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170501213004.2199-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/ulimit.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/ulimit.3 b/man3/ulimit.3
index cb713291c..8c6f5386f 100644
--- a/man3/ulimit.3
+++ b/man3/ulimit.3
@@ -74,7 +74,7 @@ is set appropriately.
 .SH ERRORS
 .TP
 .B EPERM
-A unprivileged process tried to increase a limit.
+An unprivileged process tried to increase a limit.
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
 .BR attributes (7).
-- 
2.13.0.rc0.306.g87b477812d

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
