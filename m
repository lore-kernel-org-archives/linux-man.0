From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] inet_pton.3: Mention byte order
Date: Wed, 18 May 2016 22:36:20 +0200
Message-ID: <c7e11344-b0ab-3ec0-49e4-0e66bc3f9530@gmail.com>
References: <CACKs7VAgKPUOp7+_0NzWujruw0fsMF0L+UnsNqV=zsfmF+tqrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACKs7VAgKPUOp7+_0NzWujruw0fsMF0L+UnsNqV=zsfmF+tqrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Stefan,

On 05/12/2016 09:16 AM, Stefan Puiu wrote:
> Hi,
> 
> I was a bit stumped recently to realize that both inet_ntop() and
> inet_pton() work with addresses in network byte order.

Yes, that's correct.

> inet_ntop.3
> mentions that, and the example from inet_pton(), as far as I can tell,
> implies that you can call inet_ntop() on the result of inet_pton(), so
> the byte order needs to match, but I think it's better to mention this
> explicitly in the man page text. 

Yes, it should be mentioned.

> How about this (patch against git)?

Following up in next mail...

Cheers,

Michael


> diff --git a/man3/inet_pton.3 b/man3/inet_pton.3
> index 4ff16b9..8b1017e 100644
> --- a/man3/inet_pton.3
> +++ b/man3/inet_pton.3
> @@ -64,6 +64,8 @@ and copied to
>  which must be
>  .I sizeof(struct in_addr)
>  (4) bytes (32 bits) long.
> +.IR dst
> +is written in network byte order.
>  .TP
>  .B AF_INET6
>  .I src
> 
> Thanks,
> Stefan.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> .
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
