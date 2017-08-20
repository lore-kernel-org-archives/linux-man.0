From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCTH 0/2] pthread_mutexattr_setrobust() and pthread_mutex_consistent()
Date: Sun, 20 Aug 2017 17:42:06 +0800
Message-ID: <CAJYFCiMZN09HaHpvKgxz3mqzmcaXAWmkz=BmgOW9WVdRKOhDsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,
This patch series introduce three pthread functions for linux-man:
    * pthread_mutexattr_setrobust()
    * pthread_mutexattr_getrobust()
    * pthread_mutex_consistent()

I put pthread_mutexattr_setrobust() and pthread_mutexattr_getrobust()
altogether since they are related.

I obtain my information about these functions mainly from reading the
glibc source code and do some testing. There might be some mistake,
but they are mostly correct (95% or so).

Following this email would be those man pages in plain text and nroff
format. I have tested those nroff file on my Linux box using man, and
it look pretty well. Please point out if there are any mistake in
formatting.

Yubin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
