From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] xcrypt.3 ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 27 May 2015 18:13:04 +0800
Message-ID: <1432721584-11342-10-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think passwd2des(), xencrypt() and xdecrypt() are
thread-safe. But, there are not markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/xcrypt.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/xcrypt.3 b/man3/xcrypt.3
index 748bc88..0b9b419 100644
--- a/man3/xcrypt.3
+++ b/man3/xcrypt.3
@@ -66,6 +66,21 @@ and
 return 1 on success and 0 on error.
 .SH VERSIONS
 These functions are available in glibc since version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw12 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR passwd2des (),
+.BR xencrypt (),
+.BR xdecrypt ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH BUGS
 The prototypes are missing from the abovementioned include file.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
