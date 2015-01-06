From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: statfs.2: format fix
Date: Tue, 06 Jan 2015 08:08:56 +0100
Message-ID: <54AB8A08.6030000@gmail.com>
References: <CALhU9tndNX-vuBtL+u0R35_DZwwgxzwzUAqh5KsPYD2YOrPOvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tndNX-vuBtL+u0R35_DZwwgxzwzUAqh5KsPYD2YOrPOvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Patch applied. Thank you!

Cheers,

Michael

On 01/05/2015 01:33 AM, Akihiro Motoki wrote:
> diff --git a/man2/statfs.2 b/man2/statfs.2
> index 490d96d..8269a19 100644
> --- a/man2/statfs.2
> +++ b/man2/statfs.2
> @@ -143,8 +143,8 @@ Filesystem types:
>  .in
>  .PP
>  Most of these MAGIC constants are defined in
> -.I /usr/include/linux/magic.h
> -some are hardcoded in kernel sources.
> +.IR /usr/include/linux/magic.h ,
> +and some are hardcoded in kernel sources.
>  .PP
>  Nobody knows what
>  .I f_fsid
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
