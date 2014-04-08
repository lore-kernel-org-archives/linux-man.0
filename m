From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getutmp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 8 Apr 2014 13:57:59 +0800
Message-ID: <1396936679-3146-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions getutmp() and getutmpx() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getutmp.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/getutmp.3 b/man3/getutmp.3
index 4c5e366..35f2124 100644
--- a/man3/getutmp.3
+++ b/man3/getutmp.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH GETUTMP 3 2014-03-09 "Linux" "Linux Programmer's Manual"
+.TH GETUTMP 3 2014-04-08 "Linux" "Linux Programmer's Manual"
 .SH NAME
 getutmp, getutmpx \- copy utmp structure to utmpx, and vice versa
 .SH SYNOPSIS
@@ -52,6 +52,13 @@ function performs the converse operation.
 These functions do not return a value.
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getutmp ()
+and
+.BR getutmpx ()
+functions are thread-safe.
 .SH CONFORMING TO
 These functions are nonstandard, but appear on a few other systems,
 such as Solaris and NetBSD.
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
