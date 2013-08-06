From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ilogb.3: tfix
Date: Tue, 6 Aug 2013 17:12:50 +0800
Message-ID: <1375780370-11239-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ilogb.3 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man3/ilogb.3 b/man3/ilogb.3
index 481099b..f024500 100644
--- a/man3/ilogb.3
+++ b/man3/ilogb.3
@@ -72,7 +72,10 @@ These functions return the exponent part of their argument
 as a signed integer.
 When no error occurs, these functions
 are equivalent to the corresponding
-.BR logb (3)
+.BR logb (3),
+.BR logbf (3),
+and
+.BR logbl (3)
 functions, cast to
 .IR int .
 .SH RETURN VALUE
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
