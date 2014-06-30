From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: aiocb member aio_offset is off_t which is a signed 32bit int
Date: Mon, 30 Jun 2014 11:51:30 +0100
Message-ID: <CAGc9Evc1oZkCYfYAkYU+fNA=9-Q+T+sgdj8qWuTctZjjvUdxEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello mtk

Is it worth clarifying something on this page:

http://man7.org/linux/man-pages/man7/aio.7.html

off_t           aio_offset;     /* File offset */

Could clarify that off_t on a 32bit system will be a signed 32bit
integer, meaning the maximum seek size is 2GB.

I think this means that aio can only be used to access files up to
2GB. There isn't an off64_t version like lseek64()

Regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
