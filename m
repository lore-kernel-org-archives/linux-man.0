From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH 2/3] strcmp.3: Reference strstr(3)
Date: Mon, 25 May 2009 21:29:03 +0000 (UTC)
Message-ID: <1835422551-6657-2-git-send-email-mark@pogo.org.uk>
References: <1835422551-6657-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Date: Tue, 29 Feb 2028 07:35:50 +0000
In-Reply-To: <1835422551-6657-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man3/strcmp.3 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/man3/strcmp.3 b/man3/strcmp.3
index 4797e71..62d9cc6 100644
--- a/man3/strcmp.3
+++ b/man3/strcmp.3
@@ -27,7 +27,7 @@
 .\" Modified Sat Jul 24 18:08:52 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2001-08-31, aeb
 .\"
-.TH STRCMP 3  2009-04-21 "" "Linux Programmer's Manual"
+.TH STRCMP 3  2009-05-09 "" "Linux Programmer's Manual"
 .SH NAME
 strcmp, strncmp \- compare two strings
 .SH SYNOPSIS
@@ -68,6 +68,7 @@ SVr4, 4.3BSD, C89, C99.
 .BR strcasecmp (3),
 .BR strcoll (3),
 .BR strncasecmp (3),
+.BR strstr (3),
 .BR strverscmp (3),
 .BR wcscmp (3),
 .BR wcsncmp (3)
-- 
1.6.2.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
