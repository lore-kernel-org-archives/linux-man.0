From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strsep.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 25 Feb 2014 14:59:59 +0800
Message-ID: <1393311599-4668-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function strsep() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strsep.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/strsep.3 b/man3/strsep.3
index d08c437..f469ebf 100644
--- a/man3/strsep.3
+++ b/man3/strsep.3
@@ -30,7 +30,7 @@
 .\" Modified Mon Jan 20 12:04:18 1997 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
 .\" Modified Tue Jan 23 20:23:07 2001 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
 .\"
-.TH STRSEP 3  2014-01-04 "GNU" "Linux Programmer's Manual"
+.TH STRSEP 3  2014-02-25 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strsep \- extract token from string
 .SH SYNOPSIS
@@ -76,6 +76,11 @@ The
 function returns a pointer to the token,
 that is, it returns the original value of
 .IR *stringp .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strsep ()
+function is thread-safe.
 .SH CONFORMING TO
 4.4BSD.
 .SH NOTES
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
