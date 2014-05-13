From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_yield.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 13 May 2014 09:31:57 +0800
Message-ID: <1399944717-19970-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function pthread_yield() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_yield.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_yield.3 b/man3/pthread_yield.3
index 894206b..ef8f171 100644
--- a/man3/pthread_yield.3
+++ b/man3/pthread_yield.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_YIELD 3 2013-03-05 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_YIELD 3 2014-05-13 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_yield \- yield the processor
 .SH SYNOPSIS
@@ -50,6 +50,11 @@ on error, it returns an error number.
 On Linux, this call always succeeds
 (but portable and future-proof applications should nevertheless
 handle a possible error return).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_yield ()
+function is thread-safe.
 .SH CONFORMING TO
 This call is nonstandard, but present on several other systems.
 Use the standardized
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
