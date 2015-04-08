From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] printf.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 8 Apr 2015 10:56:21 +0800
Message-ID: <1428461788-7518-11-git-send-email-zenglg.jy@cn.fujitsu.com>
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

printf:    MT-Safe locale
fprintf:   MT-Safe locale
sprintf:   MT-Safe locale
snprintf:  MT-Safe locale
vprintf:   MT-Safe locale
vfprintf:  MT-Safe locale
vsprintf:  MT-Safe locale
vsnprintf: MT-Safe locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/printf.3 | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/man3/printf.3 b/man3/printf.3
index db60850..8c95f96 100644
--- a/man3/printf.3
+++ b/man3/printf.3
@@ -822,6 +822,29 @@ A \(aq%\(aq is written.
 No argument is converted.
 The complete conversion
 specification is \(aq%%\(aq.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw23 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR printf (),
+.BR fprintf (),
+.br
+.BR sprintf (),
+.BR snprintf (),
+.br
+.BR vprintf (),
+.BR vfprintf (),
+.br
+.BR vsprintf (),
+.BR vsnprintf ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 The
 .BR fprintf (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
