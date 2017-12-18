From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: usleep man page issue
Date: Mon, 18 Dec 2017 17:20:11 +0100
Message-ID: <64e1ca32-5587-b160-f3f7-8fe0c3763d25@gmail.com>
References: <dce6dd89-90d6-9b8d-c81d-3c6b339cf671@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dce6dd89-90d6-9b8d-c81d-3c6b339cf671-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: erbenton <erbenton-Wuw85uim5zDR7s880joybQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/13/2017 02:16 AM, erbenton wrote:
> Hi,
> 
>    In man 3 usleep
> 
> ERRORS
>         EINTR  Interrupted by a signal; see signal(7).
> 
>         EINVAL usec is not smaller than 1000000.  (On systems where that 
> is considered an error.)
> 
> please change  "is not smaller than" to "is greater than or equal to" as 
> this language is very confusing

Thanks, Eric. Fixed as you suggest.

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
