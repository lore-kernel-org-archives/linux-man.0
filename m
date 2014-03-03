From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sem_getvalue.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 3 Mar 2014 10:43:05 +0800
Message-ID: <1393814585-20207-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function sem_getvalue() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sem_getvalue.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/sem_getvalue.3 b/man3/sem_getvalue.3
index 5353b59..74100c4 100644
--- a/man3/sem_getvalue.3
+++ b/man3/sem_getvalue.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH SEM_GETVALUE 3 2012-05-13 "Linux" "Linux Programmer's Manual"
+.TH SEM_GETVALUE 3 2014-03-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sem_getvalue \- get the value of a semaphore
 .SH SYNOPSIS
@@ -62,6 +62,11 @@ is set to indicate the error.
 .B EINVAL
 .I sem
 is not a valid semaphore.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sem_getvalue ()
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
