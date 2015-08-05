From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug report - stat 2 - Description section
Date: Wed, 05 Aug 2015 21:00:15 +0200
Message-ID: <55C25D3F.5010400@gmail.com>
References: <CAP6jbrRRJkdjc3jt3t3sjTFkicmq1Jjrizij5Bw-QUrD=GG6pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP6jbrRRJkdjc3jt3t3sjTFkicmq1Jjrizij5Bw-QUrD=GG6pA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yaarit <yaarit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/05/2015 03:30 PM, Yaarit wrote:
> Hello there,
> 
> I believe there is a small mistake in the *Description* section of these
> man pages:
> http://man7.org/linux/man-pages/man2/stat.2.html
> http://man7.org/linux/man-pages/man2/fstatat.2.html
> http://man7.org/linux/man-pages/man2/lstat.2.html
> http://man7.org/linux/man-pages/man2/stat64.2.html
> http://man7.org/linux/man-pages/man2/lstat64.2.html
> http://man7.org/linux/man-pages/man2/fstat64.2.html
> 
> 
> When referring to the functions' second argument (*struct stat ***buf*) in
> the Description, it reads:
> 
> These functions return information about a file, in the buffer pointed
> to by *stat*.
> 
> instead of:
> 
> These functions return information about a file, in the buffer pointed
> to by *buf*.

Thanks, Yaarit. Fixed.

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
