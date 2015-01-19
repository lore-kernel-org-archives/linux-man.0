From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] makecontext.3: Modify thread-safety information
Date: Mon, 19 Jan 2015 11:15:34 +0800
Message-ID: <1421637334-6110-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As annotation in glibc manual is more detailed, change the 
thread-safety information to be the same as glibc manual.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/makecontext.3 | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/man3/makecontext.3 b/man3/makecontext.3
index 2c83f0e..8719367 100644
--- a/man3/makecontext.3
+++ b/man3/makecontext.3
@@ -107,13 +107,15 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw28 lb lb
+lb lb lb
 l l l.
 Interface	Attribute	Value
 T{
-.BR makecontext (),
+.BR makecontext ()
+T}	Thread safety	MT-Safe race:ucp
+T{
 .BR swapcontext ()
-T}	Thread safety	MT-Safe
+T}	Thread safety	MT-Safe race:oucp race:ucp
 .TE
 .SH CONFORMING TO
 SUSv2, POSIX.1-2001.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
