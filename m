From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: realpath
Date: Mon, 7 Oct 2013 19:01:39 +0100
Message-ID: <CAGc9EvfqDoMqqiZmgEFrHvGys27K6_erxycjqVnmOv8eXRe0uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello mtk

Just looking at this page:

http://man7.org/linux/man-pages/man3/realpath.3.html

I expect realpath could set errno to ENOMEM if malloc failed. POSIX
page says ENOMEM too:

http://pubs.opengroup.org/onlinepubs/009695399/functions/realpath.html

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
