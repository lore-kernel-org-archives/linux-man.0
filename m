From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] license headers: consistent format
Date: Sun, 31 Mar 2013 16:05:31 +0200
Message-ID: <1364738731-28081-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man1/time.1          |    2 +-
 man3/addseverity.3   |    2 +-
 man3/fdim.3          |    2 +-
 man3/fmtmsg.3        |    2 +-
 man3/getttyent.3     |    2 +-
 man3/key_setsecret.3 |    2 +-
 man3/setnetgrent.3   |    2 +-
 man4/tty_ioctl.4     |    2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/man1/time.1 b/man1/time.1
index db3f4d4..e6d5699 100644
--- a/man1/time.1
+++ b/man1/time.1
@@ -3,7 +3,7 @@
 .\" Inspired by kromJx-Dvipu+2PAdhvOAoTsqBe5g@public.gmane.org
 .\"
 .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
-.\" This page is distributed under GPL.
+.\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
 .TH TIME 1 2008-11-14 "" "Linux User's Manual"
diff --git a/man3/addseverity.3 b/man3/addseverity.3
index c1d7e71..5e8cc06 100644
--- a/man3/addseverity.3
+++ b/man3/addseverity.3
@@ -1,7 +1,7 @@
 .\"  Copyright 2002 walter harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
 .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
-.\"  Distributed under GPL
+.\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"  adapted glibc info page
 .\"
diff --git a/man3/fdim.3 b/man3/fdim.3
index 6694f5c..62dac84 100644
--- a/man3/fdim.3
+++ b/man3/fdim.3
@@ -3,7 +3,7 @@
 .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 .\"
 .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
-.\" Distributed under GPL.
+.\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
 .TH FDIM 3 2010-09-20 "" "Linux Programmer's Manual"
diff --git a/man3/fmtmsg.3 b/man3/fmtmsg.3
index e046fbe..f4b3d6f 100644
--- a/man3/fmtmsg.3
+++ b/man3/fmtmsg.3
@@ -1,7 +1,7 @@
 .\"  Copyright 2002 walter harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
 .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
-.\"  Distributed under GPL
+.\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
 .\"  adapted glibc info page
diff --git a/man3/getttyent.3 b/man3/getttyent.3
index c15d73d..60504c0 100644
--- a/man3/getttyent.3
+++ b/man3/getttyent.3
@@ -1,7 +1,7 @@
 .\"  Copyright 2002 walter harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
 .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
-.\"  Distributed under GPL
+.\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
 .TH GETTTYENT 3 2002-07-18  "GNU" "Linux Programmer's Manual"
diff --git a/man3/key_setsecret.3 b/man3/key_setsecret.3
index 20c357c..f75896e 100644
--- a/man3/key_setsecret.3
+++ b/man3/key_setsecret.3
@@ -1,7 +1,7 @@
 .\"  Copyright 2002 walter harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
 .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
-.\"  Distributed under GPL
+.\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
 .\"  I had no way the check the functions out
diff --git a/man3/setnetgrent.3 b/man3/setnetgrent.3
index 9745867..40811c2 100644
--- a/man3/setnetgrent.3
+++ b/man3/setnetgrent.3
@@ -1,7 +1,7 @@
 .\"  Copyright 2002 walter harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
 .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
-.\"  Distributed under GPL
+.\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
 .\"  based on glibc infopages
diff --git a/man4/tty_ioctl.4 b/man4/tty_ioctl.4
index bddba96..a33bc5b 100644
--- a/man4/tty_ioctl.4
+++ b/man4/tty_ioctl.4
@@ -2,7 +2,7 @@
 .\" and Andries Brouwer <aeb-rh8NL+sEX9E@public.gmane.org>.
 .\"
 .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
-.\" Distributed under GPL.
+.\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
 .TH TTY_IOCTL 4 2008-10-29 "Linux" "Linux Programmer's Manual"
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
