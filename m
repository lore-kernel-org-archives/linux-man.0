From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] getifaddrs.3: New manual page
Date: Wed, 21 Jan 2009 00:48:28 +0100
Message-ID: <20090120234828.GE21648@machine.or.cz>
References: <20081209025634.GD10491@machine.or.cz> <cfd18e0f0901140355j6758cb29i5b356667aedc467@mail.gmail.com> <cfd18e0f0901141527g4518e063p642d0a4464c9804d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0901141527g4518e063p642d0a4464c9804d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "Wichmann, Mats D" <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

  Hi,

On Thu, Jan 15, 2009 at 12:27:14PM +1300, Michael Kerrisk wrote:
> On Tue, Dec 9, 2008 at 3:56 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> > I'm open to relicensing to any of the standard licences, this one
> > should be compatible even with the classic BSD licence.
> 
> By now, I think little, if any, of the BSD page remains.  I'd be
> inclined to switch to the verbatim license?  Okay with you?

  sure.

> .SH ERRORS
> .BR getifaddrs ()
> may fail and set
> .I errno
> for any of the errors specified for
> .BR socket (2),
> .BR bind (2),
> .\" FIXME Petr, I added getsockname() and recvmsg(); do you agree?

  Makes sense.

> .BR getsockname (2),
> .BR recvmsg (2),
> .BR sendto (2),
> .BR malloc (3),
> or
> .BR realloc (3).
> .SH VERSIONS
> The
> .BR getifaddrs ()
> function first appeared in glibc 2.3, but before glibc 2.3.3,
> the implementation only supported IPv4 addresses;
> IPv6 support was added in glibc 2.3.3.

  We might add that support for getting addresses other than IPv4 is
available only if the kernel supports netlink.

> .SH EXAMPLE
> The program below demonstrates the use of
> .BR getifaddrs (),
> .BR freeifaddrs (),
> and
> .BR inet_ntop (3).

  getnameinfo() now.

> Here is what we see when running this program on one system:
> .in +4n
> .nf
> 
> $ \fB./a.out\fP
> lo      address family: 17 (AF_PACKET)
> eth0    address family: 17 (AF_PACKET)
> lo      address family: 2 (AF_INET)
>        address: <127.0.0.1>
> eth0    address family: 2 (AF_INET)
>        address: <10.1.1.4>
> lo      address family: 10 (AF_INET6)
>        address: <::1>
> eth0    address family: 10 (AF_INET6)
>        address: <fe80::2d0:59ff:feda:eb51%eth0>
> .fi
> .in
> .SS Program source
> \&
> .nf
> #include <arpa/inet.h>
> #include <sys/socket.h>
> #include <netdb.h>
> #include <ifaddrs.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> 
> int
> main(int argc, char *argv[])
> {
>    struct ifaddrs *ifaddr;
>    struct net_device_stats *ndsp;

  Unused.

>    int family, s;
>    char host[NI_MAXHOST];
> 
>    if (getifaddrs(&ifaddr) == \-1) {
>        perror("getifaddrs");
>        exit(EXIT_FAILURE);
>    }
> 
>    while (ifaddr != NULL) {    /* Walk through linked list */
>        family = ifaddr\->ifa_addr\->sa_family;
> 
>        /* Display interface name and family (including symbolic
>           form of the latter for the common families) */
> 
>        printf("%\-6s  address family: %d%s\\n",

  I'd %s\t here instead, personally.

>                ifaddr\->ifa_name, family,
>                (family == AF_PACKET) ? " (AF_PACKET)" :
>                (family == AF_INET) ?   " (AF_INET)" :
>                (family == AF_INET6) ?  " (AF_INET6)" : "");
> 
>        /* For an AF_INET* interface address, display the address */
> 
>        if (family == AF_INET || family == AF_INET6) {
>            s = getnameinfo(ifaddr\->ifa_addr,
>                    (family == AF_INET) ? sizeof(struct sockaddr_in) :
>                                          sizeof(struct sockaddr_in6),
>                    host, NI_MAXHOST, NULL, 0, NI_NUMERICHOST);
>            if (s != 0) {
>                printf("getnameinfo() failed: %s\\n", gai_strerror(s));
>                exit(EXIT_FAILURE);
>            }

  I have mixed feelings about this test, since superfluous tests IMHO
obscure the example. Not sure if it can actually ever fail...

>            printf("\\taddress: <%s>\\n", host);
>        }
> 
>        ifaddr = ifaddr\->ifa_next;
>    }
> 
>    freeifaddrs(ifaddr);
>    exit(EXIT_SUCCESS);
> }

-- 
				Petr "Pasky" Baudis
The average, healthy, well-adjusted adult gets up at seven-thirty
in the morning feeling just terrible. -- Jean Kerr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
