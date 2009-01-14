From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] getifaddrs.3: New manual page
Date: Thu, 15 Jan 2009 12:27:14 +1300
Message-ID: <cfd18e0f0901141527g4518e063p642d0a4464c9804d@mail.gmail.com>
References: <20081209025634.GD10491@machine.or.cz>
	 <cfd18e0f0901140355j6758cb29i5b356667aedc467@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901140355j6758cb29i5b356667aedc467-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: "Wichmann, Mats D" <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += "Wichmann, Mats D" <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>]

Hello Petr,

On Tue, Dec 9, 2008 at 3:56 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> This patch adds documentation for the getifaddrs() and freeifaddrs()
> functions as they are supported in GNU libc. The manual page is based
> on the original BSD manpage (with licence as it appears on the top
> of the file), but is significantly rewritten for Linux manpages
> standards and containing all the differences. A simple example is
> provided.

I've taken your page and done some heavy editing, including rewriting
the example program.

> I'm open to relicensing to any of the standard licences, this one
> should be compatible even with the classic BSD licence.

By now, I think little, if any, of the BSD page remains.  I'd be
inclined to switch to the verbatim license?  Okay with you?

> I did not do actually any testing on BSD systems about how exactly
> this call behaves, I have only tried to figure this out from their
> chaotic documentation and it wouldn't surprise me if it would in
> fact behave the same as with glibc now.  I cannot remember hostnames
> of the BSD systems I used to have an account on. ;-)
>
> Few pages are cross-linked to point at getifaddrs(3) now, and
> inet_ntop() got another example pointer.

In my example program, getnameinfo() is used, rather than inet_ntop().

> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> ---
>
> I will understand if you choose to remove my BUGS note in inet_ntop().
> ;-)
>
> By the way, it is real pain to find resources like the list of standard
> licences on the web page... you just remember you have seen it once but
> to click through to it again is a challenge.

Thanks for noting that.  I will add another link on the web site, to help this.

My revised version of the page below.  Could you take a look please.

Cheers,

Michael

.\" Copyright (c) 1995, 1999
.\"     Berkeley Software Design, Inc.  All rights reserved.
.\" Copyright (c) 2008 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
.\" and copyright (c) 2009, Linux Foundation, written by Michael Kerrisk
.\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" 1. Redistributions of source code must retain the above copyright
.\"    notice, this list of conditions and the following disclaimer.
.\"
.\" THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. ``AS IS'' AND
.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
.\" ARE DISCLAIMED.  IN NO EVENT SHALL Berkeley Software Design, Inc. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
.\" SUCH DAMAGE.
.\"
.\" 2008-12-08 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
.\"    Rewrite the BSD manpage in the Linux man pages style and account
.\"    for glibc specificities, provide an example.
.\" 2009-01-14 mtk, many edits and changes, rewrote example program.
.\"
.TH GETIFADDRS 3 2009-01-14 "GNU" "Linux Programmer's Manual"
.SH NAME
getifaddrs, freeifaddrs \- get interface addresses
.SH SYNOPSIS
.nf
.B #include <sys/types.h>
.B #include <ifaddrs.h>
.sp
.BI "int getifaddrs(struct ifaddrs **" "ifap" );
.sp
.BI "void freeifaddrs(struct ifaddrs *" "ifa" );
.fi
.SH DESCRIPTION
The
.BR getifaddrs ()
function creates a linked list of structures describing
the network interfaces of the local system,
and stores the address of the first item of the list in
.IR *ifap .
The list consists of
.I ifaddrs
structures, defined as follows:
.sp
.in +4n
.nf
struct ifaddrs {
   struct ifaddrs  *ifa_next;    /* Next item in list */
   char            *ifa_name;    /* Name of interface */
   unsigned int     ifa_flags;   /* Flags from SIOCGIFFLAGS */
   struct sockaddr *ifa_addr;    /* Address of interface */
   struct sockaddr *ifa_netmask; /* Netmask of interface */
   union {
       struct sockaddr *ifu_broadaddr;
                        /* Broadcast address of interface */
       struct sockaddr *ifu_dstaddr;
                        /* Point-to-point destination address */
   } ifa_ifu;
#define              ifa_broadaddr ifa_ifu.ifu_broadaddr
#define              ifa_dstaddr   ifa_ifu.ifu_dstaddr
   void            *ifa_data;    /* Address-specific data */
};
.fi
.in
.PP
The
.I ifa_next
field contains a pointer to the next structure on the list,
or NULL if this is the last item of the list.
.PP
The
.I ifa_name
points to the null-terminated interface name.
.\" The constant
.\" .B IF NAMESIZE
.\" indicates the maximum length of this field.
.PP
The
.I ifa_flags
field contains the interface flags, as returned by the
.B SIOCGIFFLAGS
.BR ioctl (2)
operation (see
.BR netdevice (7)
for a list of these flags).
.PP
The
.I ifa_addr
field points to a structure containing the interface address.
(The
.I sa_family
sub-field should be consulted to determine the format of the
address structure.)
.PP
The
.I ifa_netmask
field points to a structure containing the netmask associated with
.IR ifa_addr ,
if applicable for the address family.
.PP
Depending on whether the bit
.B IFF_BROADCAST
or
.B IFF_POINTOPOINT
is set in
.I ifa_flags
(only one can be set at a time),
either
.I ifa_broadaddr
will contain the broadcast address associated with
.I ifa_addr
(if applicable for the address family) or
.I ifa_dstaddr
will contain the destination address of the point-to-point interface.
.PP
The
.I ifa_data
field points to a buffer containing address-family-specific data;
this field may be NULL if there is no such data for this interface.
.PP
The data returned by
.BR getifaddrs ()
is dynamically allocated and should be freed using
.BR freeifaddrs ()
when no longer needed.
.SH RETURN VALUES
On success,
.BR getifaddrs ()
returns zero;
on error, -1 is returned, and
.I errno
is set appropriately.
.SH ERRORS
.BR getifaddrs ()
may fail and set
.I errno
for any of the errors specified for
.BR socket (2),
.BR bind (2),
.\" FIXME Petr, I added getsockname() and recvmsg(); do you agree?
.BR getsockname (2),
.BR recvmsg (2),
.BR sendto (2),
.BR malloc (3),
or
.BR realloc (3).
.SH VERSIONS
The
.BR getifaddrs ()
function first appeared in glibc 2.3, but before glibc 2.3.3,
the implementation only supported IPv4 addresses;
IPv6 support was added in glibc 2.3.3.
.SH CONFORMING TO
Not in POSIX.1-2001.
This function first appeared in BSDi and is
present on the BSD systems, but with slightly different
semantics documented\(emreturning one entry per interface,
not per address.
This means
.I ifa_addr
and other fields can actually be NULL if the interface has no address,
and no link-level address is returned if the interface has an IP address
assigned.
Also, the way of choosing either
.I ifa_broadaddr
or
.I ifa_dstaddr
differs on various sytems.
.\" , but the BSD-derived documentation generally
.\" appears to be confused and obsolete on this point.
.\" i.e., commonly it still says one of them will be NULL, even if
.\" the ifa_ifu union is already present
.SH NOTES
The addresses returned on Linux will usually be the IPv4 and IPv6 addresses
assigned to the interface, but also one
.B AF_PACKET
address per interface containing lower-level details about the interface
and its physical layer.
In this case, the
.I ifa_data
field may contain a pointer to a
.IR "struct net_device_stats" ,
defined in
.IR <linux/netdevice.h> ,
which contains various interface attributes and statistics.
.SH EXAMPLE
The program below demonstrates the use of
.BR getifaddrs (),
.BR freeifaddrs (),
and
.BR inet_ntop (3).
Here is what we see when running this program on one system:
.in +4n
.nf

$ \fB./a.out\fP
lo      address family: 17 (AF_PACKET)
eth0    address family: 17 (AF_PACKET)
lo      address family: 2 (AF_INET)
       address: <127.0.0.1>
eth0    address family: 2 (AF_INET)
       address: <10.1.1.4>
lo      address family: 10 (AF_INET6)
       address: <::1>
eth0    address family: 10 (AF_INET6)
       address: <fe80::2d0:59ff:feda:eb51%eth0>
.fi
.in
.SS Program source
\&
.nf
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netdb.h>
#include <ifaddrs.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main(int argc, char *argv[])
{
   struct ifaddrs *ifaddr;
   struct net_device_stats *ndsp;
   int family, s;
   char host[NI_MAXHOST];

   if (getifaddrs(&ifaddr) == \-1) {
       perror("getifaddrs");
       exit(EXIT_FAILURE);
   }

   while (ifaddr != NULL) {    /* Walk through linked list */
       family = ifaddr\->ifa_addr\->sa_family;

       /* Display interface name and family (including symbolic
          form of the latter for the common families) */

       printf("%\-6s  address family: %d%s\\n",
               ifaddr\->ifa_name, family,
               (family == AF_PACKET) ? " (AF_PACKET)" :
               (family == AF_INET) ?   " (AF_INET)" :
               (family == AF_INET6) ?  " (AF_INET6)" : "");

       /* For an AF_INET* interface address, display the address */

       if (family == AF_INET || family == AF_INET6) {
           s = getnameinfo(ifaddr\->ifa_addr,
                   (family == AF_INET) ? sizeof(struct sockaddr_in) :
                                         sizeof(struct sockaddr_in6),
                   host, NI_MAXHOST, NULL, 0, NI_NUMERICHOST);
           if (s != 0) {
               printf("getnameinfo() failed: %s\\n", gai_strerror(s));
               exit(EXIT_FAILURE);
           }
           printf("\\taddress: <%s>\\n", host);
       }

       ifaddr = ifaddr\->ifa_next;
   }

   freeifaddrs(ifaddr);
   exit(EXIT_SUCCESS);
}
.fi
.SH SEE ALSO
.BR bind (2),
.BR getsockname (2),
.BR socket (2),
.BR packet (7),
.BR ifconfig (8)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
