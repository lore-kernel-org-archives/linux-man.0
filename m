From: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: [patch] ip.7: Convention, order, and typo
Date: Thu, 21 Oct 2010 22:53:26 -0400
Message-ID: <i9qub7$jge$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Please find inline a patch against current ip(7) manual page, in order
to fix some issue spotted while reviewing it's translation.

The first part goal is to mark in _italic_ the text that should be
replaced with appropriate argument, as it is correctly used in other
parts of the page (and in the other pages).

The second part of the patch is a nip-ticking one, proposed in case you
find it justified to also follow this rule for INADDR_*.

I also noticed that socket options used to be order alphabetically,
this is addressed in the following parts of the patch.

Finally, maybe the most important one if I'm not mistaken, the last
part of the patch fixes a socket option name issue.


diff --git a/man7/ip.7 b/man7/ip.7
index d8480e9..a517c82 100644
- --- a/man7/ip.7
+++ b/man7/ip.7
@@ -41,7 +41,7 @@ For more information on sockets, see
 An IP socket is created by calling the
 .BR socket (2)
 function as
- -.BR "socket(AF_INET, socket_type, protocol)" .
+.BR "socket(AF_INET, \fIsocket_type\fB, \fIprotocol\fB)" .
 Valid socket types are
 .B SOCK_STREAM
 to open a
@@ -151,7 +151,7 @@ member of
 .I struct in_addr
 contains the host interface address in network byte order.
 .I in_addr
- -should be assigned one of the INADDR_* values (e.g.,
+should be assigned one of the \fBINADDR_\fI*\fR values (e.g.,
 .BR INADDR_ANY )
 or set using the
 .BR inet_aton (3),
@@ -263,6 +263,19 @@ or
 structure similar to
 .BR IP_ADD_MEMBERSHIP .
 .TP
+.BR IP_FREEBIND " (since Linux 2.4)"
+.\" Precisely: 2.4.0-test10
+If enabled, this boolean option allows binding to an IP address
+that is nonlocal or does not (yet) exist.
+This permits listening on a socket,
+without requiring the underlying network interface or the
+specified dynamic IP address to be up at the time that
+the application is trying to bind to it.
+This option is the per-socket equivalent of the
+.IR ip_nonlocal_bind
+.I /proc
+interface described below.
+.TP
 .BR IP_HDRINCL " (since Linux 2.0)"
 If enabled,
 the user supplies an IP header in front of the user data.
@@ -278,19 +291,6 @@ When this flag is enabled the values set by
 and
 .B IP_TOS
 are ignored.
- -.TP
- -.BR IP_FREEBIND " (since Linux 2.4)"
- -.\" Precisely: 2.4.0-test10
- -If enabled, this boolean option allows binding to an IP address
- -that is nonlocal or does not (yet) exist.
- -This permits listening on a socket,
- -without requiring the underlying network interface or the
- -specified dynamic IP address to be up at the time that
- -the application is trying to bind to it.
- -This option is the per-socket equivalent of the
- -.IR ip_nonlocal_bind
- -.I /proc
- -interface described below.
 .\"
 .\" FIXME Document IP_IPSEC_POLICY
 .\" Since Linux 2.5.47
@@ -449,18 +449,6 @@ puts the current IP options used for sending into the supplied buffer.
 .\" commit 2c7946a7bf45ae86736ab3b43d0085e43947945c
 .\" Author: Catherine Zhang <cxzhang-aZOuKsOsJu3MbYB6QlFGEg@public.gmane.org>
 .TP
- -.BR IP_RECVORIGDSTADDR " (since Linux 2.6.29)"
- -.\" FIXME: Document IP_ORIGDSTADDR+IP_RECVORIGDSTADDR, added in Linux 2.6.29
- -.\" commit e8b2dfe9b4501ed0047459b2756ba26e5a940a69
- -This boolean option enables the
- -.B IP_ORIGDSTADDR
- -ancillary message in
- -.BR recvmsg (2),
- -in which the kernel returns the original destination address
- -of the datagram being received.
- -The ancillary message contains a
- -.IR "struct sockaddr_in" .
- -.TP
 .BR IP_PKTINFO " (since Linux 2.2)"
 .\" Precisely: 2.1.68
 Pass an
@@ -661,6 +649,18 @@ Not supported for
 .B SOCK_STREAM
 sockets.
 .TP
+.BR IP_RECVORIGDSTADDR " (since Linux 2.6.29)"
+.\" FIXME: Document IP_ORIGDSTADDR+IP_RECVORIGDSTADDR, added in Linux 2.6.29
+.\" commit e8b2dfe9b4501ed0047459b2756ba26e5a940a69
+This boolean option enables the
+.B IP_ORIGDSTADDR
+ancillary message in
+.BR recvmsg (2),
+in which the kernel returns the original destination address
+of the datagram being received.
+The ancillary message contains a
+.IR "struct sockaddr_in" .
+.TP
 .BR IP_RECVTOS " (since Linux 2.2)"
 .\" Precisely: 2.1.68
 If enabled the
@@ -733,7 +733,7 @@ socket option (see
 .\" Author: KOVACS Krisztian <hidden-fxaCF9evXcoHWmgEVkV9KA@public.gmane.org>
 .\" http://lwn.net/Articles/252545/
 .TP
- -.BR IP_TTL " (since Linux 2.6.24)"
+.BR IP_TRANSPARENT " (since Linux 2.6.24)"
 .\" commit f5715aea4564f233767ea1d944b2637a5fd7cd2e
 .\"     This patch introduces the IP_TRANSPARENT socket option: enabling that
 .\"     will make the IPv4 routing omit the non-local source address check on


Regards

David

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkzA/KUACgkQ18/WetbTC/rgiQCgk6vSXqUdHcLZ8JqpwdnSOG6s
r+UAn2GD2C063PcEdmdo+zk/ispXwvOQ
=NO7w
-----END PGP SIGNATURE-----

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
