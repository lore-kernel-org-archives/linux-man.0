From: Andrew Hunter <andrewhhunter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: typo in man pthread_sigqueue
Date: Thu, 12 Sep 2013 14:40:31 -0700
Message-ID: <CANf_6TjALmwh=oLA99aTvNeabX6knei8dQvcDYt=LTW_ZtaQkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The type of pthread_sigqueue is reported in the manpage (both online
and in any package I can find) as

       int pthread_sigqueue(pthread_t *thread, int sig,
                            const union sigval value);

I believe this is incorrect; thread is a pthread_t, not a pthread_t*.
This can be easily verified by looking at the source:
http://www.eglibc.org/cgi-bin/viewvc.cgi/trunk/libc/nptl/sysdeps/unix/sysv/linux/pthread_sigqueue.c?view=markup

(Or just by noting that throughout pthreads, pthread_ts are passed by
value.  The only other pthread_t * that comes to mind is the one
initialized by pthread_create.)

I'd send a patch myself but I'm not clear where the manpages sources
are and don't have time to go searching right now--my apologies.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
