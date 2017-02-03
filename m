From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] core.5: tfix
Date: Fri, 3 Feb 2017 16:40:48 +1300
Message-ID: <7bc1512e-a818-4e0f-8252-c54e552a2c96@gmail.com>
References: <20170201202846.1815-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201202846.1815-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/02/2017 09:28 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael


> ---
>  man5/core.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/core.5 b/man5/core.5
> index 582886cab..8a34ebf3c 100644
> --- a/man5/core.5
> +++ b/man5/core.5
> @@ -240,7 +240,7 @@ Since kernel 2.6.19, Linux supports an alternate syntax for the
>  file.
>  If the first character of this file is a pipe symbol (\fB|\fP),
>  then the remainder of the line is interpreted as the command-line for
> -a a user-space program (or script) that is to be executed.
> +a user-space program (or script) that is to be executed.
>  Instead of being written to a disk file, the core dump is given as
>  standard input to the program.
>  Note the following points:
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
