From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tcgetsid.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 13 Jan 2014 11:39:13 +0800
Message-ID: <1389584353-9768-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function tcgetsid() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tcgetsid.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/tcgetsid.3 b/man3/tcgetsid.3
index 5a3cecd..8dbc04b 100644
--- a/man3/tcgetsid.3
+++ b/man3/tcgetsid.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH TCGETSID 3 2010-09-10 "GNU" "Linux Programmer's Manual"
+.TH TCGETSID 3 2014-01-13 "GNU" "Linux Programmer's Manual"
 .SH NAME
 tcgetsid \- get session ID
 .SH SYNOPSIS
@@ -62,6 +62,11 @@ it has one but it is not described by
 .SH VERSIONS
 .BR tcgetsid ()
 is provided in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR tcgetsid ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
