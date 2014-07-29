From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fread.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 29 Jul 2014 10:09:07 +0800
Message-ID: <1406599747-26274-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions fread() and fwrite() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fread.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/fread.3 b/man3/fread.3
index ab81d4b..740e6ef 100644
--- a/man3/fread.3
+++ b/man3/fread.3
@@ -100,6 +100,19 @@ does not distinguish between end-of-file and error, and callers must use
 and
 .BR ferror (3)
 to determine which occurred.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw17 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fread (),
+.BR fwrite ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C89, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
