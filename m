From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] inet_pton.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Thu, 10 Jul 2014 10:03:25 +0800
Message-ID: <1404957805-6551-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function inet_pton() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/inet_pton.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/inet_pton.3 b/man3/inet_pton.3
index 6125de4..6472c6f 100644
--- a/man3/inet_pton.3
+++ b/man3/inet_pton.3
@@ -126,6 +126,18 @@ does not contain a valid address family, \-1 is returned and
 .I errno
 is set to
 .BR EAFNOSUPPORT .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR inet_pton ()
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
