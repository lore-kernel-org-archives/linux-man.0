From: Celelibi <celelibi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: getline and signals
Date: Fri, 24 Feb 2012 01:24:50 +0100
Message-ID: <CAJR2zJ-hhMyCts77VStD3T-Q=N-J+cD=7q0MdF=AeqFr2iDvng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

My manpage version is 3.32 on debian system, but I believe this is
version independant.

I would just like to point out that the man getline does not specify
the behavior when it is interrupted by a signal.
What actually happen is that it returns -1 and set errno to EINTR (as
we could expect even if not stated in the manpage). Additionnally it
sets the error flag of the input stream, thus preventing further call
to getline to succeed unless a clearerr() call is performed.

AFAIK the manpage strictly describe the POSIX behavior, thus I think
this kind of information may be added in a linux/glibc specific
section.

More generally, it seems that no stdio function has a description of
what happen when they are interrupted by a signal. That's quite
annoying since a lot of them are blocking and thus are subject to
signal interruption.

Best regards,
Celelibi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
