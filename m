From: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Subject: Missing "int" in mq_timedreceive and mq_timedsend prototypes?
Date: Sat, 18 Jan 2014 10:57:56 +0100
Message-ID: <52DA5024.5070905@truelite.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

both prototypes (I'l looking in the web pages, like
http://man7.org/linux/man-pages/man2/mq_timedsend.2.html) reports
"unsigned msg_prio" as  msg_prio parameter type, but definition inside
/usr/include/mqueue.h use (for esample for  mq_timedreceive) unsigned
int __msg_prio

Regards
Simone
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
