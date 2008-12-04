From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] man3/getaddrinfo.3: Document results ordering and
	/etc/gai.conf
Date: Fri, 5 Dec 2008 00:22:00 +0100
Message-ID: <20081204232200.GG10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch documents the order of the getaddrinfo(3) results (RFC 3484), how
should the application deal with that, mentions the extremely common cause of
having multiple results per query (both IPv4 and IPv6 addresses available)
and mentions /etc/gai.conf.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index b3b0cce..e1f1f9c 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -33,10 +33,12 @@
 .\" 2008-02-26, mtk; clarify discussion of NULL 'hints' argument; other
 .\"     minor rewrites.
 .\" 2008-06-18, mtk: many parts rewritten
+.\" 2008-12-04, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
+.\"	Describe results ordering and reference /etc/gai.conf.
 .\" FIXME . glibc's 2.9 NEWS file documents DCCP and UDP-lite support
 .\"           and is SCTP support now also there?
 .\"
-.TH GETADDRINFO 3 2008-10-28 "GNU" "Linux Programmer's Manual"
+.TH GETADDRINFO 3 2008-12-04 "GNU" "Linux Programmer's Manual"
 .SH NAME
 getaddrinfo, freeaddrinfo, gai_strerror \- network address and
 service translation
@@ -293,15 +295,26 @@ and returns a pointer to the start of the list in
 The items in the linked list are linked by the
 .I ai_next
 field.
+.PP
 There are several reasons why
 the linked list may have more than one
 .I addrinfo
-structure, including: the network host is multi-homed; or the same service
-is available from multiple socket protocols (one
+structure, including: the network host is multi-homed, accessible
+over multiple protocols (e.g. both
+.BR AF_INET
+and
+.BR AF_INET6 );
+or the same service is available from multiple socket types (one
 .B SOCK_STREAM
 address and another
 .B SOCK_DGRAM
-address, for example).
+address, for example).  Normally, the application should try
+using the addresses in the order they are returned in.
+The sorting function used within
+.BR getaddrinfo ()
+is defined in RFC\ 3484; the order can be tweaked for a particular
+system by editing
+.IR /etc/gai.conf .
 .PP
 If
 .I hints.ai_flags
@@ -558,6 +571,8 @@ The
 .BR gai_strerror ()
 function translates these error codes to a human readable string,
 suitable for error reporting.
+.SH "FILES"
+.I /etc/gai.conf
 .SH "CONFORMING TO"
 POSIX.1-2001.
 The
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
