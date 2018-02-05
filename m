From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ld.so(8): make lack of separator escaping explicit
Date: Mon,  5 Feb 2018 11:13:57 -0500
Message-ID: <20180205161357.8131-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Make it clear that the delimiters in LD_LIBRARY_PATH cannot be escaped
so people don't try various methods (like \:) to workaround it.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man8/ld.so.8 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 64e1fb2afdc3..fb568ef8721a 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -271,7 +271,8 @@ This is useful when using a debugger.
 .B LD_LIBRARY_PATH
 A list of directories in which to search for
 ELF libraries at execution time.
-The items in the list are separated by either colons or semicolons.
+The items in the list are separated by either colons or semicolons,
+and there is no support for escaping either separator.
 Similar to the
 .B PATH
 environment variable.
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
