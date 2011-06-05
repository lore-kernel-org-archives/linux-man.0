From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: ffix: no space in NAME section before \-
Date: Sun, 5 Jun 2011 03:03:14 +0200
Message-ID: <20110605010314.GG28455@glenfiddich.mraw.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="qGV0fN9tzfkG3CxV"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here is a patch for a minor formating issue.

It allows lexgrog to parse successfully the name section.
http://lintian.debian.org/tags/manpage-has-bad-whatis-entry.html

http://lintian.debian.org/full/joey-8fiUuRrzOP0h++r+LBE8gg@public.gmane.org#manpages


-- 
Simon Paillard

--qGV0fN9tzfkG3CxV
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0004-ffix-no-space-in-NAME-section-before.patch"

>From f9bcc26d8b409575571773c72bc10f6591ec862d Mon Sep 17 00:00:00 2001
From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Date: Sun, 5 Jun 2011 02:58:24 +0200
Subject: [PATCH 4/4] ffix: no space in NAME section before \-

It allows lexgrog/serch to work:
http://lintian.debian.org/tags/manpage-has-bad-whatis-entry.html

From: http://lintian.debian.org/full/joey-8fiUuRrzOP0h++r+LBE8gg@public.gmane.org#manpages
---
 man7/operator.7 |    2 +-
 man7/sigevent.7 |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/operator.7 b/man7/operator.7
index 3d8c42e..1473cb8 100644
--- a/man7/operator.7
+++ b/man7/operator.7
@@ -37,7 +37,7 @@
 .\"
 .TH OPERATOR 7 2007-12-08 "Linux" "Linux Programmer's Manual"
 .SH NAME
-C operator \- C operator precedence and order of evaluation
+operator \- C operator precedence and order of evaluation
 .SH DESCRIPTION
 This manual page lists C operators and their precedence in evaluation.
 .nf
diff --git a/man7/sigevent.7 b/man7/sigevent.7
index 229cc06..3ae93bd 100644
--- a/man7/sigevent.7
+++ b/man7/sigevent.7
@@ -23,7 +23,7 @@
 .\"
 .TH SIGEVENT 7 2010-10-04 "GNU" "Linux Programmer's Manual"
 .SH NAME
-struct sigevent \- structure for notification from asynchronous routines
+sigevent \- structure for notification from asynchronous routines
 .SH SYNOPSIS
 .nf
 
-- 
1.7.2.5


--qGV0fN9tzfkG3CxV--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
