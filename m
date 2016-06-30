From: Robin Kuzmin <kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man Page Simple Error: GETPRIORITY(2)
Date: Thu, 30 Jun 2016 09:41:00 -0700
Message-ID: <CAAztzVGyvDgshzq3+taoYmGcdR2odyyfYvHJz7GkmFQ=RYpNjA@mail.gmail.com>
References: <CAAztzVFFvLPCKe+rXdxBXEBrmtTwL58-JQ0OV2ZcuLueUSYAcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAztzVFFvLPCKe+rXdxBXEBrmtTwL58-JQ0OV2ZcuLueUSYAcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man2/getpriority.2.html     2015-07-23

1.
What I see: "lower priorities cause more favorable scheduling".
What I expect: "lower values (higher priority) cause more favorable scheduling".

2.
What I see: "Only the superuser may lower priorities".
What I expect: "Only the superuser may lower values (boost/increase
the priorities)".

3.
What I see: "The caller attempted to lower a process priority".
What I expect: "The caller attempted to lower a priority value (to
increase a priority)".

4.
Add to section "SEE ALSO" the reference to "nice(2)" -
http://man7.org/linux/man-pages/man2/nice.2.html

Why I think so: The man page GETPRIORITY(2) should be in synch with
nice(2) http://man7.org/linux/man-pages/man2/nice.2.html
Both getpriority(2) and nice(2) are referred by sched(7) section
"SCHED_OTHER: Default Linux time-sharing scheduling" -
http://man7.org/linux/man-pages/man7/sched.7.html.

Robin Kuzmin
kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
