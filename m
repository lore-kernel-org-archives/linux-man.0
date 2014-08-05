From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stdarg.3: Reformat thread-safety information
Date: Tue, 5 Aug 2014 17:58:03 +0800
Message-ID: <1407232683-4806-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stdarg.3 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man3/stdarg.3 b/man3/stdarg.3
index 1d227b7..0adbff8 100644
--- a/man3/stdarg.3
+++ b/man3/stdarg.3
@@ -227,14 +227,20 @@ have
 .B __va_copy
 instead, since that was the name used in the draft proposal.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw21 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR va_start (),
 .BR va_arg (),
 .BR va_end (),
-and
 .BR va_copy ()
-macros are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 The
 .BR va_start (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
