From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] realpath.3: use past tense with ancient history
Date: Mon,  6 Aug 2012 12:58:53 -0700
Message-ID: <1344283133-29884-1-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/realpath.3 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/realpath.3 b/man3/realpath.3
index 1b90a34..615548c 100644
--- a/man3/realpath.3
+++ b/man3/realpath.3
@@ -205,11 +205,11 @@ The
 feature, not standardized in POSIX.1-2001,
 but standardized in POSIX.1-2008, allows this design problem to be avoided.
 .LP
-The libc4 and libc5 implementation contains a buffer overflow
+The libc4 and libc5 implementation contained a buffer overflow
 (fixed in libc-5.4.13).
 Thus, set-user-ID programs like
 .BR mount (8)
-need a private version.
+needed a private version.
 .SH "SEE ALSO"
 .BR readlink (2),
 .BR canonicalize_file_name (3),
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
