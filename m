From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sem_unlink.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 17 Feb 2014 13:13:30 +0800
Message-ID: <1392614010-22707-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function sem_unlink() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sem_unlink.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/sem_unlink.3 b/man3/sem_unlink.3
index e7c35d5..03274d3 100644
--- a/man3/sem_unlink.3
+++ b/man3/sem_unlink.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH SEM_UNLINK 3 2012-05-13 "Linux" "Linux Programmer's Manual"
+.TH SEM_UNLINK 3 2014-02-17 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sem_unlink \- remove a named semaphore
 .SH SYNOPSIS
@@ -59,6 +59,11 @@ was too long.
 .B ENOENT
 There is no semaphore with the given
 .IR name .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sem_unlink ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
