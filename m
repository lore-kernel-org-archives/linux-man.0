From: Keisial <keisial-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: strftime(3) clarifying the 'current locales'
Date: Mon, 12 Apr 2010 23:29:57 +0200
Message-ID: <4BC390D5.3000709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,
Could you add a note to strftime(3) stating that to take advantage of
locale specific names you need to call setlocale(3) first?
It seems silly when you know it, but wasn't aware that the C locale was
automatically selected on startup (I expected it to be automatically
lazy-loaded, based on the environment vars).
Alternatively, the example could be changed to need a setlocale call,
like strftime(3P) does, so it can at least point in the right direction.

The man page is not wrong on itself, but I don't think that it is to be
expected before you know it that the "current locale" would be
something different than the locale that the user has been seeing
all along its session (or maybe i'm more noob than most
programmers :).

Thanks for your documentation work.
It's really useful!

PS: Please CC in reply.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
