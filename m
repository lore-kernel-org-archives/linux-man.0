From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getenv.3: wfix
Date: Fri, 27 Jan 2017 08:46:33 +1300
Message-ID: <01fd3990-fe07-fa17-8ec7-71ab2c5d576e@gmail.com>
References: <CANXoondEx4ggqjscYDkmDWJwgk4JpTgW0h3Wk3tgJgEL8xv_ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANXoondEx4ggqjscYDkmDWJwgk4JpTgW0h3Wk3tgJgEL8xv_ZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Kline <ekline-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/26/2017 11:17 PM, Erik Kline wrote:
> diff --git a/man3/getenv.3 b/man3/getenv.3
> index 1bfb39677..c801f3924 100644

Hello Erik,

Thanks for the patch. Somehow it was corrupt, so I applied the
change manually.

Cheers,

Michael


> --- a/man3/getenv.3
> +++ b/man3/getenv.3
> @@ -76,7 +76,7 @@ the effective capability bit was set on the
> executable file; or
>  .IP *
>  the process has a nonempty permitted capability set.
>  .PP
> -Secure execution may also required if triggered
> +Secure execution may also be required if triggered
>  by some Linux security modules.
> 
>  The
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
