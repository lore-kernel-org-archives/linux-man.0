From: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Subject: [patch] umask.2: add reference to acl(5)
Date: Fri, 2 Dec 2011 12:39:36 +0000
Message-ID: <27834.1322829576@proseconsulting.co.uk>
Reply-To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

A simple change to remove a FIXME from umask.2, as the acl(5) man page now exists and can be referenced by it in the SEE ALSO section.

This patch applies to 3.35.

Best regards,
Mark.

--- umask.2.old 2011-10-11 19:17:50.000000000 +0100
+++ umask.2     2011-12-02 12:26:13.000000000 +0000
@@ -31,7 +31,9 @@
 .\"  <nick-NyJ9ilpwIKLQT0dZR+AlfA@public.gmane.org> with Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org> suggestion
 .\" 2006-05-13, mtk, substantial rewrite of description of 'mask'
 .\" 2008-01-09, mtk, a few rewrites and additions.
-.TH UMASK 2 2008-01-09 "Linux" "Linux Programmer's Manual"
+.\" Modified 2011-12-02 by Mark R. Bannister <cambridge-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
+.\"            to add the acl(5) reference
+.TH UMASK 2 2011-12-02 "Linux" "Linux Programmer's Manual"
 .SH NAME
 umask \- set file mode creation mask
 .SH SYNOPSIS
@@ -117,5 +119,5 @@
 .BR chmod (2),
 .BR mkdir (2),
 .BR open (2),
-.BR stat (2)
-.\" FIXME . eventually: .BR acl (5)
+.BR stat (2),
+.BR acl (5).


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
