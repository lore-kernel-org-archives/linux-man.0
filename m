From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mq_getattr.3: fix section number of mq_overview
Date: Tue, 06 Jan 2015 08:06:52 +0100
Message-ID: <54AB898C.4020904@gmail.com>
References: <CALhU9tkhPnvRf+qehekifg45S1ppGWe4EAj+1tDusCHmL0OQDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tkhPnvRf+qehekifg45S1ppGWe4EAj+1tDusCHmL0OQDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Patch applied. Thank you!

Cheers,

Michael

On 01/04/2015 10:32 PM, Akihiro Motoki wrote:
> diff --git a/man3/mq_getattr.3 b/man3/mq_getattr.3
> index 3dc66be..dc6372c 100644
> --- a/man3/mq_getattr.3
> +++ b/man3/mq_getattr.3
> @@ -90,7 +90,7 @@ Both of these fields must have a value greater than zero.
>  Two
>  .I /proc
>  files that place ceilings on the values for these fields are described in
> -.BR mq_overview (3).
> +.BR mq_overview (7).
> 
>  The
>  .I mq_curmsgs
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
