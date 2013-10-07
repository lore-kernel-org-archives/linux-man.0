From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] alloca.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 7 Oct 2013 16:58:15 +0800
Message-ID: <1381136295-9622-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function alloca() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/alloca.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/alloca.3 b/man3/alloca.3
index 0d593ed..7d11c63 100644
--- a/man3/alloca.3
+++ b/man3/alloca.3
@@ -40,7 +40,7 @@
 .\"     Various rewrites and additions (notes on longjmp() and SIGSEGV).
 .\"     Weaken warning against use of alloca() (as per Debian bug 461100).
 .\"
-.TH ALLOCA 3 2013-05-12 "GNU" "Linux Programmer's Manual"
+.TH ALLOCA 3 2013-10-07 "GNU" "Linux Programmer's Manual"
 .SH NAME
 alloca \- allocate memory that is automatically freed
 .SH SYNOPSIS
@@ -62,6 +62,11 @@ The
 .BR alloca ()
 function returns a pointer to the beginning of the allocated space.
 If the allocation causes stack overflow, program behavior is undefined.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR alloca ()
+function is thread-safe.
 .SH CONFORMING TO
 This function is not in POSIX.1-2001.
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
