From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wctomb.3: Reformat thread-safety information
Date: Wed, 25 Jun 2014 13:35:18 +0800
Message-ID: <1403674518-19831-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wctomb.3 | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/man3/wctomb.3 b/man3/wctomb.3
index 9b86327..8fda93d 100644
--- a/man3/wctomb.3
+++ b/man3/wctomb.3
@@ -82,10 +82,17 @@ is NULL, the
 function returns nonzero if the
 encoding has nontrivial shift state, or zero if the encoding is stateless.
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
 .BR wctomb ()
-function is not thread-safe.
+T}	Thread safety	MT-Unsafe
+.TE
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
