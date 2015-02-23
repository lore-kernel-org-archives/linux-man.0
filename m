From: wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org
Subject: [PATCH 2/4] memfd_create.2: spfix
Date: Mon, 23 Feb 2015 13:54:15 -0500
Message-ID: <1424717657-9580-3-git-send-email-wfp5p@worldbroken.com>
References: <1424717657-9580-1-git-send-email-wfp5p@worldbroken.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424717657-9580-1-git-send-email-wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>

Change "behaviour" to American spelling "behavior".

Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
---
 man2/memfd_create.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/memfd_create.2 b/man2/memfd_create.2
index 06c86012a516..e661336103e5 100644
--- a/man2/memfd_create.2
+++ b/man2/memfd_create.2
@@ -69,7 +69,7 @@ and as such multiple files can have the same name without any side effects.
 
 The following values may be bitwise ORed in
 .IR flags
-to change the behaviour of
+to change the behavior of
 .BR memfd_create ():
 .TP
 .BR MFD_CLOEXEC
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
