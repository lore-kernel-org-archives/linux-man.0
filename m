From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/2] futex.2, open_by_handle_at.2, seccomp.2, socket.2, console_codes.4, protocols.5, aio.7, capabilities.7, libc.7, netlink.7, raw.7, standards.7, unicode.7, uri.7, vdso.7: tfix
Date: Sun, 29 Jan 2017 16:21:13 +0100
Message-ID: <20170129152113.9770-2-jwilk@jwilk.net>
References: <20170129152113.9770-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170129152113.9770-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Escape hyphens in URLs.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/futex.2             | 2 +-
 man2/open_by_handle_at.2 | 2 +-
 man2/seccomp.2           | 2 +-
 man2/socket.2            | 2 +-
 man4/console_codes.4     | 4 ++--
 man5/protocols.5         | 2 +-
 man7/aio.7               | 2 +-
 man7/capabilities.7      | 2 +-
 man7/libc.7              | 2 +-
 man7/netlink.7           | 2 +-
 man7/raw.7               | 2 +-
 man7/standards.7         | 6 +++---
 man7/unicode.7           | 2 +-
 man7/uri.7               | 2 +-
 man7/vdso.7              | 2 +-
 15 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 2f852e3c4..5e9eef295 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -1910,7 +1910,7 @@ Franke, H., Russell, R., and Kirwood, M., 2002.
 \fIFuss, Futexes and Furwocks: Fast Userlevel Locking in Linux\fP
 (from proceedings of the Ottawa Linux Symposium 2002),
 .br
-.UR http://kernel.org\:/doc\:/ols\:/2002\:/ols2002-pages-479-495.pdf
+.UR http://kernel.org\:/doc\:/ols\:/2002\:/ols2002\-pages\-479\-495.pdf
 .UE
 
 Hart, D., 2009. \fIA futex overview and update\fP,
diff --git a/man2/open_by_handle_at.2 b/man2/open_by_handle_at.2
index 689ff486b..ad59dc9bd 100644
--- a/man2/open_by_handle_at.2
+++ b/man2/open_by_handle_at.2
@@ -730,5 +730,5 @@ and
 documentation in the latest
 .I util-linux
 release at
-.UR https://www.kernel.org/pub/linux/utils/util-linux/
+.UR https://www.kernel.org/pub/linux/utils/util\-linux/
 .UE
diff --git a/man2/seccomp.2 b/man2/seccomp.2
index 91f555a7b..7d0e72189 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -840,5 +840,5 @@ and
 McCanne, S. and Jacobson, V. (1992)
 .IR "The BSD Packet Filter: A New Architecture for User-level Packet Capture" ,
 Proceedings of the USENIX Winter 1993 Conference
-.UR http://www.tcpdump.org/papers/bpf-usenix93.pdf
+.UR http://www.tcpdump.org/papers/bpf\-usenix93.pdf
 .UE
diff --git a/man2/socket.2 b/man2/socket.2
index ed696c524..4bd1e9809 100644
--- a/man2/socket.2
+++ b/man2/socket.2
@@ -390,7 +390,7 @@ The
 protocol type was added in Linux 2.6.38.
 More information on this interface is provided with the kernel HTML
 documentation at
-.IR https://www.kernel.org/doc/htmldocs/crypto-API/User.html .
+.IR https://www.kernel.org/doc/htmldocs/crypto\-API/User.html .
 .SH EXAMPLE
 An example of the use of
 .BR socket ()
diff --git a/man4/console_codes.4 b/man4/console_codes.4
index a1eaa0e8f..13de9dc5a 100644
--- a/man4/console_codes.4
+++ b/man4/console_codes.4
@@ -598,7 +598,7 @@ That document, though terse, is much longer than this manual page.
 For a chronological overview,
 .PP
 .RS
-.UR http://invisible-island.net\:/xterm\:/xterm.log.html
+.UR http://invisible\-island.net\:/xterm\:/xterm.log.html
 .UE
 .RE
 .PP
@@ -607,7 +607,7 @@ details changes to xterm.
 The \fIvttest\fP program
 .PP
 .RS
-.UR http://invisible-island.net\:/vttest/
+.UR http://invisible\-island.net\:/vttest/
 .UE
 .RE
 .PP
diff --git a/man5/protocols.5 b/man5/protocols.5
index 0248748bf..4ed17fe7c 100644
--- a/man5/protocols.5
+++ b/man5/protocols.5
@@ -81,5 +81,5 @@ The protocols definition file.
 .SH SEE ALSO
 .BR getprotoent (3)
 
-.UR http://www.iana.org\:/assignments\:/protocol-numbers
+.UR http://www.iana.org\:/assignments\:/protocol\-numbers
 .UE
diff --git a/man7/aio.7 b/man7/aio.7
index 47ceea7c9..8327a7a76 100644
--- a/man7/aio.7
+++ b/man7/aio.7
@@ -466,5 +466,5 @@ main(int argc, char *argv[])
 "Asynchronous I/O Support in Linux 2.5",
 Bhattacharya, Pratt, Pulavarty, and Morgan,
 Proceedings of the Linux Symposium, 2003,
-.UR https://www.kernel.org/doc/ols/2003/ols2003-pages-351-366.pdf
+.UR https://www.kernel.org/doc/ols/2003/ols2003\-pages\-351\-366.pdf
 .UE
diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 004a7f220..4ac197b23 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -1380,7 +1380,7 @@ and
 programs.
 It can be found at
 .br
-.UR http://www.kernel.org\:/pub\:/linux\:/libs\:/security\:/linux-privs
+.UR http://www.kernel.org\:/pub\:/linux\:/libs\:/security\:/linux\-privs
 .UE .
 
 Before kernel 2.6.24, and from kernel 2.6.24 to kernel 2.6.32 if
diff --git a/man7/libc.7 b/man7/libc.7
index 90e76ea11..e0f74a20a 100644
--- a/man7/libc.7
+++ b/man7/libc.7
@@ -106,7 +106,7 @@ Among such libraries are
 .I dietlibc
 .UE ,
 and
-.UR http://www.musl-libc.org/
+.UR http://www.musl\-libc.org/
 .I "musl libc"
 .UE .
 Details of these libraries are covered by the
diff --git a/man7/netlink.7 b/man7/netlink.7
index 1d02feb32..dae58173d 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -564,7 +564,7 @@ for (nh = (struct nlmsghdr *) buf; NLMSG_OK (nh, len);
 .BR rtnetlink (7),
 .BR sock_diag (7)
 
-.UR ftp://ftp.inr.ac.ru\:/ip-routing\:/iproute2*
+.UR ftp://ftp.inr.ac.ru\:/ip\-routing\:/iproute2*
 information about libnetlink
 .UE
 
diff --git a/man7/raw.7 b/man7/raw.7
index e71dc43b2..10c5d3342 100644
--- a/man7/raw.7
+++ b/man7/raw.7
@@ -40,7 +40,7 @@ number specified
 for the raw socket are passed to this socket.
 For a list of the allowed protocols,
 see the IANA list of assigned protocol numbers at
-.UR http://www.iana.org/assignments/protocol-numbers/
+.UR http://www.iana.org/assignments/protocol\-numbers/
 .UE
 and
 .BR getprotobyname (3).
diff --git a/man7/standards.7 b/man7/standards.7
index ecfdd956d..981263fe1 100644
--- a/man7/standards.7
+++ b/man7/standards.7
@@ -114,7 +114,7 @@ and is thus occasionally referred to as
 This revision of the C language standard was ratified by ISO in 1999
 .RI ( "ISO/IEC 9899:1999" ).
 Available online at
-.UR http://www.open-std.org\:/jtc1\:/sc22\:/wg14\:/www\:/standards
+.UR http://www.open\-std.org\:/jtc1\:/sc22\:/wg14\:/www\:/standards
 .UE .
 .TP
 .B C11
@@ -186,7 +186,7 @@ This standard appeared in 1997.
 Systems conforming to this standard can be branded
 .IR "UNIX 98" .
 See also
-.UR http://www.UNIX-systems.org\:/version2/
+.UR http://www.UNIX\-systems.org\:/version2/
 .UE .)
 .TP
 .B POSIX.1-2001, SUSv3
@@ -196,7 +196,7 @@ conducted under the auspices of the Austin Group
 .UR http://www.opengroup.org\:/austin/
 .UE .
 The standard is available online at
-.UR http://www.unix-systems.org\:/version3/
+.UR http://www.unix\-systems.org\:/version3/
 .UE ,
 and the interfaces that it describes are also available in the Linux
 manual pages package under sections 1p and 3p (e.g., "man 3p open").
diff --git a/man7/unicode.7 b/man7/unicode.7
index 40fdfe5ec..371cd227f 100644
--- a/man7/unicode.7
+++ b/man7/unicode.7
@@ -250,7 +250,7 @@ Markus Kuhn: UTF-8 and Unicode FAQ for UNIX/Linux.
 .IP *
 Bruno Haible: Unicode HOWTO.
 .RS
-.UR http://www.tldp.org\:/HOWTO\:/Unicode-HOWTO.html
+.UR http://www.tldp.org\:/HOWTO\:/Unicode\-HOWTO.html
 .UE
 .RE
 .\" .SH AUTHOR
diff --git a/man7/uri.7 b/man7/uri.7
index d4ac41dc9..427f8ff83 100644
--- a/man7/uri.7
+++ b/man7/uri.7
@@ -586,7 +586,7 @@ use the standard format as described here.
 .UR http://www.ietf.org\:/rfc\:/rfc2396.txt
 (IETF RFC\ 2396)
 .UE ,
-.UR http://www.w3.org\:/TR\:/REC-html40
+.UR http://www.w3.org\:/TR\:/REC\-html40
 (HTML 4.0)
 .UE .
 .SH NOTES
diff --git a/man7/vdso.7 b/man7/vdso.7
index be35f175a..58b0bbf58 100644
--- a/man7/vdso.7
+++ b/man7/vdso.7
@@ -247,7 +247,7 @@ object formats it runs aren't even ELF based (they're bFLT/FLAT).
 For information on this code page,
 it's best to refer to the public documentation:
 .br
-http://docs.blackfin.uclinux.org/doku.php?id=linux-kernel:fixed-code
+http://docs.blackfin.uclinux.org/doku.php?id=linux\-kernel:fixed\-code
 .SS mips functions
 .\" See linux/arch/mips/vdso/vdso.ld.S
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
