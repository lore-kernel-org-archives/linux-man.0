From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] posix_memalign.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Thu, 16 Apr 2015 13:09:35 +0800
Message-ID: <1429160978-15236-4-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429160978-15236-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429160978-15236-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

posix_memalign: MT-Safe
aligned_alloc:  MT-Safe
memalign:       MT-Safe

valloc:         MT-Unsafe init
pvalloc:        MT-Unsafe init

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/posix_memalign.3 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/man3/posix_memalign.3 b/man3/posix_memalign.3
index 48dc770..f7b919d 100644
--- a/man3/posix_memalign.3
+++ b/man3/posix_memalign.3
@@ -179,6 +179,28 @@ was added to glibc in version 2.16.
 The function
 .BR posix_memalign ()
 is available since glibc 2.1.91.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR aligned_alloc (),
+.br
+.BR memalign (),
+.br
+.BR posix_memalign ()
+T}	Thread safety	MT-Safe
+T{
+.BR valloc (),
+.br
+.BR pvalloc ()
+T}	Thread safety	MT-Unsafe init
+.TE
+
 .SH CONFORMING TO
 The function
 .BR valloc ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
