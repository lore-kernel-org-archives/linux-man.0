From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] scandir.3: ATTRIBUTES: Note functions those are thread-safe
Date: Mon, 23 Mar 2015 12:24:14 +0800
Message-ID: <1427084656-7273-4-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1427084656-7273-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427084656-7273-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/scandir.3 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/man3/scandir.3 b/man3/scandir.3
index 6322c2e..1c6ec1c 100644
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
+lb lb lb
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
