From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] scalbln.3: Reformat thread-safety information
Date: Mon, 25 Aug 2014 11:01:46 +0800
Message-ID: <1408935706-14710-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/scalbln.3 | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/man3/scalbln.3 b/man3/scalbln.3
index 2b611a5..32f20c2 100644
--- a/man3/scalbln.3
+++ b/man3/scalbln.3
@@ -158,16 +158,23 @@ These functions do not set
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw33 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR scalbn (),
 .BR scalbnf (),
 .BR scalbnl (),
+.br
 .BR scalbln (),
 .BR scalblnf (),
-and
 .BR scalblnl ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
