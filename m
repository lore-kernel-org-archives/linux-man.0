From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: aio_cancel
Date: Mon, 3 Oct 2011 23:03:49 +0100
Message-ID: <CAGc9Evf=94fyfYM67q0BRJCN=vu14aYV91pE+Hw=uhgkVS5p5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

I have a query about the ask about the aio_cancel description please.

http://man7.org/linux/man-pages/online/pages/man3/aio_cancel.3.html

"Normal asynchronous notification occurs for canceled requests.  The request
       return status is set to -1, and the request error status is set
to ECANCELED."

I would like to ask about this description. Could the detail of
"request return status" and "request error status" be described
please.

My assumption

"request return status" -- perhaps the value returned by aio_return()?
"request error status" -- not sure. maybe aio_error() ?

Thank you for taking a look into this.

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
