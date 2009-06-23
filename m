From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] setjmp(3): fix typo and clarify return
Date: Tue, 23 Jun 2009 12:50:03 -0400
Message-ID: <1245775803-1692-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The word "signal" was duplicated in the NOTES, and the RETURN section
refers to setjmp and sigsetjmp, but only longjmp.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/setjmp.3 |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/man3/setjmp.3 b/man3/setjmp.3
index 5dae1ab..2368242 100644
--- a/man3/setjmp.3
+++ b/man3/setjmp.3
@@ -75,6 +75,8 @@ and
 return 0 if returning directly, and
 non-zero when returning from
 .BR longjmp (3)
+or
+.BR siglongjmp (3)
 using the saved context.
 .SH "CONFORMING TO"
 C89, C99, and POSIX.1-2001 specify
@@ -84,7 +86,7 @@ POSIX.1-2001 specifies
 .SH NOTES
 POSIX does not specify whether
 .BR setjmp ()
-will save the signal signal mask.
+will save the signal mask.
 In System V it will not.
 In 4.3BSD it will, and there
 is a function \fB_setjmp\fP that will not.
-- 
1.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
