From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getunwind.2: wfix and tfix
Date: Sat,  2 Mar 2013 19:10:12 -0400
Message-ID: <1362265812-27531-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/getunwind.2 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/getunwind.2 b/man2/getunwind.2
index 13ed6e3..6ac8c4d 100644
--- a/man2/getunwind.2
+++ b/man2/getunwind.2
@@ -67,12 +67,12 @@ The unwind table contains entries of the following form:
 
 .nf
 	u64 start;      (64-bit address of start of function)
-	u64 end;        (64-bit address of start of function)
+	u64 end;        (64-bit address of end of function)
 	u64 info;       (BUF-relative offset to unwind info)
 .fi
 
 An entry whose
-.I sytart
+.I start
 value is zero indicates the end of the table.
 For more information about the format, see the
 .I IA-64 Software Conventions and Runtime Architecture
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
