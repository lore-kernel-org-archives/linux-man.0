From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] puts.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 29 Jul 2014 09:43:53 +0800
Message-ID: <1406598233-24373-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions fputc(), fputs(), putc(), putchar() and puts() are
thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/puts.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/puts.3 b/man3/puts.3
index 385b0e9..c3e9412 100644
--- a/man3/puts.3
+++ b/man3/puts.3
@@ -100,6 +100,22 @@ and
 return a nonnegative number on success, or
 .B EOF
 on error.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw25 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fputc (),
+.BR fputs (),
+.BR putc (),
+.BR putchar (),
+.BR puts ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C89, C99.
 .SH BUGS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
