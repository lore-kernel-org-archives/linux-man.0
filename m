From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Drop localedef.1 --old-style description
Date: Sun, 12 Jun 2016 12:54:48 +0200
Message-ID: <79951c07-b1ac-a1e5-b0d7-bf57b1c1e8b8@gmail.com>
References: <575C0C8B.5050103@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575C0C8B.5050103-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/11/2016 03:05 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> the glibc upstream decided to drop localedef(1) --old-style option [1]
> altogether, I think we can do the same with localedef(1), the option
> hasn't done anything in over 16 years and I doubt anyone uses it.

Thanks, Marko. Applied.

Cheers,

Michael


> 1) https://sourceware.org/git/?p=glibc.git;a=commit;h=6a54bcda7a2a64e465992a9984785443fd594743
> 
> ---
>  man1/localedef.1 | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/man1/localedef.1 b/man1/localedef.1
> index 204a7f6..f8b1f63 100644
> --- a/man1/localedef.1
> +++ b/man1/localedef.1
> @@ -216,9 +216,6 @@ the archive would be placed in
>  Write the output files even if warnings were generated about the input
>  file.
>  .TP
> -.B \-\-old\-style
> -This option is a no-op and preserved only for backward compatibility.
> -.TP
>  .BR \-v ", " \-\-verbose
>  Generate extra warnings about errors that are normally ignored.
>  .TP
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
