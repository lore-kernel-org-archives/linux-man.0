From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcsnrtombs.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Wed, 25 Mar 2015 16:14:32 +0800
Message-ID: <1427271273-8602-7-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1427271273-8602-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427271273-8602-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcsnrtombs.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/wcsnrtombs.3 b/man3/wcsnrtombs.3
index a02c603..ab69767 100644
--- a/man3/wcsnrtombs.3
+++ b/man3/wcsnrtombs.3
@@ -157,6 +157,19 @@ is returned, and
 .I errno
 set to
 .BR EILSEQ .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw29
+l l l.
+Interface	Attribute	Value
+T{
+.BR wcsnrtombs ()
+T}	Thread safety	MT-Unsafe race:wcsnrtombs/!ps
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2008.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
