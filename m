From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] llseek.2: wfix
Date: Wed, 27 May 2015 11:12:32 +0200
Message-ID: <55658A80.40900@gmail.com>
References: <1432567241-8825-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432567241-8825-1-git-send-email-namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Namhyung Kim

On 05/25/2015 05:20 PM, Namhyung Kim wrote:
> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/llseek.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/llseek.2 b/man2/llseek.2
> index da674df..2426315 100644
> --- a/man2/llseek.2
> +++ b/man2/llseek.2
> @@ -61,7 +61,7 @@ It returns the resulting file position in the argument
>  .IR result .
>  
>  This system call exists on various 32-bit platforms to support
> -seeking lo large file offsets.
> +seeking large file offsets.

Thanks for the patch. But the right fix is to fix a typo s/lo/to/.
I've made that change.

Cheers,

Michael

>  .SH RETURN VALUE
>  Upon successful completion,
>  .BR _llseek ()
> 

H

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
