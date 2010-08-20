From: Johannes Stezenbach <js-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>
Subject: SO_NO_CHECK socket option
Date: Fri, 20 Aug 2010 19:49:17 +0200
Message-ID: <20100820174917.GA18018@sig21.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

according to RFC 768 the UDP checksum is optional, and
indeed the kernel has support for the SO_NO_CHECK socket
option (boolean: 0 == default, calculate checksum on xmit,
1 == do not calculate checksum on xmit).

Maybe you would like to add this to socket(7).


Thanks
Johannes
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
