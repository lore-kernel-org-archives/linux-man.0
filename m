From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcpcpy.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 10 Dec 2013 18:15:03 +0800
Message-ID: <1386670503-5704-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcpcpy() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcpcpy.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wcpcpy.3 b/man3/wcpcpy.3
index e0eba54..3d437e9 100644
--- a/man3/wcpcpy.3
+++ b/man3/wcpcpy.3
@@ -12,7 +12,7 @@
 .\"   Dinkumware C library reference http://www.dinkumware.com/
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"
-.TH WCPCPY 3  2011-10-01 "GNU" "Linux Programmer's Manual"
+.TH WCPCPY 3  2013-12-10 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcpcpy \- copy a wide-character string, returning a pointer to its end
 .SH SYNOPSIS
@@ -64,6 +64,11 @@ wide characters at
 returns a pointer to the end of the wide-character string
 .IR dest ,
 that is, a pointer to the terminating null wide character.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcpcpy ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2008.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
