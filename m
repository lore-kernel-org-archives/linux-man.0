From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] random.4: tfix
Date: Wed, 8 Nov 2017 16:11:01 +0900
Message-ID: <7be0a29b-ca12-01e1-804b-58dfe93f3f48@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 man4/random.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/random.4 b/man4/random.4
index 0b54f5309..0c597ca5d 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -235,7 +235,7 @@ Normally, this file will have the value 512, but it is writable,
 and can be changed to any value for which an algorithm is available.
 The choices are 32, 64, 128, 256, 512, 1024, or 2048.
 .TP
-Linux 2.6 and later
+Linux 2.6 and later:
 This file is read-only, and gives the size of the entropy pool in
 .IR bits .
 It contains the value 4096.
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
