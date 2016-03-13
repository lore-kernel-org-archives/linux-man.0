From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/3] adjtimex.2: tfix
Date: Sun, 13 Mar 2016 19:00:57 +0100
Message-ID: <1457892059-7685-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/adjtimex.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index 324de05..adcfbca 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -456,7 +456,7 @@ does not point to writable memory.
 An attempt was made to set
 .I buf.freq
 to a value outside the range (\-33554432, +33554432).
-.\" From a quck glance, it appears there was no clamping or range check
+.\" From a quick glance, it appears there was no clamping or range check
 .\" for buf.freq in kernels before 2.0
 .TP
 .BR EINVAL " (kernels before Linux 2.6.26)"
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
