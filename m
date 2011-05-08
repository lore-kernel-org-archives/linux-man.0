From: Luis Javier Merino <ninjalj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: clarification on siginterrupt(3)
Date: Sun, 8 May 2011 22:10:05 +0200
Message-ID: <BANLkTikpHjPgG8yyc0gGYTuQ2AgNxU7WqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

I'm not sure on the meaning of the following excerpt from
siginterrupt(3), in particular the last sentence:

"If the flag argument is false (0), then system
 calls will be restarted if interrupted by the specified signal sig.  This is
 the default behavior in Linux.  However, when a new signal handler is
 specified with the signal(2) function, the system call is interrupted by
 default."

I interpret the second sentence ("This is the default behavior in
Linux") as meaning that signal(2) by default is equivalent to
sigaction(2) with SA_RESTART set. The last sentence seems to mean the
opposite, which is untrue in the default case. So, what was the intent
of that sentence?

I came across this on a question at StackOverflow:
http://stackoverflow.com/questions/5929309/recvfrom-timeout-with-alarm/5929386#5929386
the "wrongness" of the manpage was first noticed by Zachary Weinberg.

Regards,
--
ninjalj
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
