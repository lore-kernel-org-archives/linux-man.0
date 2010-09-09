From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 18132] New: ipv6(7) describes IP_PKTINFO, but should be
 IP_RECVPKTINFO instead
Date: Thu, 9 Sep 2010 06:26:40 GMT
Message-ID: <bug-18132-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=18132

           Summary: ipv6(7) describes IP_PKTINFO, but should be
                    IP_RECVPKTINFO instead
           Product: Documentation
           Version: unspecified
    Kernel Version: 2.6.32
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: cameron-IvVilBYyKXnB6jxDxCEJHA@public.gmane.org
        Regression: No


Created an attachment (id=29412)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=29412)
Small wrapper library around recvmsg

According to the ipv6(7) manual page:

       IPV6_PKTINFO
              Set delivery of the IPV6_PKTINFO  control  message  on  incoming
              datagrams.   Only  allowed  for  SOCK_DGRAM or SOCK_RAW sockets.
              Argument is a pointer to a boolean value in an integer.

COLOPHON
       This page is part of release 3.23 of the Linux  man-pages  project.   A
       description  of  the project, and information about reporting bugs, can
       be found at http://www.kernel.org/doc/man-pages/.

(This is on Ubuntu 10.04, 32-bit)

Thus, the following code should work, assuming an IPv6 UDP socket has been
created:

int on = 1
setsockopt(sock, IPPROTO_IPV6, IPV6_PKTINFO, &on, sizeof on)

Yet, instead we see that the system call fails, with errno saying EINVAL. Here
is strace output demonstrating this:

socket(PF_INET6, SOCK_DGRAM, IPPROTO_UDP) = 3
bind(3, {sa_family=AF_INET6, sin6_port=htons(8421), inet_pton(AF_INET6, "::",
&sin6_addr), sin6_flowinfo=0, sin6_scope_id=0}, 28) = 0
setsockopt(3, SOL_IPV6, IPV6_PKTINFO, [1], 4) = -1 EINVAL (Invalid argument)

According to Steven's Unix Network Programming, volume 1 (third ed.), in
section 7.2, which lists a set of socket options, there is an IPV6_RECVPKTINFO,
as well as things like IPV6_RECVHOPLIMIT and others, which are different to the
ones without the RECV sub-prefix. From the description therein, it would appear
that IPV6_PKTINFO is a "sticky" option (I haven't read much into that).

cscope verifies that they are indeed different on this system:

(in netinet/in.h)

#define IPV6_RECVPKTINFO        49
#define IPV6_PKTINFO            50
#define IPV6_RECVHOPLIMIT       51
#define IPV6_HOPLIMIT           52

Using IPV6_RECVPKTINFO, we get the following strace

socket(PF_INET6, SOCK_DGRAM, IPPROTO_UDP) = 3
bind(3, {sa_family=AF_INET6, sin6_port=htons(8421), inet_pton(AF_INET6, "::",
&sin6_addr), sin6_flowinfo=0, sin6_scope_id=0}, 28) = 0
setsockopt(3, SOL_IPV6, 0x31 /* IPV6_??? */, [1], 4) = 0
recvmsg(3, {msg_name(28)={sa_family=AF_INET6, sin6_port=htons(41202),
inet_pton(AF_INET6, "::1", &sin6_addr), sin6_flowinfo=0, sin6_scope_id=0},
msg_iov(1)=[{"hi\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
128}], msg_controllen=32, {cmsg_len=32, cmsg_level=SOL_IPV6, cmsg_type=, ...},
msg_flags=0}, 0) = 3


recvfrom_detailed returned value 3
  source family 10 address ::1 port 41202
  destination family 10 address ::1

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
