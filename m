From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] capabilities.7: fix typo
Date: Wed, 31 Aug 2011 23:16:40 +0900
Message-ID: <4E5E4248.1010602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: Just a typo. There's no flag named SECURE_KEEP_CAPS.


diff --git a/man7/capabilities.7 b/man7/capabilities.7
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -845,7 +845,7 @@ flags are inherited by child processes.
During an
.BR execve (2),
all of the flags are preserved, except
-.B SECURE_KEEP_CAPS
+.B SECBIT_KEEP_CAPS
which is always cleared.

An application can use the following call to lock itself,

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
