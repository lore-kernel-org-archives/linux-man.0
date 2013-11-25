From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] capget.2: wfix
Date: Mon, 25 Nov 2013 11:22:55 +0800
Message-ID: <1385349775-26648-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man2/capget.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/capget.2 b/man2/capget.2
index 624d51b..1074ab2 100644
--- a/man2/capget.2
+++ b/man2/capget.2
@@ -83,7 +83,7 @@ The
 and
 .I inheritable
 fields are bit masks of the capabilities defined in
-.I capability(7).
+.BR capabilities (7).
 Note the
 .B CAP_*
 values are bit indexes and need to be bit-shifted before ORing into
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
