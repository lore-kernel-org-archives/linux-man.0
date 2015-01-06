From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: shmget.2: format fix
Date: Tue, 06 Jan 2015 08:45:41 +0100
Message-ID: <54AB92A5.8060606@gmail.com>
References: <CALhU9tmwe8YmqU7L1o+ioBsR2LNRkOwtd6sCjd4ygva7qd2G6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tmwe8YmqU7L1o+ioBsR2LNRkOwtd6sCjd4ygva7qd2G6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Thanks for the patch. However, I think I think it is perhaps a little 
better to leave the text as is. The point of the .I is to emphasize
that the unit of this limit is *pages*, while for several of the
other limits it is *bytes*. Does that sound okay?

Cheers,

Michael

On 01/04/2015 10:37 PM, Akihiro Motoki wrote:
> diff --git a/man2/shmget.2 b/man2/shmget.2
> index 213a451..6d318d8 100644
> --- a/man2/shmget.2
> +++ b/man2/shmget.2
> @@ -283,9 +283,7 @@ The following limits on shared memory segment
> resources affect the
>  call:
>  .TP
>  .B SHMALL
> -System-wide limit on the number of
> -.I pages
> -of shared memory.
> +System-wide limit on the number of pages of shared memory.
> 
>  On Linux, this limit can be read and modified via
>  .IR /proc/sys/kernel/shmall .
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
