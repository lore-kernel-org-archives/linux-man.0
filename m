From: Tanaka Akira <akr-Z4CJNWi2dO8@public.gmane.org>
Subject: man7/ip.7: The argument for IP_MULTICAST_IF socket option
Date: Wed, 16 Feb 2011 15:41:48 +0900
Message-ID: <AANLkTin0LUpyFaL=siDNEK-wEqVFwEFsu8B_KQ=cd7Aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi.

I found a problem in man7/ip.7 in man-pages-3.32.tar.bz2.
(I also checked man-pages git repository and the text is not changed.)

ip(7) describes that the argument for IP_MULTICAST_IF is ip_mreqn or ip_mreq:

   IP_MULTICAST_IF
          Set the local device for a multicast  socket.   Argument  is  an
          ip_mreqn or ip_mreq structure similar to IP_ADD_MEMBERSHIP.

But it should be ip_mreqn or in_addr.
It is different from IP_ADD_MEMBERSHIP.

do_ip_setsockopt() in linux-2.6.37/net/ipv4/ip_sockglue.c supports
struct ip_mreqn and struct in_addr.

|        case IP_MULTICAST_IF:
|        {
|                struct ip_mreqn mreq;
|                struct net_device *dev = NULL;
|
|                if (sk->sk_type == SOCK_STREAM)
|                        goto e_inval;
|                /*
|                 *      Check the arguments are allowable
|                 */
|
|                if (optlen < sizeof(struct in_addr))
|                        goto e_inval;
|
|                err = -EFAULT;
|                if (optlen >= sizeof(struct ip_mreqn)) {
|                        if (copy_from_user(&mreq, optval, sizeof(mreq)))
|                                break;
|                } else {
|                        memset(&mreq, 0, sizeof(mreq));
|                        if (optlen >= sizeof(struct in_addr) &&
|                            copy_from_user(&mreq.imr_address, optval,
|                                           sizeof(struct in_addr)))
|                                break;
|                }

The third argument of copy_from_user() is sizeof(mreq) and
sizeof(struct in_addr).
The former is sizeof(struct mreqn) because the type of mreq is struct mreqn.

The code copies struct mreqn or struct in_addr from user space.
So, I think Linux supports struct mreqn and struct in_addr for IP_MULTICAST_IF.

At the original API of BSD multicast, IP_MULTICAST_IF takes struct in_addr.
http://www.kohala.com/start/mcast.api.txt :

        struct in_addr addr;
        setsockopt(sock, IPPROTO_IP, IP_MULTICAST_IF, &addr, sizeof(addr))

Note that I also reported this problem to
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=607979
-- 
Tanaka Akira
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
