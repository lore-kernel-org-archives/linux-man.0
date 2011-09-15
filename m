From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ttyslot.3: Add description of the function is not thread-safe
Date: Thu, 15 Sep 2011 17:41:10 +0800
Message-ID: <4E71C836.90002@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The function calls thread-unsafe function, so it is not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ttyslot.3 |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/man3/ttyslot.3 b/man3/ttyslot.3
index 516366d..5fa8c25 100644
--- a/man3/ttyslot.3
+++ b/man3/ttyslot.3
@@ -23,7 +23,7 @@
 .\" This replaces an earlier man page written by Walter Harms
 .\" <walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org>.
 .\"
-.TH TTYSLOT 3 2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH TTYSLOT 3 2011-09-15 "GNU" "Linux Programmer's Manual"
 .SH NAME
 ttyslot \- find the slot of the current user's terminal in some file
 .SH SYNOPSIS
@@ -118,6 +118,13 @@ On error (e.g., if none of the file descriptors 0, 1 or 2 is
 associated with a terminal that occurs in this data base)
 it returns 0 on UNIX V6 and V7 and BSD-like systems,
 but \-1 on System V-like systems.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ttyslot ()
+calls thread-unsafe function
+.BR getttyent (),
+so it is not thread-safe.
 .SH "CONFORMING TO"
 SUSv1; marked as LEGACY in SUSv2; removed in POSIX.1-2001.
 SUSv2 requires \-1 on error.
-- 
1.7.1

-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
