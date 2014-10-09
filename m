From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Non utf8 characters in page standards.7
Date: Thu, 9 Oct 2014 12:24:18 +0100
Message-ID: <CAGc9EveXMqUoTRDtjWE0h6rqXNcchdxghJZ9DMd0xR399aZMBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man7/standards.7.html

Hello
I noticed this page has come corrupt bytes in HTML source:

under the auspices of the Austin group
??<a href="http://www.opengroup.org/austin/">http://www.opengroup.org/austin/</a>??.


See ?? in my quote above.

In hex, the bytes are E2 9F A8  and  E2 9F A9

Any ideas?

There are other occurances with other links too. may affect other pages too

Regards, Jonny

-- 
Jonny  jg-hus3n9K41k0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
