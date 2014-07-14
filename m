From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] nl_langinfo.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Mon, 14 Jul 2014 14:42:20 +0800
Message-ID: <1405320140-2308-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function nl_langinfo() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/nl_langinfo.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/nl_langinfo.3 b/man3/nl_langinfo.3
index d703c09..aa4bdb4 100644
--- a/man3/nl_langinfo.3
+++ b/man3/nl_langinfo.3
@@ -113,6 +113,18 @@ next call to
 .BR nl_langinfo ()
 or
 .BR setlocale (3).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR nl_langinfo ()
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 SUSv2, POSIX.1-2001.
 .SH EXAMPLE
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
