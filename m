From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fallocate.2: ffix
Date: Mon, 27 Feb 2012 23:14:26 -0400
Message-ID: <1330398866-16965-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/fallocate.2 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 9fe0620..2f84c91 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -49,7 +49,7 @@ and
 The file size (as reported by
 .BR stat (2))
 will be changed if
-.I "offset + len"
+.IR offset + len
 is greater than the file size.
 This default behavior closely resembles the behavior of the
 .BR posix_fallocate (3)
@@ -68,7 +68,7 @@ flag is specified in
 .IR mode ,
 the behavior of the call is similar,
 but the file size will not be changed even if
-.I "offset + len"
+.IR offset + len
 is greater than the file size.
 Preallocating zeroed blocks beyond the end of the file in this manner
 is useful for optimizing append workloads.
-- 
1.7.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
