From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] copysign.3: wfix
Date: Mon, 14 Oct 2013 11:27:56 +0800
Message-ID: <1381721276-17604-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/copysign.3 | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/man3/copysign.3 b/man3/copysign.3
index 2e35b68..65f6c79 100644
--- a/man3/copysign.3
+++ b/man3/copysign.3
@@ -63,7 +63,10 @@ or
 .ad b
 .SH DESCRIPTION
 The
-.BR copysign ()
+.BR copysign (),
+.BR copysignf (),
+and
+.BR copysignl ()
 functions return a value whose absolute value matches
 that of
 .IR x ,
@@ -104,8 +107,7 @@ This function is defined in IEC 559 (and the appendix with
 recommended functions in IEEE 754/IEEE 854).
 .SH NOTES
 On architectures where the floating-point formats are not IEEE 754 compliant,
-the
-.BR copysign ()
+these
 functions may treat a negative zero as positive.
 .SH SEE ALSO
 .BR signbit (3)
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
