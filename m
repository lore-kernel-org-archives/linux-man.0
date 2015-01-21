From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] hsearch.3: Modify thread-safety information
Date: Wed, 21 Jan 2015 09:34:25 +0800
Message-ID: <1421804065-629-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/hsearch.3 | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/man3/hsearch.3 b/man3/hsearch.3
index aced682..0f1af24 100644
--- a/man3/hsearch.3
+++ b/man3/hsearch.3
@@ -233,19 +233,21 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw38 lb lb
+lbw25 lb lb
 l l l.
 Interface	Attribute	Value
 T{
 .BR hcreate (),
 .BR hsearch (),
+.br
 .BR hdestroy ()
-T}	Thread safety	MT-Unsafe
+T}	Thread safety	MT-Unsafe race:hsearch
 T{
 .BR hcreate_r (),
 .BR hsearch_r (),
+.br
 .BR hdestroy_r ()
-T}	Thread safety	MT-Safe
+T}	Thread safety	MT-Safe race:htab
 .TE
 .SH CONFORMING TO
 The functions
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
