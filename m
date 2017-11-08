From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] sockatmark.3: Fix example code
Date: Wed, 8 Nov 2017 16:19:12 +0900
Message-ID: <c542b06a-0d03-89cf-dd6a-e24ebb1abc7f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man3/sockatmark.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/sockatmark.3 b/man3/sockatmark.3
index 79685c3ed..fc7022216 100644
--- a/man3/sockatmark.3
+++ b/man3/sockatmark.3
@@ -129,7 +129,7 @@ and then read the byte of data at the mark:
         if (atmark)
             break;
 
-        s = read(sockfd, buf, BUF_LEN) <= 0);
+        s = read(sockfd, buf, BUF_LEN);
         if (s == \-1)
             perror("read");
         if (s <= 0)
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
