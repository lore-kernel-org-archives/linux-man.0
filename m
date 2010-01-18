From: Edward Welbourne <eddy-4vTceeIZeJ0AvxtiuMwx3w@public.gmane.org>
Subject: Re: rtnetlink(3) undeclared variable in example
Date: Mon, 18 Jan 2010 17:24:13 +0100
Message-ID: <E1NWuOj-0007Jh-T7@whorl>
References: <E1NVmKG-0000C6-I5@whorl> <cfd18e0f1001160929i4243f219k8c3c6d017a0094d9@mail.gmail.com>
Reply-To: eddy-4vTceeIZeJ0AvxtiuMwx3w@public.gmane.org
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <cfd18e0f1001160929i4243f219k8c3c6d017a0094d9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(message from Michael Kerrisk on Sat, 16 Jan 2010 18:29:07 +0100)
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org
List-Id: linux-man@vger.kernel.org

> I've applied the patch below,

I also note that the NLMSG_ALIGN line I initially pointed out is
significantly more indented than to match the open paren that
starts the argument list of which it's a part: <suggest>

     req.if.ifi_change = 0xffffffff; /* ???*/
     rta = (struct rtattr *)(((char *) &req) +
-                                  NLMSG_ALIGN(n\->nlmsg_len));
+                            NLMSG_ALIGN(req.nh.nlmsg_len));
     rta\->rta_type = IFLA_MTU;
     rta\->rta_len = sizeof(unsigned int);

</suggest> but it *is* just layout ...

	Eddy.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
