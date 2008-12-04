From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] man3/fopencookie.3: Add missing _GNU_SOURCE requirement
Date: Fri, 5 Dec 2008 00:22:40 +0100
Message-ID: <20081204232240.GH10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/fopencookie.3 b/man3/fopencookie.3
index a69db65..5aadf04 100644
--- a/man3/fopencookie.3
+++ b/man3/fopencookie.3
@@ -26,6 +26,7 @@
 fopencookie \- opening a custom stream
 .SH SYNOPSIS
 .nf
+.B #define _GNU_SOURCE
 .B #include <stdio.h>
 
 .BI "FILE *fopencookie(void *" cookie ", const char *" mode ,
@@ -432,6 +433,7 @@ main(int argc, char *argv[])
 .fi
 .SH SEE ALSO
 .BR fclose (3),
+.BR feature_test_macros (7),
 .BR fmemopen (3),
 .BR fopen (3),
 .BR fseek (3)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
