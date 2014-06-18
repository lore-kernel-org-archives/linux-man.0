From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] gnu_get_libc_version.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 18 Jun 2014 17:09:07 +0800
Message-ID: <1403082547-27368-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions gnu_get_libc_version() and gnu_get_libc_release()
are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/gnu_get_libc_version.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/gnu_get_libc_version.3 b/man3/gnu_get_libc_version.3
index d622ead..ebbab1a 100644
--- a/man3/gnu_get_libc_version.3
+++ b/man3/gnu_get_libc_version.3
@@ -46,6 +46,19 @@ This will be a string such as
 .IR "stable" .
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw23 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR gnu_get_libc_version (),
+.BR gnu_get_libc_release ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 These functions are glibc-specific.
 .SH EXAMPLE
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
