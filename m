From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getauxval.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 8 Apr 2014 15:15:55 +0800
Message-ID: <1396941355-7580-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getauxval() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getauxval.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/getauxval.3 b/man3/getauxval.3
index efcb28f..bbb1e55 100755
--- a/man3/getauxval.3
+++ b/man3/getauxval.3
@@ -26,7 +26,7 @@
 .\"
 .\" FIXME glibc 2.18 added AT_HWCAP2
 .\"
-.TH GETAUXVAL 3  2014-01-11 "GNU" "Linux Programmer's Manual"
+.TH GETAUXVAL 3  2014-04-08 "GNU" "Linux Programmer's Manual"
 .SH NAME
 getauxval \- retrieve a value from the auxiliary vector
 .SH SYNOPSIS
@@ -184,6 +184,11 @@ No errors are diagnosed.
 The
 .BR getauxval ()
 function was added to glibc in version 2.16.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getauxval ()
+function is thread-safe.
 .SH CONFORMING TO
 This function is a nonstandard glibc extension.
 .SH NOTES
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
