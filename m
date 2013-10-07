From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] adjtime.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 7 Oct 2013 15:42:09 +0800
Message-ID: <1381131729-6098-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function adjtime() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/adjtime.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/adjtime.3 b/man3/adjtime.3
index df3a178..b327c13 100644
--- a/man3/adjtime.3
+++ b/man3/adjtime.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH ADJTIME 3 2008-06-22 "Linux" "Linux Programmer's Manual"
+.TH ADJTIME 3 2013-10-07 "Linux" "Linux Programmer's Manual"
 .SH NAME
 adjtime \- correct the time to synchronize the system clock
 .SH SYNOPSIS
@@ -99,6 +99,11 @@ The caller does not have sufficient privilege to adjust the time.
 Under Linux the
 .B CAP_SYS_TIME
 capability is required.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR adjtime ()
+function is thread-safe.
 .SH CONFORMING TO
 4.3BSD, System V.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
