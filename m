From: Ryan Mullen <rmmullen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man getrlimit(2) not updated for Linux 3.0
Date: Fri, 29 Jul 2011 21:27:19 -0400
Message-ID: <CAHrWx2wMOmQmi7C-YWsQ=5oSmAeytEaZhqRah_sgx0BTuqF=Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>From man 2 getrlimit:

RLIMIT_CPU
              CPU  time  limit  in seconds.  When the process reaches
the soft limit, it is sent a SIGXCPU signal.  The default action for
this signal is to terminate the process.  However, the signal can be
caught,
              and the handler can return control to the main program.
If the process continues to consume CPU time, it will be sent SIGXCPU
once per second until the hard limit is reached, at which time it is
sent
              SIGKILL.   (This  latter  point  describes  Linux 2.2
through 2.6 behavior.  Implementations vary in how they treat
processes which continue to consume CPU time after reaching the soft
limit.  Portable
              applications that need to catch this signal should
perform an orderly termination upon first receipt of SIGXCPU.)


Instead of defining a window between Linux 2.2 and 2.6, can we not say
"This latter point describes behavior since Linux 2.2" to avoid the
versioning headaches, especially now that we're on 3.0? Note that I
haven't confirmed whether this behavior has changed for 3.0 - I'm
expecting it hasn't.

Regards,
Ryan Mullen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
