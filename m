From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] putgrent.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 27 May 2015 18:13:03 +0800
Message-ID: <1432721584-11342-9-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think putgrent() is thread-safe. But, there
is not marking of putgrent() in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/putgrent.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/putgrent.3 b/man3/putgrent.3
index 4688c3a..de379ac 100644
--- a/man3/putgrent.3
+++ b/man3/putgrent.3
@@ -40,6 +40,19 @@ struct group {
 .in
 .SH RETURN VALUE
 The function returns zero on success, and a nonzero value on error.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR putgrent ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 This function is a GNU extension.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
