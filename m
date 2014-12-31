From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] j0.3:ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 31 Dec 2014 15:40:11 +0800
Message-ID: <1420011611-15406-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function j0(), j1f() jnl() and so on are thread safe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/j0.3 | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/man3/j0.3 b/man3/j0.3
index 5f01ee7..9a87314 100644
--- a/man3/j0.3
+++ b/man3/j0.3
@@ -154,6 +154,30 @@ These functions do not raise exceptions for
 .\" FIXME . Is it intentional that these functions do not raise exceptions?
 .\" e.g., j0(1.5e16)
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6805
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR j0 (),
+.BR j0f (),
+.BR j0l ()
+T}	Thread safety	MT-Safe
+T{
+.BR j1 (),
+.BR j1f (),
+.BR j1l ()
+T}	Thread safety	MT-Safe
+T{
+.BR jn (),
+.BR jnf (),
+.BR jnl ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 The functions returning
 .I double
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
