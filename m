From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH V2] scalb.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 7 Jan 2015 09:30:50 +0800
Message-ID: <1420594250-18228-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function scalb(), scalbf() and scalbl() are thread safe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/scalb.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/scalb.3 b/man3/scalb.3
index 300ad4f..74e954a 100644
--- a/man3/scalb.3
+++ b/man3/scalb.3
@@ -174,6 +174,20 @@ These functions do not set
 .\" FIXME . Is it intentional that these functions do not set errno?
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6803
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6804
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR scalb (),
+.BR scalbf (),
+.BR scalbl ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 .BR scalb ()
 is specified in POSIX.1-2001, but marked obsolescent.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
