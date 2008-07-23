From: Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>
Subject: [manpages]: Version 2 of a udplite(7) manpage
Date: Wed, 23 Jul 2008 16:40:17 +0100
Message-ID: <20080723154017.GA14244@gerrit.erg.abdn.ac.uk>
References: <Pine.LNX.4.64.0806171344370.25191@shark.he.net> <cfd18e0f0806180207x783d83d0j3d5e42987be24ea6@mail.gmail.com> <20080618092707.GC23684@gerrit.erg.abdn.ac.uk> <cfd18e0f0806180248g35bec32n7977c46cbcf4142@mail.gmail.com> <20080624133625.GA16424@gerrit.erg.abdn.ac.uk> <cfd18e0f0806270203p4305cd2jae9cb8a79d7c33e9@mail.gmail.com> <20080630112751.GB5040@gerrit.erg.abdn.ac.uk> <cfd18e0f0806300603g38cc4222r37996404390dfcbf@mail.gmail.com> <cfd18e0f0807160810p7d40e3bbpe150d695aca8c5ea@mail.gmail.com> <20080718110923.GA12919@gerrit.erg.abdn.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080718110923.GA12919-w6qhtmnlW2CgJ32XgR7WtTYRy0cijUJx@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Michael,

can you please have a look at the revised version of the udplite(7) manpage?

The main changes are:
 * the patch correcting the behaviour for large checksum coverages (> 0xffff)
   has been accepted by Dave Miller into the netdev-2.6 tree and pushed to -stable;
 * this behaviour has been documented (truncation to maximum value);
 * also attached is an rcsdiff where the responses to your Fixme's are good to see;
 * the rest is minor editorial changes.

With best regards
Gerrit

--bp/iNruPH9dso1Pn
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="rcsdiff_udplite.7_since_review.diff"

--- udplite.7	2008/06/27 19:09:22	1.6
+++ udplite.7	2008/07/23 15:22:34
@@ -1,7 +1,28 @@
-.\" FIXME(gr) we need a license for this page.
-.\" The one I tend to favor is shown in the capabilities.7 page,
-.\" but others are also used in man-pages (e.g., GPL, BSD).
-.TH UDPLITE  7 2008-06-23 "Linux" "Linux Programmer's Manual"
+.\" Copyright (c) 2008 by Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>
+.\"
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume no
+.\" responsibility for errors or omissions, or for damages resulting from
+.\" the use of the information contained herein.  The author(s) may not
+.\" have taken the same level of care in the production of this manual,
+.\" which is licensed free of charge, as they might when working
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\"
+.\" $Id: udplite.7,v 1.12 2008/07/23 15:22:22 gerrit Exp gerrit $
+.\"
+.TH UDPLITE  7 2008-07-23 "Linux" "Linux Programmer's Manual"
 .SH NAME
 udplite \- Lightweight User Datagram Protocol
 .SH SYNOPSIS
@@ -18,15 +39,9 @@
 
 UDP-Lite is an extension of UDP (RFC\ 768) to support variable-length
 checksums.
-This has advantages for some types of multimedia transport,
-since it makes it possible to reuse partly damaged frames
-(with few bit errors).
-.\" FIXME(gr) is "reuse" the right word in the previous sentence?
-.\" Reading the RFC suggests to me that a better wording might be:
-.\"
-.\" This has advantages for some types of multimedia transport that
-.\" may be able to make use of slightly damaged datagrams,
-.\" rather than having them discarded by lower layer protocols.
+This has advantages for some types of multimedia transport that
+may be able to make use of slightly damaged datagrams,
+rather than having them discarded by lower-layer protocols.
 
 The variable-length checksum coverage is set via a
 .BR setsockopt (2)
@@ -68,16 +83,15 @@
 .B int
 as argument, with a checksum coverage value in the range 0..2^16-1.
 
-A value of 0 means that the entire datagram is always covered,
-values from 1-7 are illegal (RFC\ 3828, 3.1) and are rounded up to
+A value of 0 means that the entire datagram is always covered.
+Values from 1-7 are illegal (RFC\ 3828, 3.1) and are rounded up to
 the minimum coverage of 8.
 
 With regard to IPv6 jumbograms (RFC\ 2675), the UDP-Litev6 checksum
 coverage is limited to the first 2^16-1 octets, as per RFC\ 3828, 3.5.
-Higher values are therefore not supported.
-.\" FIXME(gr) If higher values are specified, what happens?
-.\" If they are silently ignored, probably we should explicitly
-.\" say so here.
+Higher values are therefore silently truncated to 2^16-1.
+If in doubt, the current coverage value can always be queried using
+.BR getsockopt (2).
 .TP
 .BR UDPLITE_RECV_CSCOV
 This is the receiver-side analogue and uses uses the same argument format
@@ -89,6 +103,11 @@
 instructs the kernel to drop all packets which have a coverage
 .I less
 than the specified coverage value.
+
+When the value of
+.B UDPLITE_RECV_CSCOV
+exceeds the actual packet coverage, incoming packets are silently dropped,
+but may generate a warning message in the system log.
 .\" FIXME: SO_NO_CHECK exists and is supported by UDPv4, but is
 .\" commented out in socket(7), hence also here ???
 .\".PP
@@ -102,10 +121,6 @@
 .BR udp (7)
 may be returned.
 UDP-Lite does not add further errors.
-When the value of
-.B UDPLITE_RECV_CSCOV
-exceeds the actual coverage, incoming packets are silently dropped,
-but may generate a warning message in the system log.
 .SH BUGS
 .\" FIXME: remove this section once glibc supports UDP-Lite
 Where glibc support is missing, the following definitions are needed:
@@ -120,11 +135,10 @@
 .in
 .SH FILES
 .I /proc/net/snmp
+\- basic UDP-Litev4 statistics counters.
 .br
-.IR /proc/net/snmp6
-.\" FIXME(gr)
-.\" Could you add some discussion of the UDPLITE-specific
-.\" info in these files?
+.I /proc/net/snmp6
+\- basic UDP-Litev6 statistics counters.
 .SH VERSIONS
 UDP-Litev4/v6 first appeared in Linux 2.6.20.
 .SH "SEE ALSO"
@@ -136,4 +150,3 @@
 RFC\ 3828 for the Lightweight User Datagram Protocol (UDP-Lite)
 .br
 .I Documentation/networking/udplite.txt
-

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="udplite.7"

.\" Copyright (c) 2008 by Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.\" $Id: udplite.7,v 1.12 2008/07/23 15:22:22 gerrit Exp gerrit $
.\"
.TH UDPLITE  7 2008-07-23 "Linux" "Linux Programmer's Manual"
.SH NAME
udplite \- Lightweight User Datagram Protocol
.SH SYNOPSIS
.B #include <sys/socket.h>
.br
.\" FIXME: see #defines under `BUGS',
.\"        when glibc supports this, add
.\"        #include <netinet/udplite.h>
.sp
.B s = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDPLITE);
.SH DESCRIPTION
This is an implementation of the Lightweight User Datagram Protocol
(UDP-Lite), as described in RFC\ 3828.

UDP-Lite is an extension of UDP (RFC\ 768) to support variable-length
checksums.
This has advantages for some types of multimedia transport that
may be able to make use of slightly damaged datagrams,
rather than having them discarded by lower-layer protocols.

The variable-length checksum coverage is set via a
.BR setsockopt (2)
option.
If this option is not set, the only difference to UDP is
in using a different IP protocol identifier (IANA number 136).

The UDP-Lite implementation is a full extension of
.BR udp (7),
i.e., it shares the same API and API behaviour, and in addition
offers two socket options to control the checksum coverage.
.SS "Address Format"
UDP-Litev4 uses the
.I sockaddr_in
address format described in
.BR ip (7).
UDP-Litev6 uses the
.I sockaddr_in6
address format described in
.BR ipv6 (7).
.SS "Socket Options"
To set or get a UDP-Lite socket option, call
.BR getsockopt (2)
to read or
.BR setsockopt (2)
to write the option with the option level argument set to
.BR IPPROTO_UDPLITE .
In addition, all
.B IPPROTO_UDP
socket options are valid on a UDP-Lite socket.
See
.BR udp (7)
for more information.

The following two options are specific to UDP-Lite.
.TP
.BR UDPLITE_SEND_CSCOV
This option sets the sender checksum coverage and takes an
.B int
as argument, with a checksum coverage value in the range 0..2^16-1.

A value of 0 means that the entire datagram is always covered.
Values from 1-7 are illegal (RFC\ 3828, 3.1) and are rounded up to
the minimum coverage of 8.

With regard to IPv6 jumbograms (RFC\ 2675), the UDP-Litev6 checksum
coverage is limited to the first 2^16-1 octets, as per RFC\ 3828, 3.5.
Higher values are therefore silently truncated to 2^16-1.
If in doubt, the current coverage value can always be queried using
.BR getsockopt (2).
.TP
.BR UDPLITE_RECV_CSCOV
This is the receiver-side analogue and uses uses the same argument format
and value range as
.BR UDPLITE_SEND_CSCOV .
This option is not required to enable traffic with partial checksum
coverage.
Its function is that of a traffic filter: when enabled, it
instructs the kernel to drop all packets which have a coverage
.I less
than the specified coverage value.

When the value of
.B UDPLITE_RECV_CSCOV
exceeds the actual packet coverage, incoming packets are silently dropped,
but may generate a warning message in the system log.
.\" FIXME: SO_NO_CHECK exists and is supported by UDPv4, but is
.\" commented out in socket(7), hence also here ???
.\".PP
.\"Since UDP-Lite mandates checksums, checksumming can not be disabled
.\"via the
.\".B SO_NO_CHECK
.\"option from
.\".BR socket (7).
.SH ERRORS
All errors documented for
.BR udp (7)
may be returned.
UDP-Lite does not add further errors.
.SH BUGS
.\" FIXME: remove this section once glibc supports UDP-Lite
Where glibc support is missing, the following definitions are needed:
.in +4n
.nf

#define IPPROTO_UDPLITE     136
.\" The following two are defined in the kernel in linux/net/udplite.h
#define UDPLITE_SEND_CSCOV  10
#define UDPLITE_RECV_CSCOV  11
.fi
.in
.SH FILES
.I /proc/net/snmp
\- basic UDP-Litev4 statistics counters.
.br
.I /proc/net/snmp6
\- basic UDP-Litev6 statistics counters.
.SH VERSIONS
UDP-Litev4/v6 first appeared in Linux 2.6.20.
.SH "SEE ALSO"
.BR udp (7),
.BR ip (7),
.BR ipv6 (7),
.BR socket (7)

RFC\ 3828 for the Lightweight User Datagram Protocol (UDP-Lite)
.br
.I Documentation/networking/udplite.txt

--bp/iNruPH9dso1Pn--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
