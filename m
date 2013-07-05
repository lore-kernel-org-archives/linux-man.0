From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] dirfd.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 5 Jul 2013 16:53:51 +0800
Message-ID: <1373014431-8337-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function dirfd() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/dirfd.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/dirfd.3 b/man3/dirfd.3
index ddc0aef..d090506 100644
--- a/man3/dirfd.3
+++ b/man3/dirfd.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH DIRFD 3 2013-04-19 "Linux" "Linux Programmer's Manual"
+.TH DIRFD 3 2013-07-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 dirfd \- get directory stream file descriptor
 .SH SYNOPSIS
@@ -84,6 +84,11 @@ does not refer to a valid directory stream.
 .B ENOTSUP
 The implementation does not support the association of a file
 descriptor with a directory.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR dirfd ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2008.
 This function was a BSD extension, present in 4.3BSD-Reno, not in 4.2BSD.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
