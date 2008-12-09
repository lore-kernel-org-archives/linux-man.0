From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] getifaddrs.3: New manual page
Date: Tue, 9 Dec 2008 03:56:34 +0100
Message-ID: <20081209025634.GD10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch adds documentation for the getifaddrs() and freeifaddrs()
functions as they are supported in GNU libc. The manual page is based
on the original BSD manpage (with licence as it appears on the top
of the file), but is significantly rewritten for Linux manpages
standards and containing all the differences. A simple example is
provided.

I'm open to relicensing to any of the standard licences, this one
should be compatible even with the classic BSD licence.

I did not do actually any testing on BSD systems about how exactly
this call behaves, I have only tried to figure this out from their
chaotic documentation and it wouldn't surprise me if it would in
fact behave the same as with glibc now.  I cannot remember hostnames
of the BSD systems I used to have an account on. ;-)

Few pages are cross-linked to point at getifaddrs(3) now, and
inet_ntop() got another example pointer.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

---

I will understand if you choose to remove my BUGS note in inet_ntop().
;-)

By the way, it is real pain to find resources like the list of standard
licences on the web page... you just remember you have seen it once but
to click through to it again is a challenge.

diff --git a/man2/bind.2 b/man2/bind.2
index 67a2fcf..7e84e45 100644
--- a/man2/bind.2
+++ b/man2/bind.2
@@ -321,6 +321,7 @@ main(int argc, char *argv[])
 .BR listen (2),
 .BR socket (2),
 .BR getaddrinfo (3),
+.BR getifaddrs (3),
 .BR ip (7),
 .BR ipv6 (7),
 .BR path_resolution (7),
diff --git a/man2/getsockname.2 b/man2/getsockname.2
index 0f4ccb3..cab1bbe 100644
--- a/man2/getsockname.2
+++ b/man2/getsockname.2
@@ -110,6 +110,7 @@ See also
 .SH "SEE ALSO"
 .BR bind (2),
 .BR socket (2),
+.BR getifaddrs (3),
 .BR ip (7),
 .BR socket (7),
 .BR unix (7)
diff --git a/man3/freeifaddrs.3 b/man3/freeifaddrs.3
new file mode 100644
index 0000000..a9d5317
--- /dev/null
+++ b/man3/freeifaddrs.3
@@ -0,0 +1 @@
+man3/getifaddrs.3
diff --git a/man3/getifaddrs.3 b/man3/getifaddrs.3
new file mode 100644
index 0000000..9e51126
--- /dev/null
+++ b/man3/getifaddrs.3
@@ -0,0 +1,231 @@
+.\"
+.\" Copyright (c) 1995, 1999
+.\"	Berkeley Software Design, Inc.  All rights reserved.
+.\" Copyright (c) 2008 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
+.\"
+.\" Redistribution and use in source and binary forms, with or without
+.\" modification, are permitted provided that the following conditions
+.\" are met:
+.\" 1. Redistributions of source code must retain the above copyright
+.\"    notice, this list of conditions and the following disclaimer.
+.\"
+.\" THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. ``AS IS'' AND
+.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+.\" ARE DISCLAIMED.  IN NO EVENT SHALL Berkeley Software Design, Inc. BE LIABLE
+.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+.\" SUCH DAMAGE.
+.\"
+.\" 2008-12-08 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
+.\"    Rewrite the BSD manpage in the Linux man pages style and account
+.\"    for glibc specificities, provide an example.
+.\"
+.TH GETIFADDRS 3 2008-12-08 "GNU" "Linux Programmer's Manual"
+.SH NAME
+getifaddrs, freeifaddrs \- get interface addresses
+.SH SYNOPSIS
+.nf
+.B #include <sys/types.h>
+.B #include <ifaddrs.h>
+.sp
+.BI "int getifaddrs(struct ifaddrs **" "ifap" );
+.sp
+.BI "void freeifaddrs(struct ifaddrs *" "ifa" );
+.fi
+.SH DESCRIPTION
+The
+.BR getifaddrs ()
+function creates a linked list of addresses assigned to the network
+interfaces on the local system and stores its reference in a pointer
+variable referenced by
+.IR ifap .
+The list consists of
+.I ifaddrs
+structures, where each contains the following fields:
+.sp
+.in +4n
+.nf
+struct ifaddrs {
+    struct ifaddrs   *ifa_next;
+    char             *ifa_name;
+    u_int             ifa_flags;
+    struct sockaddr  *ifa_addr;
+    struct sockaddr  *ifa_netmask;
+    union {
+        struct sockaddr *ifu_broadaddr;
+        struct sockaddr *ifu_dstaddr;
+    } ifa_ifu;
+    #define           ifa_broadaddr ifa_ifu.ifu_broadaddr
+    #define           ifa_dstaddr   ifa_ifu.ifu_dstaddr
+    void             *ifa_data;
+};
+.fi
+.in
+.PP
+The
+.I ifa_next
+field contains a pointer to the next structure on the list,
+or NULL within the last item of the list.
+.PP
+The
+.I ifa_name
+field contains the interface name.
+.PP
+The
+.I ifa_flags
+field contains the interface flags, as returned by the
+.B SIOCGIFFLAGS
+ioctl (see
+.BR netdevice (7)
+for a list).
+.PP
+The
+.I ifa_addr
+field references the particular interface address.
+(The
+.I sa_family
+sub-field should be consulted to determine the format of the address.)
+.PP
+The
+.I ifa_netmask
+field references the netmask associated with
+.IR ifa_addr ,
+if applicable for the address family.
+.PP
+Depending on whether the bit
+.B IFF_BROADCAST
+or
+.B IFF_POINTOPOINT
+is set in
+.I ifa_flags
+(only one can be set at a time),
+either
+.I ifa_broadaddr
+will contain the broadcast address associated with
+.I ifa_addr
+(if applicable for the address family) or
+.I ifa_dstaddr
+will contain the destination address of the point-to-point interface.
+.PP
+The
+.I ifa_data
+field can reference address family specific data (may be NULL).
+.PP
+The data returned by
+.BR getifaddrs ()
+is dynamically allocated and should be freed using
+.BR freeifaddrs ()
+when no longer needed.
+.SH RETURN VALUES
+On success, zero is returned.  On error, -1 is returned, and
+.I errno
+is set appropriately.
+.SH ERRORS
+The
+.BR getifaddrs ()
+may fail and set
+.B errno
+for any of the errors specified for the library routines
+.BR socket (2),
+.BR bind (2),
+.BR sendto (2),
+.BR malloc (3)
+or
+.BR realloc (3).
+.SH CONFORMING TO
+Not in POSIX.1-2001. This function first appeared in BSDi and is
+present on the BSD systems, but with a slightly different
+semantics documented - returning one entry per interface, not per address.
+This means
+.I ifa_addr
+and other fields can be actually NULL if the interface has no address,
+and no link-level address returned if the interface has an IP address
+assigned. Also, the way of choosing either
+.I ifa_broadaddr
+or
+.I ifa_dstaddr
+differs on various sytems, but the BSD-derived documentation generally
+appears to be confused and obsolete on this point.
+.\" i.e. commonly it still says one of them will be NULL, even if
+.\" the ifa_ifu union is already present
+
+The function first appeared in GNU libc 2.3, but supported only IPv4
+addresses until GNU libc 2.3.3.
+.SH NOTES
+The addresses returned on Linux will be usually the IPv4 and IPv6 addresses
+assigned to the interface, but also one
+.B AF_PACKET
+address per interface containing lower-level details about the interface
+and its physical layer. In this case, the
+.I ifa_data
+field may contain a pointer to the
+.I struct net_device_stats
+as defined in
+.B <linux/netdevice.h>
+which contains various interface attributes and statistics.
+.SH EXAMPLE
+The program below demonstrates the use of
+.BR getifaddrs (),
+.BR freeifaddrs (),
+and
+.BR inet_ntop (3).
+Here is an example output:
+.in
+\&
+.nf
+[lo] family 17, see <bits/socket.h>
+[eth0] family 17, see <bits/socket.h>
+[eth1] family 17, see <bits/socket.h>
+[lo] 127.0.0.1
+[lo] 127.0.0.2
+[eth1] 192.168.6.4
+[lo] ::1
+[eth1] fe80::213:ceff:fee5:da26
+.fi
+.in
+.SS Program source
+\&
+.nf
+#include <arpa/inet.h>
+#include <ifaddrs.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+int main(void)
+{
+    struct ifaddrs *ifaddr;
+    if (getifaddrs(&ifaddr) < 0) {
+        perror("getifaddrs");
+        return EXIT_FAILURE;
+    }
+    while (ifaddr) {
+        char buf[256];
+        snprintf(buf, sizeof(buf), "family %d, see <bits/socket.h>",
+            ifaddr->ifa_addr->sa_family);
+        if (ifaddr->ifa_addr->sa_family == AF_INET) {
+            inet_ntop(AF_INET, &((struct sockaddr_in *)
+                        ifaddr->ifa_addr)->sin_addr,
+                      buf, sizeof(buf));
+        } else if (ifaddr->ifa_addr->sa_family == AF_INET6) {
+            inet_ntop(AF_INET6, &((struct sockaddr_in6 *)
+                        ifaddr->ifa_addr)->sin6_addr,
+                      buf, sizeof(buf));
+        }
+        printf("[%s] %s\\n", ifaddr->ifa_name, buf);
+        ifaddr = ifaddr->ifa_next;
+    }
+    freeifaddrs(ifaddr);
+    return EXIT_SUCCESS;
+}
+.fi
+.SH SEE ALSO
+.BR bind (2),
+.BR getsockname (2),
+.BR socket (2),
+.BR packet (7),
+.BR ifconfig (8)
diff --git a/man3/inet_ntop.3 b/man3/inet_ntop.3
index 7de0ffa..e93f51c 100644
--- a/man3/inet_ntop.3
+++ b/man3/inet_ntop.3
@@ -110,8 +110,13 @@ but 2.2 and later have
 .SH BUGS
 .B AF_INET6
 converts IPv4-mapped IPv6 addresses into an IPv6 format.
+
+The interface is painful to use since it does not operate on
+sockaddrs, as apparent from the first example.
 .SH EXAMPLE
 See
+.BR getifaddrs (3)
+and
 .BR inet_pton (3).
 .SH "SEE ALSO"
 .BR getnameinfo (3),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
