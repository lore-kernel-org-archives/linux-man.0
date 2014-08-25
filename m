From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] seekdir.3: Reformat thread-safety information
Date: Mon, 25 Aug 2014 10:53:28 +0800
Message-ID: <1408935208-12883-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/seekdir.3 | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/man3/seekdir.3 b/man3/seekdir.3
index 7eeb822..0731f52 100644
--- a/man3/seekdir.3
+++ b/man3/seekdir.3
@@ -62,10 +62,17 @@ The
 .BR seekdir ()
 function returns no value.
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
 .BR seekdir ()
-function is thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
