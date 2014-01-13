From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stpncpy.3: wfix
Date: Mon, 13 Jan 2014 15:31:10 +0800
Message-ID: <1389598270-12793-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stpncpy.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/stpncpy.3 b/man3/stpncpy.3
index fdf5139..60042e6 100644
--- a/man3/stpncpy.3
+++ b/man3/stpncpy.3
@@ -65,7 +65,7 @@ are filled
 with null bytes (\(aq\\0\(aq),
 If the length
 .I strlen(src)
-is greater or equal to
+is greater than or equal to
 .IR n ,
 the string pointed to by
 .I dest
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
