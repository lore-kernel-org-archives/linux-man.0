From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] setbuf.3: Reformat thread-safety information
Date: Mon, 25 Aug 2014 10:23:22 +0800
Message-ID: <1408933402-9764-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/setbuf.3 | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/man3/setbuf.3 b/man3/setbuf.3
index fdb53fd..d0fc30b 100644
--- a/man3/setbuf.3
+++ b/man3/setbuf.3
@@ -162,14 +162,21 @@ on failure.
 
 The other functions do not return a value.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw23 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR setbuf (),
 .BR setbuffer (),
+.br
 .BR setlinebuf (),
-and
 .BR setvbuf ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 The
 .BR setbuf ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
