From: Tobias Klausmann <klausman-MzPq5hiN5PY4ErOGf3VzIA@public.gmane.org>
Subject: Bug in socket(7) man page
Date: Mon, 7 Aug 2017 13:53:42 +0200
Message-ID: <20170807115342.GA54528@skade.schwarzvogel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

This bug pertains to the manpage as visible on man7.org right
now.

The socket(7) man page has this paragraph:

       SO_RXQ_OVFL (since Linux 2.6.33)
              Indicates that an unsigned 32-bit value ancillary message (cmsg) should be attached to
              received skbs indicating the number of packets dropped by the socket between the  last
              received packet and this received packet.

The second half is wrong: the counter (internally,
SOCK_SKB_CB(skb)->dropcount is *not* reset after every packet.
That is, it is a proper counter, not a gauge, in monitoring
parlance.

A better version of that paragraph:

       SO_RXQ_OVFL (since Linux 2.6.33)
              Indicates that an unsigned 32-bit value ancillary message (cmsg) should be attached to
              received skbs indicating the number of packets dropped by the socket since its
	      creation.

Regards,
Tobias
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
