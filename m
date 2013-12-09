From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] unlockpt.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 9 Dec 2013 11:14:59 +0800
Message-ID: <1386558899-28069-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function unlockpt() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/unlockpt.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/unlockpt.3 b/man3/unlockpt.3
index c6759b4..b43bc0e 100644
--- a/man3/unlockpt.3
+++ b/man3/unlockpt.3
@@ -2,7 +2,7 @@
 .\" This page is in the public domain. - aeb
 .\" %%%LICENSE_END
 .\"
-.TH UNLOCKPT 3 2008-06-14 "" "Linux Programmer's Manual"
+.TH UNLOCKPT 3 2013-12-09 "" "Linux Programmer's Manual"
 .SH NAME
 unlockpt \- unlock a pseudoterminal master/slave pair
 .SH SYNOPSIS
@@ -43,6 +43,11 @@ argument is not associated with a master pseudoterminal.
 .SH VERSIONS
 .BR unlockpt ()
 is provided in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR unlockpt ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
