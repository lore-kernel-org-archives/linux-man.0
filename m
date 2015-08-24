From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sigpause.3: srcfix: add FIXME
Date: Mon, 24 Aug 2015 18:19:55 +0800
Message-ID: <1440411596-2566-6-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sigpause.3 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man3/sigpause.3 b/man3/sigpause.3
index 847bd10..dbc10de 100644
--- a/man3/sigpause.3
+++ b/man3/sigpause.3
@@ -63,6 +63,12 @@ l l l.
 Interface	Attribute	Value
 T{
 .BR sigpause ()
+.\" FIXME: the following marking is different from which in glibc manual,
+.\" marking in glibc manual is more detailed.
+.\" sigpause: MT-Unsafe race:sigprocmask/!bsd!linux
+.\" glibc manual says /!linux!bsd indicate the preceding marker only applies
+./" when the underlying kernel is neither Linux nor a BSD kernel.
+.\" So, it is safety in Linux kernel.
 T}	Thread safety	MT-Safe
 .TE
 .SH CONFORMING TO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
