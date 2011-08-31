From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] prctl.2: fix reference formatting
Date: Thu, 01 Sep 2011 00:17:18 +0900
Message-ID: <4E5E507E.2050005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: Reference should be in bold, not in italic.


diff --git a/man2/prctl.2 b/man2/prctl.2
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -361,7 +361,7 @@ signal as soon as hardware memory corruption is
detected inside
its address space.
In late kill mode, the process is only killed when it accesses a
corrupted page.
See
-.I sigaction(2)
+.BR sigaction (2)
for more information on the
.BR SIGBUS
signal.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
