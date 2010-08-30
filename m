From: Peter Stuge <peter-Y+HMSxxDrH8@public.gmane.org>
Subject: mq_send(3) copypaste error
Date: Mon, 30 Aug 2010 21:34:21 +0200
Message-ID: <20100830193421.28262.qmail@stuge.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello, both mq_send(3) and mq_receive(3) in 3.25 read as follows:

--8<--
ERRORS
       EAGAIN The queue was empty, and the O_NONBLOCK flag  was  set  for  the
              message queue description referred to by mqdes.
-->8--

This is only accurate for mq_receive(). For mq_send() I think

s/empty/full/

would be in place. Thanks!


//Peter
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
