From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtld-audit.7: tfix
Date: Wed, 02 Dec 2015 17:14:47 +0100
Message-ID: <565F18F7.4060704@gmail.com>
References: <1446509897-21059-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446509897-21059-1-git-send-email-namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Namhyung Kim,

I need some explanation here. This is not a simple 
typo fix, I believe. Why do you think the current text 
is wrong?

Cheers,

Michael


On 11/03/2015 01:18 AM, Namhyung Kim wrote:
> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man7/rtld-audit.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/rtld-audit.7 b/man7/rtld-audit.7
> index d0f7563..643bc57 100644
> --- a/man7/rtld-audit.7
> +++ b/man7/rtld-audit.7
> @@ -400,7 +400,7 @@ If different
>  invocations for this symbol return different values,
>  then the maximum returned value is used.
>  The
> -.BR la_pltenter ()
> +.BR la_pltexit ()
>  function is called only if this buffer is
>  explicitly set to a suitable value.
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
