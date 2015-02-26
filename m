From: wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org
Subject: [PATCH] msgop.2: remove EAGAIN as msgrcv errno
Date: Thu, 26 Feb 2015 18:36:00 -0500
Message-ID: <1424993760-15047-1-git-send-email-wfp5p@worldbroken.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>

The list of errnos for msgrcv lists both EAGAIN and ENOMSG as the
errno for no message available with the IPC_NOWAIT flag.  ENOMSG is
the errno that will be set.

Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
---
 man2/msgop.2 | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/man2/msgop.2 b/man2/msgop.2
index d1bd2125344d..286c9965d595 100644
--- a/man2/msgop.2
+++ b/man2/msgop.2
@@ -417,12 +417,6 @@ and does not have the
 .B CAP_IPC_OWNER
 capability.
 .TP
-.B EAGAIN
-No message was available in the queue and
-.B IPC_NOWAIT
-was specified in
-.IR msgflg .
-.TP
 .B EFAULT
 The address pointed to by
 .I msgp
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
