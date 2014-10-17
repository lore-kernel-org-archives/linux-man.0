From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tmpnam.3: Modify thread-safety information
Date: Fri, 17 Oct 2014 11:01:06 +0800
Message-ID: <1413514866-28678-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

When the argument s is NULL, tmpnam() should be MT-Unsafe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tmpnam.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/tmpnam.3 b/man3/tmpnam.3
index 0371d79..bf68159 100644
--- a/man3/tmpnam.3
+++ b/man3/tmpnam.3
@@ -93,7 +93,7 @@ l l l.
 Interface	Attribute	Value
 T{
 .BR tmpnam ()
-T}	Thread safety	MT-Safe /!s
+T}	Thread safety	MT-Unsafe race:tmpnam/!s
 T{
 .BR tmpnam_r ()
 T}	Thread safety	MT-Safe
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
