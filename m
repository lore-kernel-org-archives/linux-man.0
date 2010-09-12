From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH] rand.3: Clarify the lowest and highest return values
Date: Sun, 12 Sep 2010 14:30:08 +0100
Message-ID: <1284298208-3861-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Commit 7155eb9 gives the range of return values, but the definition
of 'range' is unclear. Indicate clearly that RAND_MAX is included in
the set of possible return values.

Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
---
 man3/rand.3 |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/rand.3 b/man3/rand.3
index e65e69e..d1e14d8 100644
--- a/man3/rand.3
+++ b/man3/rand.3
@@ -35,7 +35,7 @@
 .\"          with contribution from Francesco Potorti <F.Potorti-Z3/l7hFotWqRIi+8W+d3eg@public.gmane.org>
 .\" Modified 2003-11-15, aeb, added rand_r
 .\"
-.TH RAND 3 2008-08-29 "" "Linux Programmer's Manual"
+.TH RAND 3 2010-09-12 "" "Linux Programmer's Manual"
 .SH NAME
 rand, rand_r, srand \- pseudo-random number generator
 .SH SYNOPSIS
@@ -59,8 +59,8 @@ _POSIX_C_SOURCE\ >=\ 1 || _XOPEN_SOURCE || _POSIX_SOURCE
 .SH DESCRIPTION
 The
 .BR rand ()
-function returns a pseudo-random integer in
-the range [0,\ \fBRAND_MAX\fR].
+function returns a pseudo-random integer between 0
+and \fBRAND_MAX\fR (inclusive).
 .PP
 The
 .BR srand ()
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
