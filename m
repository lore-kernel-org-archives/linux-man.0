From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memusage.1: tfix
Date: Fri, 27 Feb 2015 07:50:34 +0100
Message-ID: <54F013BA.6080806@gmail.com>
References: <1424960605-31766-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424960605-31766-1-git-send-email-namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/26/2015 03:23 PM, Namhyung Kim wrote:
> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thank you, Namhyung Kim. Applied.

Cheers,

Michael


> ---
>  man1/memusage.1 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man1/memusage.1 b/man1/memusage.1
> index 1bcb758..2e477f5 100644
> --- a/man1/memusage.1
> +++ b/man1/memusage.1
> @@ -163,7 +163,7 @@ Also trace
>  .BR mmap (2),
>  .BR mremap (2),
>  and
> -.BR mmap (2).
> +.BR munmap (2).
>  .TP
>  .BI \-?\fR,\ \fB\-\-help
>  Print help and exit.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
