From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: strlcat
Date: Fri, 26 Sep 2014 12:23:03 +0100
Message-ID: <CAGc9EvdKM01n2Lxe-J2R3GskqyzEz-GT2_5H52z5qdBw80_r+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man3/strcat.3.html

Hello
This page describes the BSD strlcat. It uses different terminology for
the null terminating byte. I think it is worth updating the
description to be the same as others i.e.

"terminating null byte"

Is it worth adding strlcpy() to the page as well?

Also, is it worth mentioning that it will leave a string partially
updated, when the count is reached. ie. that it doesn't do strlen(src)
to check it will fit in the available dst space before concatenating
part of it.

Regards, Jonny
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
