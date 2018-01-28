From: Egmont Koblinger <egmont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: abort(3) and flushing
Date: Sun, 28 Jan 2018 22:35:03 +0100
Message-ID: <CAGWcZkL5By_n8Z7Oa9jzLf75id1kK+cbOBbe84kkMsmEAqEd+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

I accidentally came across this:

The abort(3) man page says "[...] all open streams are closed and flushed"

With glibc-2.27, to be released pretty soon now, file descriptors will
no longer be flushed. See near the bottom of
https://sourceware.org/glibc/wiki/Release/2.27 .


cheers,
egmont
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
