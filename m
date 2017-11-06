From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] proc.5: ffix
Date: Mon, 6 Nov 2017 22:23:59 +0100
Message-ID: <e99d57a1-58dc-f4ad-4753-07a82badd372@gmail.com>
References: <20171105190451.16059-1-mail@lucaswerkmeister.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171105190451.16059-1-mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Werkmeister <mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/05/2017 08:04 PM, Lucas Werkmeister wrote:
> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Lucas. Patch applied.

Cheers,

Michael

> diff --git a/man5/proc.5 b/man5/proc.5
> index eeba1cfe6..01be63417 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -671,7 +671,7 @@ and
>  in
>  .IR /proc/self/fd .
>  Thus the example command above could be written as:
> -.PP
> +.IP
>  .in +4n
>  .EX
>  .RB "$" " foobar \-i /dev/stdin \-o /dev/stdout ..."
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
