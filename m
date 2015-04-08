From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] asprintf.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 8 Apr 2015 10:56:12 +0800
Message-ID: <1428461788-7518-2-git-send-email-zenglg.jy@cn.fujitsu.com>
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

asprintf:  MT-Safe locale
vasprintf: MT-Safe locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/asprintf.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/asprintf.3 b/man3/asprintf.3
index f8f9a9b..981126c 100644
--- a/man3/asprintf.3
+++ b/man3/asprintf.3
@@ -58,6 +58,20 @@ If memory allocation wasn't possible, or some other error occurs,
 these functions will return \-1, and the contents of
 .I strp
 is undefined.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw23 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR asprintf (),
+.BR vasprintf ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 These functions are GNU extensions, not in C or POSIX.
 They are also available under *BSD.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
