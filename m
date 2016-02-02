From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/5] kexec_load.2: tfix
Date: Tue,  2 Feb 2016 21:50:45 +0100
Message-ID: <1454446248-448-2-git-send-email-jwilk@jwilk.net>
References: <1454446248-448-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454446248-448-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/kexec_load.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/kexec_load.2 b/man2/kexec_load.2
index 2509e2c..ad47a72 100644
--- a/man2/kexec_load.2
+++ b/man2/kexec_load.2
@@ -60,7 +60,7 @@ The following values can be specified in
 Execute the new kernel automatically on a system crash.
 This "crash kernel" is loaded into an area of reserved memory that
 is determined at boot time using the
-.I craskkernel
+.I crashkernel
 kernel command-line parameter.
 The location of this reserved memory is exported to user space via the
 .I /proc/iomem
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
