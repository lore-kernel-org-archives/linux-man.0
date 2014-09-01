From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] random_r.3: Reformat thread-safety information
Date: Mon, 1 Sep 2014 11:16:13 +0800
Message-ID: <1409541373-27863-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/random_r.3 | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/man3/random_r.3 b/man3/random_r.3
index 92fe430..71ca64d 100644
--- a/man3/random_r.3
+++ b/man3/random_r.3
@@ -126,14 +126,21 @@ argument to
 .BR random_r ()
 was NULL.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR random_r (),
 .BR srandom_r (),
+.br
 .BR initstate_r (),
-and
 .BR setstate_r ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 These functions are nonstandard glibc extensions.
 .\" These functions appear to be on Tru64, but don't seem to be on
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
