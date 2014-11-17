From: Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Subject: Addition to memcmp(3)
Date: Mon, 17 Nov 2014 09:07:55 +0100
Message-ID: <E1XqHLn-00041P-MO@fangorn.moria.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

memcmp(3) does not document the return value for length 0 and the
CPU time depending on the number of compared bytes.  While both
is obvious, it should still be documented.

Michael

--- memcmp.3.orig	2014-11-17 08:53:53.848805576 +0100
+++ memcmp.3	2014-11-17 08:58:39.699005856 +0100
@@ -27,6 +27,7 @@
 .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 18:55:27 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
+.\" Modified Mon Nov 17 07:45:13 2014 by Michael Haardt (michael-8s1n8bisGiQ@public.gmane.org)
 .TH MEMCMP 3  2014-03-14 "" "Linux Programmer's Manual"
 .SH NAME
 memcmp \- compare memory areas
@@ -42,6 +43,11 @@
 function compares the first \fIn\fP bytes (each interpreted as
 .IR "unsigned char" )
 of the memory areas \fIs1\fP and \fIs2\fP.
+.PP
+Do not use
+.BR memcmp ()
+to compare security critical data, such as cryptographic secrets,
+because the required CPU time depends on the amount of equal bytes.
 .SH RETURN VALUE
 The
 .BR memcmp ()
@@ -57,6 +63,8 @@
 .I s1
 and
 .IR s2 .
+.PP
+If \fIn\fP is zero, the return value is zero.
 .SH ATTRIBUTES
 .SS Multithreading (see pthreads(7))
 The
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
