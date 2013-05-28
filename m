From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ether_aton.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Tue, 28 May 2013 17:08:22 +0800
Message-ID: <1369732102-8641-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions ether_aton() and ether_ntoa() are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ether_aton.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/ether_aton.3 b/man3/ether_aton.3
index eb65777..9355de1 100644
--- a/man3/ether_aton.3
+++ b/man3/ether_aton.3
@@ -120,6 +120,22 @@ struct ether_addr {
 }
 .fi
 .in
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ether_aton ()
+and
+.BR ether_ntoa ()
+functions are not thread-safe.
+.LP
+The
+.BR ether_ntohost (),
+.BR ether_hostton (),
+.BR ether_line (),
+.BR ether_ntoa_r ()
+and
+.BR ether_aton_r ()
+functions are thread-safe.
 .SH CONFORMING TO
 4.3BSD, SunOS.
 .SH BUGS
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
