From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Clarification for man 7 packet: sll_family is used for binding.
Date: Sun, 10 May 2015 13:03:02 +0200
Message-ID: <554F3AE6.6030201@gmail.com>
References: <BANLkTi=ZhuSVkOEGsV8G+DT+SJjBgSpQAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTi=ZhuSVkOEGsV8G+DT+SJjBgSpQAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cortland Setlow <cortland.setlow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Cortland,

On 06/16/2011 07:55 PM, Cortland Setlow wrote:
> Hi,
> 
> In the packet (7) manpage ( I retrieved the HTML version from
> kernel.orgtoday ) it says
> "For bind only sll_protocol and sll_ifindex are used." but I get EINVAL
> unless I also
> use sll_family.  Could you amend this sentence to say that sll_family is
> used for binding?
> 
> Granted, the man page already says that sll_family is always AF_PACKET,
> but it wasn't very clear to me.  Either way, best regards.

Long after the fact...

Agreed it would be helpful to mention 'sll_family' here. I've added it.

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
