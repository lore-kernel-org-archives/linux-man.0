From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] mlock.2: generalize EPERM description
Date: Wed, 31 Aug 2011 23:56:41 +0900
Message-ID: <4E5E4BA9.8000609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: EPERM error code is not only set by munlock(), but also by other calls.


diff --git a/man2/mlock.2 b/man2/mlock.2
--- a/man2/mlock.2
+++ b/man2/mlock.2
@@ -151,8 +151,7 @@ soft resource limit was 0.
.TP
.B EPERM
(Linux 2.6.8 and earlier)
-The calling process has insufficient privilege to call
-.BR munlockall ().
+The calling process has insufficient privilege.
Under Linux the
.B CAP_IPC_LOCK
capability is required.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
