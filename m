From: bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>
Subject: IPV6_RECVPKTINFO fix
Date: Tue, 9 Oct 2012 15:06:32 +0200
Message-ID: <20121009130632.GA16787@xs.powerdns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MGYHOYXEY6WxJCY8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everybody,

Recently PowerDNS needed to support the getting of the original destination
address of packets received on ::. Following the advice in ipv6(7) generated
an error on setsockopt(). 

Some googling confirmed that setsockopt() with IPV6_PKTINFO indeed does not
work, but we found that IPV6_RECVPKTINFO did. 

Our experiences are detailed in
http://bert-hubert.blogspot.nl/2012/10/on-binding-datagram-udp-sockets-to-any.html

Please find attached a quite naive patch to ipv6.7 that at least fixes 'my'
problem, but does not document if IPV6_PKTINFO ever worked as a flag. It
does document that IPV6_RECVPKTINFO is available since 2.6.13.

Please let me know if this patch is acceptable, or if you want me to dig
deeper into the IPV6_PKTINFO situation.

Thanks!

-- 
PowerDNS Website: http://www.powerdns.com/
PowerDNS Community Website: http://wiki.powerdns.com/
PowerDNS is supported and developed by Netherlabs: http://www.netherlabs.nl

--MGYHOYXEY6WxJCY8
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="ip_recvpktinfo.diff"

diff --git a/man7/ipv6.7 b/man7/ipv6.7
index c539083..8c61905 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -141,7 +141,6 @@ structure.
 .\" FIXME IPV6_CHECKSUM is not documented, and probably should be
 .\" FIXME IPV6_JOIN_ANYCAST is not documented, and probably should be
 .\" FIXME IPV6_LEAVE_ANYCAST is not documented, and probably should be
-.\" FIXME IPV6_RECVPKTINFO is not documented, and probably should be
 .\" FIXME IPV6_2292PKTINFO is not documented, and probably should be
 .\" FIXME there are probably many other IPV6_* socket options that
 .\" should be documented
@@ -183,10 +182,10 @@ in an integer.
 Control whether the socket sees multicast packets that it has send itself.
 Argument is a pointer to boolean.
 .TP
-.B IPV6_PKTINFO
+.B IPV6_RECVPKTINFO
 Set delivery of the
 .B IPV6_PKTINFO
-control message on incoming datagrams.
+control message on incoming datagrams. Such control messages contain a struct in6_pktinfo, as per RFC 3542. Available since Linux 2.6.13.
 Only allowed for
 .B SOCK_DGRAM
 or

--MGYHOYXEY6WxJCY8--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
