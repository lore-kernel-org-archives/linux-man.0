From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] dl_iterate_phdr.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 3 Jun 2015 18:16:25 +0800
Message-ID: <1433326594-25001-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think dl_iterate_phdr() is thread-safe. But, there
is not marking of dl_iterate_phdr() in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/dl_iterate_phdr.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/dl_iterate_phdr.3 b/man3/dl_iterate_phdr.3
index be06d1f..d83ca35 100644
--- a/man3/dl_iterate_phdr.3
+++ b/man3/dl_iterate_phdr.3
@@ -154,6 +154,19 @@ function returns whatever value was returned by the last call to
 .SH VERSIONS
 .BR dl_iterate_phdr ()
 has been supported in glibc since version 2.2.4.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR dl_iterate_phdr ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 The
 .BR dl_iterate_phdr ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
