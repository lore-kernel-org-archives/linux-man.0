From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] vfork.2: wfix
Date: Tue, 27 Sep 2016 11:00:55 +0200
Message-ID: <48c594a2-9a8e-5c75-01bf-a3a80f642a55@gmail.com>
References: <20160926153507.16627-1-wfp5p@worldbroken.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160926153507.16627-1-wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Bill,

Please re-read the original text. It ("that that") is okay, I believe.

Cheers,

Michael


On 09/26/2016 05:35 PM, Bill Pemberton wrote:
> Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
> ---
>  man2/vfork.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/vfork.2 b/man2/vfork.2
> index 6f20900df4ae..ce03bcd67541 100644
> --- a/man2/vfork.2
> +++ b/man2/vfork.2
> @@ -202,7 +202,7 @@ can't be implemented on such systems.
>  .BR vfork ()
>  from the standard; the POSIX rationale for the
>  .BR posix_spawn (3)
> -function notes that that function,
> +function notes that the function,
>  which provides functionality equivalent to
>  .BR fork (2)+ exec (3),
>  is designed to be implementable on systems that lack an MMU.)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
