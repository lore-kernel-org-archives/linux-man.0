From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: struct aiocb structure man page
Date: Thu, 16 Sep 2010 12:20:03 +0100
Message-ID: <AANLkTimurYOmpjhewOJTKnR1LNeFA9E4JY+kAPn6uh5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

http://www.kernel.org/doc/man-pages/online/pages/man3/aio_write.3.html

Is it possible to also hyperlink the "struct aiocb" to the structure?

I would also be interested in SIGEV_THREAD documentation.

To give an example of some code. we set this macro within the aiocb structure:

aio.aio_sigevent.sigev_notify = SIGEV_THREAD;

I only found this page about SIGEV_THREAD :
http://www.kernel.org/doc/man-pages/online/pages/man2/timer_create.2.html

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
