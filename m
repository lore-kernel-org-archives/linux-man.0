From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] inet_ntop.3: ATTRIBUTES: Note functions that is thread-safe
Date: Wed, 29 Apr 2015 18:09:21 +0800
Message-ID: <1430302166-1700-5-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1430302166-1700-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430302166-1700-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- inet_ntop: MT-Safe locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/inet_ntop.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/inet_ntop.3 b/man3/inet_ntop.3
index 5144344..5cd8c83 100644
--- a/man3/inet_ntop.3
+++ b/man3/inet_ntop.3
@@ -97,6 +97,19 @@ was not a valid address family.
 .B ENOSPC
 The converted address string would exceed the size given by
 .IR size .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR inet_ntop ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 Note that RFC\ 2553 defines a prototype where the last argument
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
