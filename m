From: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] strerror.3: Fix return value of strerror_r()
Date: Wed,  2 Nov 2011 21:27:06 +0100
Message-ID: <1320265627-4467-1-git-send-email-bernhard@bwalle.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The XSI-compliant version of strerror_r() doesn't return -1 on error and
set errno. Instead, a positive error number is returned. That's what
POSIX says:

    Upon successful completion, strerror_r() shall return 0. Otherwise,
    an error number shall be returned to indicate the error.

I tested with an invalid error number. While some implementations seem
to write "Unknown error xxx" into the supplied buffer, some others don't
and only return EINVAL. The latest glibc 2.14.1 from Arch Linux belongs
to the first category while eglibc 2.13 from current Debian testing
belongs to the second category.

However, both implementation are correct according to POSIX. So I think
the manpage was wrong and POSIX and the implementation are correct.

Signed-off-by: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
---
 man3/strerror.3 |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/man3/strerror.3 b/man3/strerror.3
index 23c5a21..d17fba2 100644
--- a/man3/strerror.3
+++ b/man3/strerror.3
@@ -133,9 +133,7 @@ or an "Unknown error nnn" message if the error number is unknown.
 The XSI-compliant
 .BR strerror_r ()
 function returns 0 on success;
-on error, \-1 is returned and
-.I errno
-is set to indicate the error.
+on error, a (positive) error number is returned.
 .SH ERRORS
 .TP
 .B EINVAL
-- 
1.7.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
