From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mtrace.3: Add FIXME
Date: Fri, 27 Feb 2015 09:38:55 +0800
Message-ID: <1425001135-31056-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mtrace.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/mtrace.3 b/man3/mtrace.3
index eb2e581..a775753 100644
--- a/man3/mtrace.3
+++ b/man3/mtrace.3
@@ -86,6 +86,13 @@ Interface	Attribute	Value
 T{
 .BR mtrace (),
 .BR muntrace ()
+.\" FIXME: the following marking is different from which in glibc manual,
+.\" markings in glibc manual are more detailed.
+.\" mtrace: MT-Unsafe env race:mtrace const:malloc_hooks init
+.\" muntrace: MT-Unsafe race:mtrace const:malloc_hooks locale
+.\" But there is something wrong in glibc manual, for example:
+.\" glibc manual says muntrace should have marking locale because it calls 
+.\" fprintf(), but muntrace does not execute area which cause locale problem.
 T}	Thread safety	MT-Unsafe
 .TE
 .SH CONFORMING TO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
