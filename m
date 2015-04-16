From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] openpty.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Thu, 16 Apr 2015 13:09:34 +0800
Message-ID: <1429160978-15236-3-git-send-email-zenglg.jy@cn.fujitsu.com>
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

openpty:   MT-Safe locale
forkpty:   MT-Safe locale

login_tty: MT-Unsafe race:ttyname

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/openpty.3 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/man3/openpty.3 b/man3/openpty.3
index a17ac08..81d73e8 100644
--- a/man3/openpty.3
+++ b/man3/openpty.3
@@ -147,6 +147,23 @@ will fail if either
 or
 .BR fork (2)
 fails.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw20 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR forkpty (),
+.BR openpty ()
+T}	Thread safety	MT-Safe locale
+T{
+.BR login_tty ()
+T}	Thread safety	MT-Unsafe race:ttyname
+.TE
+
 .SH CONFORMING TO
 These are BSD functions, present in glibc.
 They are not standardized in POSIX.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
