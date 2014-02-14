From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sem_post.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 14 Feb 2014 13:18:23 +0800
Message-ID: <1392355103-3611-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function sem_post() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sem_post.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/sem_post.3 b/man3/sem_post.3
index f8251f0..48ec1c7 100644
--- a/man3/sem_post.3
+++ b/man3/sem_post.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH SEM_POST 3 2012-05-13 "Linux" "Linux Programmer's Manual"
+.TH SEM_POST 3 2014-02-14 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sem_post \- unlock a semaphore
 .SH SYNOPSIS
@@ -58,6 +58,11 @@ is not a valid semaphore.
 .B EOVERFLOW
 .\" Added in POSIX.1-2008 TC1 (Austin Interpretation 213)
 The maximum allowable value for a semaphore would be exceeded.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sem_post ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
