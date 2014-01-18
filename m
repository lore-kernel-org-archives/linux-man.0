From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Missing "int" in mq_timedreceive and mq_timedsend prototypes?
Date: Sat, 18 Jan 2014 23:28:43 +1300
Message-ID: <CAKgNAkirGaps5vndXE9QLfHqJfAvkZBdH9aS9fBAz4EOcF+K-A@mail.gmail.com>
References: <52DA5024.5070905@truelite.it>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52DA5024.5070905-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jan 18, 2014 at 10:57 PM, Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org> wrote:
> Hi,
>
> both prototypes (I'l looking in the web pages, like
> http://man7.org/linux/man-pages/man2/mq_timedsend.2.html) reports
> "unsigned msg_prio" as  msg_prio parameter type, but definition inside
> /usr/include/mqueue.h use (for esample for  mq_timedreceive) unsigned
> int __msg_prio

Hello Simone,

Fixed!

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
