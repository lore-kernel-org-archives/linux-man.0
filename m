From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_attr_init.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 20 May 2015 18:00:05 +0800
Message-ID: <1432116011-10181-4-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432116011-10181-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432116011-10181-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think pthread_attr_init() and pthread_attr_destroy()
are thread-safe. But, there are not markings of pthread_attr_init()
and pthread_attr_destroy() in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_attr_init.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/pthread_attr_init.3 b/man3/pthread_attr_init.3
index 3875519..21745c0 100644
--- a/man3/pthread_attr_init.3
+++ b/man3/pthread_attr_init.3
@@ -76,6 +76,20 @@ error for
 on Linux these functions always succeed
 (but portable and future-proof applications should nevertheless
 handle a possible error return).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw22 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR pthread_attr_init (),
+.BR pthread_attr_destroy ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
