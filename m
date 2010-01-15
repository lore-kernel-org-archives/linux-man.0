From: Edward Welbourne <eddy-4vTceeIZeJ0AvxtiuMwx3w@public.gmane.org>
Subject: rtnetlink(3) undeclared variable in example
Date: Fri, 15 Jan 2010 14:34:56 +0100
Message-ID: <E1NVmKG-0000C6-I5@whorl>
Reply-To: eddy-4vTceeIZeJ0AvxtiuMwx3w@public.gmane.org
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In man 3 rtnetlink, the example code includes the lines:

           rta = (struct rtattr *)(((char *) &req) +
                                         NLMSG_ALIGN(n->nlmsg_len));

in which the variable "n" is nowhere declared.  It seems likely that
NLMSG_ALIGN(req.nh.nlmsg_len) was intended, albeit I am so deeply
ignorant of relevant systems that I am learning about them by reading
man pages, so I may easilly be wrong ...

I am also acutely aware of the bug already noted on the man page, but
you clearly already know about that one !

	Eddy.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
