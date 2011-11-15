From: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Subject: [patch] scandir.3: add SEE ALSO scandirat(3)
Date: Tue, 15 Nov 2011 13:11:30 +0000
Message-ID: <48718.1321362690@proseconsulting.co.uk>
Reply-To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Following my submission of the scandirat(3) man page just now, here is a patch for the scandir(3) man page to make reference to scandirat(3) in the SEE ALSO section.

Best regards,
Mark Bannister.

--- scandir.3.old	2011-10-04 07:34:44.000000000 +0100
+++ scandir.3	2011-11-15 12:46:28.000000000 +0000
@@ -30,10 +30,10 @@
 .\"     Miguel Barreiro (enano-qg+5eQvbBoBgst0ot+Erpg@public.gmane.org).  Added example.
 .\" Modified Sun Sep 24 20:15:46 2000 by aeb, following Petter Reinholdtsen.
 .\" Modified 2001-12-26 by aeb, following Joey. Added versionsort.
+.\" Modified 2011-11-15 by Mark R. Bannister <cambridge-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
+.\"	Added reference to scandirat() in SEE ALSO
 .\"
-.\" FIXME glibc 2.15 adds scandirat()
-.\"
-.TH SCANDIR 3  2011-09-08 "GNU" "Linux Programmer's Manual"
+.TH SCANDIR 3  2011-11-15 "GNU" "Linux Programmer's Manual"
 .SH NAME
 scandir, alphasort, versionsort \- scan a directory for matching entries
 .SH SYNOPSIS
@@ -177,8 +177,9 @@
 .BR opendir (3),
 .BR readdir (3),
 .BR rewinddir (3),
+.BR scandirat (3),
 .BR seekdir (3),
 .BR strcmp (3),
 .BR strcoll (3),
 .BR strverscmp (3),
-.BR telldir (3)
+.BR telldir (3).


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
