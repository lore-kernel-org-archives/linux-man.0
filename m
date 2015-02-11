From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fgetwc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 11 Feb 2015 14:27:59 +0800
Message-ID: <1423636079-23711-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fgetwc.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/fgetwc.3 b/man3/fgetwc.3
index 39c9fad..e31db1a 100644
--- a/man3/fgetwc.3
+++ b/man3/fgetwc.3
@@ -67,6 +67,19 @@ Apart from the usual ones, there is
 .B EILSEQ
 The data obtained from the input stream does not
 form a valid character.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw17 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fgetwc (),
+.BR getwc ()
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
