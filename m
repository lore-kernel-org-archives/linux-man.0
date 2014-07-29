From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] puts.3: tfix
Date: Tue, 29 Jul 2014 09:44:59 +0800
Message-ID: <1406598299-24465-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/puts.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/puts.3 b/man3/puts.3
index c3e9412..ab40659 100644
--- a/man3/puts.3
+++ b/man3/puts.3
@@ -63,7 +63,7 @@ except that it may be implemented as a macro which evaluates
 .I stream
 more than once.
 .PP
-.BI "putchar(" c );
+.BI "putchar(" c )
 is equivalent to
 .BI "putc(" c ", " stdout ).
 .PP
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
