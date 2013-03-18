From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: aio_return (3) feedback.
Date: Mon, 18 Mar 2013 12:26:04 +0000
Message-ID: <CAGc9EvcKtZE54EQDSN6n73WaMfjqK-2ejSBxqFodBVstbbZcEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael

Some feedback about this page:

http://www.kernel.org/doc/man-pages/online/pages/man3/aio_return.3.html

Quoting:
=========
ERRORS
       EINVAL aiocbp does not point at a control block for an asynchronous I/O
              request of which the return status has not been retrieved yet.
=========

This text would be clearer if not using negatives!

How about changing to this?

       "EINVAL aiocbp points at a control block for an asynchronous I/O
              request of which the return status has already been retrieved."


This text could also be updated on aio_error (3) if you agree with this change.

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
