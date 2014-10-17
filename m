From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] hsearch.3: Reformat thread-safety information
Date: Fri, 17 Oct 2014 11:35:14 +0800
Message-ID: <1413516914-30757-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/hsearch.3 | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/man3/hsearch.3 b/man3/hsearch.3
index 176262f..aced682 100644
--- a/man3/hsearch.3
+++ b/man3/hsearch.3
@@ -229,20 +229,24 @@ POSIX.1-2001 specifies only the
 .B ENOMEM
 error.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw38 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR hcreate (),
 .BR hsearch (),
-and
 .BR hdestroy ()
-functions use a global space for storing the table, so they are not thread-safe.
-.LP
-The
+T}	Thread safety	MT-Unsafe
+T{
 .BR hcreate_r (),
 .BR hsearch_r (),
-and
 .BR hdestroy_r ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 The functions
 .BR hcreate (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
