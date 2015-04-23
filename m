From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] setjmp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 23 Apr 2015 12:51:46 +0800
Message-ID: <1429764710-8598-6-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.
markings of functions in glibc are:
- setjmp:    MT-Safe
- sigsetjmp: MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/setjmp.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/setjmp.3 b/man3/setjmp.3
index 8aacc54..4decbd5 100644
--- a/man3/setjmp.3
+++ b/man3/setjmp.3
@@ -85,6 +85,20 @@ nonzero when returning from
 or
 .BR siglongjmp (3)
 using the saved context.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw21 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR setjmp (),
+.BR sigsetjmp ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C89, C99, and POSIX.1-2001 specify
 .BR setjmp ().
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
