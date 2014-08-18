From: Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Subject: Addition to connect(2)
Date: Mon, 18 Aug 2014 18:58:59 +0200
Message-ID: <E1XJQGp-0000UO-0v@palantir.moria.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_53f230d3.S6my96Ur861dAJ2Qj0iI8RfspmDHov4OM1YseGumd1/FPFuu"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.

--=_53f230d3.S6my96Ur861dAJ2Qj0iI8RfspmDHov4OM1YseGumd1/FPFuu
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

the manual page does not describe the state of a socket after a
failed connect call.  Surprisingly, there are TCP/IP stacks where
it is unusable (met one today).  Opengroup also specifies that
as allowed behaviour, so the manual should mention it.

Michael

--=_53f230d3.S6my96Ur861dAJ2Qj0iI8RfspmDHov4OM1YseGumd1/FPFuu
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="connect.2.diff"

--- /usr/share/man/man2/connect.2	2014-08-18 18:48:29.894304874 +0200
+++ ./connect.2	2014-08-18 18:53:24.945090422 +0200
@@ -63,8 +63,9 @@
 .\" Modified 1997-01-31 by Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
 .\" Modified 1998, 1999 by Andi Kleen
 .\" Modified 2004-06-23 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+.\" Modified 2014-08-18 by Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
 .\"
-.TH CONNECT 2 2014-07-08 "Linux" "Linux Programmer's Manual"
+.TH CONNECT 2 2014-08-14 "Linux" "Linux Programmer's Manual"
 .SH NAME
 connect \- initiate a connection on a socket
 .SH SYNOPSIS
@@ -267,6 +268,12 @@
 also used by glibc.
 See also
 .BR accept (2).
+
+Although it works in Linux, if
+.B connect()
+fails, consider the state of the socket as unspecified.  Portable
+applications should close the socket and create a new one for
+reconnecting.
 .SH EXAMPLE
 An example of the use of
 .BR connect ()

--=_53f230d3.S6my96Ur861dAJ2Qj0iI8RfspmDHov4OM1YseGumd1/FPFuu--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
