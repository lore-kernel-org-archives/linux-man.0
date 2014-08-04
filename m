From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strerror.3: Reformat thread-safety information
Date: Mon, 4 Aug 2014 16:53:34 +0800
Message-ID: <1407142414-23942-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strerror.3 | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/man3/strerror.3 b/man3/strerror.3
index b8f9cd7..708e15b 100644
--- a/man3/strerror.3
+++ b/man3/strerror.3
@@ -200,15 +200,21 @@ is not a valid error number.
 .B ERANGE
 Insufficient storage was supplied to contain the error description string.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw26 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR strerror ()
-function is not thread-safe.
-.LP
-The
-.BR strerror_r ()
-function is thread-safe.
-.\" FIXME Need a thread-safety statement about strerror_l()
+T}	Thread safety	MT-Unsafe
+T{
+.BR strerror_r (),
+.BR strerror_l ()
+T}	Thread safety	MT-Safe
+.TE
 .SH VERSIONS
 The
 .BR strerror_l ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
