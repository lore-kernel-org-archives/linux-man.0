From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: aio(7) and the aio_* pages
Date: Mon, 3 Oct 2011 19:34:17 +0100
Message-ID: <CAGc9Evcy_gas=qGzJp7gq_9DUCq7ff3SRfkfbuuF=Nbfz3eWhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

I noticed that aio(7) contains a description of the each function,
e.g. aio_read(3). I noticed that descriptions are a little different.
Could the text be the same for both? I don't intend this to sound
pedantic! The pages are great :)


e.g.

http://man7.org/linux/man-pages/online/pages/man7/aio.7.html

"aio_cancel(3)   Attempt to cancel outstanding I/O requests on a specified file
                       descriptor."

"aio_suspend(3)  Suspend the caller until one or more of a specified set of I/O
                       requests completes."



http://man7.org/linux/man-pages/online/pages/man3/aio_cancel.3.html
"aio_cancel - cancel an outstanding asynchronous I/O request"

http://man7.org/linux/man-pages/online/pages/man3/aio_suspend.3.html
"aio_suspend - wait for asynchronous I/O operation or timeout"


Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
