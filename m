From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcscasecmp.3: Reformat thread-safety information
Date: Wed, 9 Jul 2014 10:52:31 +0800
Message-ID: <1404874351-12551-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcscasecmp.3 | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/man3/wcscasecmp.3 b/man3/wcscasecmp.3
index 547f2e2..f5db10a 100644
--- a/man3/wcscasecmp.3
+++ b/man3/wcscasecmp.3
@@ -81,13 +81,17 @@ The
 .BR wcscasecmp ()
 function is provided in glibc since version 2.1.
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
 .BR wcscasecmp ()
-function is thread-safe with exceptions.
-It can be safely used in multithreaded applications, as long as
-.BR setlocale (3)
-is not called to change the locale during its execution.
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 POSIX.1-2008.
 This function is not specified in POSIX.1-2001,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
