From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] finite.3: ffix
Date: Mon, 22 Jul 2013 15:27:12 +0800
Message-ID: <1374478032-7985-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/finite.3 | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/man3/finite.3 b/man3/finite.3
index 72b8646..81c7146 100644
--- a/man3/finite.3
+++ b/man3/finite.3
@@ -89,21 +89,30 @@ _BSD_SOURCE || _SVID_SOURCE || _XOPEN_SOURCE\ >=\ 600
 .ad b
 .SH DESCRIPTION
 The
-.BR finite ()
+.BR finite (),
+.BR finitef (),
+and
+.BR finitel ()
 functions return a nonzero value if
 .I x
 is neither infinite
 nor a "not-a-number" (NaN) value, and 0 otherwise.
 
 The
-.BR isnan ()
+.BR isnan (),
+.BR isnanf (),
+and
+.BR isnanl ()
 functions return a nonzero value if
 .I x
 is a NaN value,
 and 0 otherwise.
 
 The
-.BR isinf ()
+.BR isinf (),
+.BR isinff (),
+and
+.BR isinfl ()
 functions return 1 if
 .I x
 is positive infinity, \-1 if
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
