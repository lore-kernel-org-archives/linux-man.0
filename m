From: "Matwey V. Kornilov" <matwey.kornilov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: possible bug: open(2) ebusy
Date: Sat, 18 Feb 2012 09:12:22 +0300
Message-ID: <CAJs94EaN5fzE7Q7gJoW8hcOaMcKRM3nBV_rzQKRZVgRV-Dm24A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear man-pages maintainers,


I am not sure that this is really bug, but look at this:

http://man7.org/linux/man-pages/man2/open.2.html
open(2) version 2011-09-08

and also look at that:

http://man7.org/linux/man-pages/man4/tty_ioctl.4.html
tty_ioctl(4) version 2008-10-29


As it stated in tty_ioctl(4), if a terminal is set into exclusive mode
by TIOCEXCL then open fails with EBUSY. It is how it really works on
my linux-system. But open(2) says nothing about returning EBUSY,
except statement about block devices in O_EXCL section. I was really
confused by this situation when I got EBUSY at open() and tried to
understand what was happening from open(2) man-page. Is it possible to
add a brief note about EBUSY and TIOCEXCL into open(2)? I think it
would be helpful for other people.


-- 
With best regards,
Matwey V. Kornilov
http://0x2207.blogspot.com
xmpp:0x2207-962d5TIgE1qHXe+LvDLADg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
