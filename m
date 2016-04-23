From: Egmont Koblinger <egmont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: getlogin(3): mention loginuid
Date: Sat, 23 Apr 2016 23:00:21 +0200
Message-ID: <CAGWcZkJFZZQgCAs4JnnGBj1jSh9aYdBiDUhRA+yj1Wx64H0xXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

I just got to know about /proc/self/loginuid, as well as getlogin(3)
referring to this file prior to utmp, by browsing this bug:
https://bugzilla.redhat.com/show_bug.cgi?id=1328947 (esp. comments
13-17 are relevant).

getlogin(3)'s manual page does not mention this at all. (And, for the
record, neither does proc(5), it has a FIXME comment about it).

Could you please fill in this gap?

Thanks a lot,
egmont
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
