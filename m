From: Carlo Marcelo Arenas Belon <carenas-kLeDWSohozoJb6fo7hG9ng@public.gmane.org>
Subject: [PATCH] strptime.3: add #define to example to avoid implicit declaration of strptime
Date: Sat, 5 Jan 2008 21:04:15 -0600
Message-ID: <20080106030415.GA32688@tapir>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The example doesn't follow the guidelines given in the description and will
result in the following warning if compiled :

  In function 'main':
  13: warning: implicit declaration of function 'strptime'

Carlo
---
diff -urp man-pages-2.74/man3/strptime.3 man-pages-2.74/man3/strptime.3
--- man-pages-2.74/man3/strptime.3	2007-12-20 04:13:45.000000000 -0800
+++ man-pages-2.74/man3/strptime.3	2008-01-05 18:46:04.000000000 -0800
@@ -384,6 +384,7 @@ and
 .BR strftime (3).
 .sp
 .nf
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <time.h>
-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
