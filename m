From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: syslog(3) inconsistency
Date: Fri, 24 Mar 2017 15:40:09 +0100
Message-ID: <4f302a52-1098-2b1a-baac-732b15784ee4@gmail.com>
References: <8ab6f0a9-1a71-c776-80a2-5913e941aaf2@mev.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8ab6f0a9-1a71-c776-80a2-5913e941aaf2-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Abbott <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ian,

On 03/23/2017 07:37 PM, Ian Abbott wrote:
> Hi,
> 
> The first parameter of `syslog()` is called `priority` in the man-page, 
> except in the breakdown of the possible log levels, where it is called 
> `level`.

Your report doesn't say clearly which pieces of text you find to
be incorrect, but I wonder if you have missed this sentence in the 
man page:

    The priority argument is formed by ORing the facility and the
    level values (explained below). 

If you still think there's a problem in the man page, could you please
describe the problem in more detail.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
