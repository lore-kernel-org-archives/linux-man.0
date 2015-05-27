From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getnetent_r.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 27 May 2015 18:12:56 +0800
Message-ID: <1432721584-11342-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think getnetent_r(), getnetbyname_r() and
getnetbyaddr_r() are thread-safe. But, there are not markings
of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getnetent_r.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/getnetent_r.3 b/man3/getnetent_r.3
index 8f4c49f..d054fa3 100644
--- a/man3/getnetent_r.3
+++ b/man3/getnetent_r.3
@@ -138,6 +138,21 @@ is too small.
 Try again with a larger buffer
 (and increased
 .IR buflen ).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw17 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getnetent_r (),
+.BR getnetbyname_r (),
+.BR getnetbyaddr_r ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 These functions are GNU extensions.
 Functions with similar names exist on some other systems,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
