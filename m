From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] scandir.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 8 Apr 2015 10:56:22 +0800
Message-ID: <1428461788-7518-12-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1428461788-7518-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428461788-7518-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

scandir:     MT-Safe
scandirat:   MT-Safe

alphasort:   MT-Safe locale
versionsort: MT-Safe locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/scandir.3 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/man3/scandir.3 b/man3/scandir.3
index 6322c2e..640a275 100644
--- a/man3/scandir.3
+++ b/man3/scandir.3
@@ -226,6 +226,24 @@ was added to glibc in version 2.1.
 
 .BR scandirat ()
 was added to glibc in version 2.15.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw26 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR scandir (),
+.BR scandirat ()
+T}	Thread safety	MT-Safe
+T{
+.BR alphasort (),
+.BR versionsort ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 .BR alphasort (),
 .BR scandir ():
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
