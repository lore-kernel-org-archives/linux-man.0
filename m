From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] strerror.3: indicate reasonable buffer size
Date: Tue, 31 Jan 2017 19:53:58 +0100
Message-ID: <1485888838-4055-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Add a hint which buffer size is needed for
strerror_r() and strerror_l().

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man3/strerror.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/strerror.3 b/man3/strerror.3
index ec758fb..511a4a3 100644
--- a/man3/strerror.3
+++ b/man3/strerror.3
@@ -256,6 +256,15 @@ to
 .B EINVAL
 if the error number is unknown.
 C99 and POSIX.1-2008 require the return value to be non-NULL.
+.SH NOTES
+The GNU C Library, version 2.25 uses a buffer of 1024 characters for
+.BR strerror ().
+This buffer size therefore should be suffcient to avoid an
+.B ERANGE
+error in
+.BR strerror_r ()
+and
+.BR strerror_l ().
 .SH SEE ALSO
 .BR err (3),
 .BR errno (3),
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
