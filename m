From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] system.3: Reformat thread-safety information
Date: Tue, 22 Jul 2014 11:10:40 +0800
Message-ID: <1405998640-26135-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/system.3 | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/man3/system.3 b/man3/system.3
index 22a6b3b..d80416f 100644
--- a/man3/system.3
+++ b/man3/system.3
@@ -108,10 +108,17 @@ and so on).
 .BR system ()
 does not affect the wait status of any other children.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR system ()
-function is thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C89, C99, POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
