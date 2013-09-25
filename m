From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] euidaccess.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 25 Sep 2013 11:36:45 +0800
Message-ID: <1380080205-31571-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions euidaccess() and eaccess() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/euidaccess.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/euidaccess.3 b/man3/euidaccess.3
index e86d798..ca25ed1 100644
--- a/man3/euidaccess.3
+++ b/man3/euidaccess.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH EUIDACCESS 3 2010-11-01 "" "Linux Programmer's Manual"
+.TH EUIDACCESS 3 2013-09-25 "" "Linux Programmer's Manual"
 .SH NAME
 euidaccess, eaccess \- check effective user's permissions for a file
 .SH SYNOPSIS
@@ -70,6 +70,13 @@ As for
 The
 .BR eaccess ()
 function was added to glibc in version 2.4.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR euidaccess ()
+and
+.BR eaccess ()
+functions are thread-safe.
 .SH CONFORMING TO
 These functions are nonstandard.
 Some other systems have an
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
