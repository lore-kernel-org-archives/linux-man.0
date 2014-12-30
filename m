From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] isfdtype.3: wsfix
Date: Tue, 30 Dec 2014 14:42:09 +0100
Message-ID: <54A2ABB1.407@gmail.com>
References: <1419852428-22516-1-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419852428-22516-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/29/2014 12:27 PM, Rasmus Villemoes wrote:
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>

Thanks, Rasmus. Applied.

Cheers,

Michael


> ---
>  man3/isfdtype.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/isfdtype.3 b/man3/isfdtype.3
> index bd7414e..292ecf5 100644
> --- a/man3/isfdtype.3
> +++ b/man3/isfdtype.3
> @@ -31,7 +31,7 @@ isfdtype \- test file type of a file descriptor
>  .B #include <sys/stat.h>
>  .B #include <sys/socket.h>
>  
> -.BI "int isfdtype(int " fd ", int" fdtype );
> +.BI "int isfdtype(int " fd ", int " fdtype );
>  .fi
>  .sp
>  .in -4n
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
