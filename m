From: Arthur Gautier <baloo-M8Sm6a3kpgNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] capget.2: capability.h is now in linux uapi + tfix
Date: Mon, 12 Oct 2015 20:25:46 +0000
Message-ID: <1444681546-28408-1-git-send-email-baloo@gandi.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Arthur Gautier <baloo-M8Sm6a3kpgNeoWH0uzbU5w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

introduced in 607ca46e97a1b6594b29647d98a32d545c24bdff

Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Arthur Gautier <baloo-M8Sm6a3kpgNeoWH0uzbU5w@public.gmane.org>
---
 man2/capget.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/capget.2 b/man2/capget.2
index 40b8a4eda595..29f0bdb69514 100644
--- a/man2/capget.2
+++ b/man2/capget.2
@@ -16,7 +16,7 @@
 .SH NAME
 capget, capset \- set/get capabilities of thread(s)
 .SH SYNOPSIS
-.B #include <sys/capability.h>
+.B #include <linux/capability.h>
 .sp
 .BI "int capget(cap_user_header_t " hdrp ", cap_user_data_t " datap );
 .sp
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
