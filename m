From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] setenv.3:ATTRIBUTES: Note functions that are thread-unsafe
Date: Wed, 31 Dec 2014 13:22:35 +0800
Message-ID: <1420003355-4184-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function setenv() and unsetenv() are thread unsafe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/setenv.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/setenv.3 b/man3/setenv.3
index 6683d59..e28bf0d 100644
--- a/man3/setenv.3
+++ b/man3/setenv.3
@@ -125,6 +125,19 @@ or contains an \(aq=\(aq character.
 .TP
 .B ENOMEM
 Insufficient memory to add a new variable to the environment.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR setenv (),
+.BR unsetenv ()
+T}	Thread safety	MT-Unsafe const:env
+.TE
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
