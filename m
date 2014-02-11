From: Kalle Olavi Niemitalo <kon-X3B1VOXEql0@public.gmane.org>
Subject: sigvec(3): example uses sigpause instead of sigmask
Date: Tue, 11 Feb 2014 22:59:00 +0200
Message-ID: <87ppmt8iy3.fsf@Niukka.kon.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In man-pages 3.58, sigvec(3) contains this example of sigmask:

           vec.sv_mask = sigmask(SIGQUIT) | sigpause(SIGABRT);
                       /* Block SIGQUIT and SIGABRT during
                          handler execution */

The second call should be sigmask(SIGABRT).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
