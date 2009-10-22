From: Sergei Zhirikov <sfzhi-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: A bug in rtnetlink(3) man page?
Date: Thu, 22 Oct 2009 04:06:51 -0700 (PDT)
Message-ID: <655865.6909.qm@web112304.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi all,

I believe there is a bug in rtnetlink(3) man page (http://www.kernel.org/doc/man-pages/online/pages/man3/rtnetlink.3.html). There seem to be an error in the example code (the EXAMPLE section). The line:

rta->rta_len = sizeof(unsigned int);

should be:

rta->rta_len = RTA_LENGTH(sizeof(unsigned int));

Can anyone please confirm if I'm right?

Thank you.
With kind regards,
Sergei.



      
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
