From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] ilogb.3: spfix
Date: Fri, 27 Feb 2015 07:51:23 +0100
Message-ID: <54F013EB.7060005@gmail.com>
References: <1424717657-9580-1-git-send-email-wfp5p@worldbroken.com> <1424717657-9580-4-git-send-email-wfp5p@worldbroken.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424717657-9580-4-git-send-email-wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/23/2015 07:54 PM, wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org wrote:
> From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>

Thanks, Bill. Applied.

Cheers,

Michael


> Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
> ---
>  man3/ilogb.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/ilogb.3 b/man3/ilogb.3
> index 0e8b8d7ebeca..03e3ffe8178a 100644
> --- a/man3/ilogb.3
> +++ b/man3/ilogb.3
> @@ -152,7 +152,7 @@ The domain error case where
>  .I x
>  is 0 or a NaN did not cause
>  .I errno
> -to be set or (on some achitectures) raise a floating-point exception.
> +to be set or (on some architectures) raise a floating-point exception.
>  .IP * 3
>  The domain error case where
>  .I x
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
