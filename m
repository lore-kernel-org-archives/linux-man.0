From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] gsignal.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 18 Jun 2015 13:36:51 +0800
Message-ID: <1434605811-18306-4-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1434605811-18306-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434605811-18306-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.
markings of functions in glibc are:
- gsignal: MT-Safe
- ssignal: MT-Safe sigintr

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/gsignal.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/gsignal.3 b/man3/gsignal.3
index ff2f582..71bb697 100644
--- a/man3/gsignal.3
+++ b/man3/gsignal.3
@@ -92,6 +92,22 @@ and returns the value returned by that function.
 The range of possible values
 .I signum
 varies (often 1-15 or 1-17).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR gsignal ()
+T}	Thread safety	MT-Safe
+T{
+.BR ssignal ()
+T}	Thread safety	MT-Safe sigintr
+.TE
+
 .SH CONFORMING TO
 These functions are available under AIX, DG/UX, HP-UX, SCO, Solaris, Tru64.
 They are called obsolete under most of these systems, and are
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
