From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] dysize.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 25 Sep 2013 10:19:36 +0800
Message-ID: <1380075576-28213-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function dysize() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/dysize.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/dysize.3 b/man3/dysize.3
index c9d1e1c..882e1c2 100644
--- a/man3/dysize.3
+++ b/man3/dysize.3
@@ -23,7 +23,7 @@
 .\" %%%LICENSE_END
 .\"
 .\" aeb: some corrections
-.TH DYSIZE 3 2010-09-22 "GNU" "Linux Programmer's Manual"
+.TH DYSIZE 3 2013-09-25 "GNU" "Linux Programmer's Manual"
 .SH NAME
 dysize \- get number of days for a given year
 .SH SYNOPSIS
@@ -48,6 +48,11 @@ The formula is defined in the macro
 .I __isleap(year)
 also found in
 .IR <time.h> .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR dysize ()
+function is thread-safe.
 .SH CONFORMING TO
 This function occurs in SunOS 4.x.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
