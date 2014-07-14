From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] towlower.3: Reformat thread-safety information
Date: Mon, 14 Jul 2014 15:20:34 +0800
Message-ID: <1405322434-4778-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/towlower.3 | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/man3/towlower.3 b/man3/towlower.3
index 7d93ee6..09b5ccc 100644
--- a/man3/towlower.3
+++ b/man3/towlower.3
@@ -89,14 +89,20 @@ returns its lowercase equivalent;
 otherwise it returns
 .IR wc .
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
 .BR towlower ()
-function is thread-safe with exceptions.
-It can be safely used in multithreaded applications, as long as
-.BR setlocale (3)
-is not called to change the locale during its execution.
-.\" FIXME need a thread-safety statement about towlower_l()
+T}	Thread safety	MT-Safe locale
+T{
+.BR towlower_l ()
+T}	Thread safety	MT-Safe
+.TE
 .SH VERSIONS
 The
 .BR towlower_l ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
