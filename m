From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getline(3) was added to POSIX 2008
Date: Wed,  4 Nov 2009 16:40:30 -0500
Message-ID: <1257370830-12899-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/getline.3 |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/man3/getline.3 b/man3/getline.3
index 2687809..622b5c8 100644
--- a/man3/getline.3
+++ b/man3/getline.3
@@ -26,7 +26,6 @@
 getline, getdelim \- delimited string input
 .SH SYNOPSIS
 .nf
-.B #define _GNU_SOURCE
 .B #include <stdio.h>
 .sp
 .BI "ssize_t getline(char **" lineptr ", size_t *" n ", FILE *" stream );
@@ -113,11 +112,10 @@ Both
 .BR getline ()
 and
 .BR getdelim ()
-are GNU extensions.
+were added in POSIX.1-2008.
 They are available since libc 4.6.27.
 .SH "EXAMPLE"
 .nf
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 
-- 
1.6.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
