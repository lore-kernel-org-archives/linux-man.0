From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] rpmatch.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 3 Jun 2015 18:16:33 +0800
Message-ID: <1433326594-25001-9-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1433326594-25001-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433326594-25001-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- rpmatch: MT-Safe locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/rpmatch.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/rpmatch.3 b/man3/rpmatch.3
index 702c591..0abfea6 100644
--- a/man3/rpmatch.3
+++ b/man3/rpmatch.3
@@ -96,6 +96,19 @@ or anywhere else, but indicates a
 failure of the regex engine (but this case is indistinguishable from
 that of an unrecognized value of
 .IR response ).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR rpmatch ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 .BR rpmatch ()
 is not required by any standard, but
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
