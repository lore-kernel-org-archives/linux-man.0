From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getw.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 22 Jul 2014 11:00:52 +0800
Message-ID: <1405998052-25687-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions getw() and putw() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getw.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/getw.3 b/man3/getw.3
index 7850de0..430343b 100644
--- a/man3/getw.3
+++ b/man3/getw.3
@@ -77,6 +77,19 @@ returns the word read, and
 .BR putw ()
 returns 0.
 On error, they return \fBEOF\fP.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw14 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getw (),
+.BR putw ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SVr4, SUSv2.
 Not present in POSIX.1-2001.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
