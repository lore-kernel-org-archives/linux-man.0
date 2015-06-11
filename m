From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] profil.3: ATTRIBUTES: Note function that is not thread-safe
Date: Thu, 11 Jun 2015 10:04:27 +0800
Message-ID: <1433988270-8599-7-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1433988270-8599-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433988270-8599-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think profil() is not thread-safe. But,
there is not marking of profil() in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/profil.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/profil.3 b/man3/profil.3
index 437ee28..e087e7a 100644
--- a/man3/profil.3
+++ b/man3/profil.3
@@ -67,6 +67,19 @@ If
 is NULL, profiling is disabled.
 .SH RETURN VALUE
 Zero is always returned.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR profil ()
+T}	Thread safety	MT-Unsafe
+.TE
+
 .SH CONFORMING TO
 Similar to a call in SVr4 (but not POSIX.1-2001).
 .SH BUGS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
