From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcrtomb.3: ATTRIBUTES: Note function that isn't thread-safe
Date: Wed, 8 Apr 2015 10:56:25 +0800
Message-ID: <1428461788-7518-15-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1428461788-7518-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428461788-7518-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.

wcrtomb: MT-Unsafe race:wcrtomb/!ps

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcrtomb.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/wcrtomb.3 b/man3/wcrtomb.3
index 059e724..98bbba5 100644
--- a/man3/wcrtomb.3
+++ b/man3/wcrtomb.3
@@ -106,6 +106,19 @@ is returned, and
 .I errno
 set to
 .BR EILSEQ .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw26
+l l l.
+Interface	Attribute	Value
+T{
+.BR wcrtomb ()
+T}	Thread safety	MT-Unsafe race:wcrtomb/!ps
+.TE
+
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
