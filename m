From: Marko Kevac <marko-+omovHKzcgHYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] memfd_create.2: tfix
Date: Mon, 16 May 2016 00:00:22 +0300
Message-ID: <E6A48A90-00E9-4DC1-8246-480EF51364F9@kevac.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is patch for current master. Fixes small typo.

>From 94292ebe260a64920c63fe64075e0fa636a126cb Mon Sep 17 00:00:00 2001
From: Marko Kevac <marko-+omovHKzcgHYtjvyW6yDsg@public.gmane.org>
Date: Sun, 15 May 2016 23:56:34 +0300
Subject: [PATCH] memfd_create.2: tfix

---
 man2/memfd_create.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/memfd_create.2 b/man2/memfd_create.2
index 09128e1..737be06 100644
--- a/man2/memfd_create.2
+++ b/man2/memfd_create.2
@@ -268,7 +268,7 @@ since they are running under the same user ID.
 Therefore, file sealing would not normally be necessary.)
 .IP *
 The second process opens the file
-.IR /proc/<pd>/fd/<fd> ,
+.IR /proc/<pid>/fd/<fd> ,
 where
 .I <pid>
 is the PID of the first process (the one that called
--
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
