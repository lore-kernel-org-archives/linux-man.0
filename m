From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fputwc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 12 Mar 2015 11:42:09 +0800
Message-ID: <1426131729-2270-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fputwc.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/fputwc.3 b/man3/fputwc.3
index 0a7dc87..fb79ada 100644
--- a/man3/fputwc.3
+++ b/man3/fputwc.3
@@ -65,6 +65,20 @@ Apart from the usual ones, there is
 .TP
 .B EILSEQ
 Conversion of \fIwc\fP to the stream's encoding fails.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw17 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fputwc (),
+.BR putwc ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH NOTES
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
