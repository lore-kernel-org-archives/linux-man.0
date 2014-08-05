From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stpncpy.3: Reformat thread-safety information
Date: Tue, 5 Aug 2014 17:02:02 +0800
Message-ID: <1407229322-652-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stpncpy.3 | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/man3/stpncpy.3 b/man3/stpncpy.3
index d736f3a..6ed7f21 100644
--- a/man3/stpncpy.3
+++ b/man3/stpncpy.3
@@ -89,10 +89,17 @@ or, if
 is not null-terminated,
 .IR dest + n .
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
 .BR stpncpy ()
-function is thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 This function was added to POSIX.1-2008.
 Before that, it was a GNU extension.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
