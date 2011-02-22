From: Mikel Ward <mikel-pSK+WyAkGS32eFz/2MeuCQ@public.gmane.org>
Subject: [PATCH] ip(7): Attempt to clarify wording of sin_addr versus sin_addr.s_addr
Date: Tue, 22 Feb 2011 22:04:01 +1100
Message-ID: <AANLkTin7DrRnTMwKF6YWJH47AFy6GcDQGApoaRBETc2O@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi

I think the wording in ip(7) regarding how to set an address based on
INADDR_ANY or the return value of inet_aton(3) is misleading.

    sin_addr is the IP host address.  The s_addr member of  struct  in_addr
    contains  the  host  interface  address in network byte order.  in_addr
    should be assigned one of the INADDR_* values (e.g., INADDR_ANY) or set
    using  the  inet_aton(3),  inet_addr(3), inet_makeaddr(3) library func-
    tions or directly with the name resolver (see gethostbyname(3)).

The way I read it, it suggests I can do:

    struct sockaddr_in sin;
    sin.sin_addr = INADDR_ANY;

but I have to do:

    struct sockaddr_in sin;
    sin.sin_addr.s_addr = INADDR_ANY;

The key thing part is where it says "in_addr" where I would expect "s_addr".

Other suggestions:
- mention inet_makeaddr(3) separately from inet_aton(3) and inet_addr(3)
  because they have different return types
- consider mentioning getaddrinfo(3) instead of gethostbyname(3) because
  the latter is obsolete according to its own man page

Here's some suggested alternative wording:

    sin_addr is the IP host address.  The s_addr member of  struct  in_addr
    contains  the  host  interface  address  in network byte order.  s_addr
    should be assigned one of the INADDR_* values (e.g., INADDR_ANY) or set
    using inet_aton(3) or inet_addr(3).  Alternatively, sin_addr can be set
    using inet_makeaddr(3), or sockaddr_in can be set using  the  structure
    returned by getaddrinfo(3).

And a patch against git:


---
 man7/ip.7 |   20 +++++++++++++-------
 1 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/man7/ip.7 b/man7/ip.7
index 4561b2f..0399a24 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -150,17 +150,23 @@ The
 member of
 .I struct in_addr
 contains the host interface address in network byte order.
-.I in_addr
+.I s_addr
 should be assigned one of the
 .BR INADDR_*
 values (e.g.,
 .BR INADDR_ANY )
-or set using the
-.BR inet_aton (3),
-.BR inet_addr (3),
-.BR inet_makeaddr (3)
-library functions or directly with the name resolver (see
-.BR gethostbyname (3)).
+or set using
+.BR inet_aton (3)
+or
+.BR inet_addr (3).
+Alternatively,
+.I sin_addr
+can be set using
+.BR inet_makeaddr (3),
+or
+.I sockaddr_in
+can be set using the structure returned by
+.BR getaddrinfo (3).

 IPv4 addresses are divided into unicast, broadcast
 and multicast addresses.
--
1.5.6.5
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
