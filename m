From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] cacheflush.2: spfix
Date: Thu, 26 Feb 2015 06:54:01 +0100
Message-ID: <54EEB4F9.8040508@gmail.com>
References: <1424717657-9580-1-git-send-email-wfp5p@worldbroken.com> <1424717657-9580-2-git-send-email-wfp5p@worldbroken.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424717657-9580-2-git-send-email-wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
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
>  man2/cacheflush.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index a8196d4b1927..e38154ec9a82 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -82,7 +82,7 @@ standard.
>  .SS Caveat
>  .BR cacheflush ()
>  should not be used in programs intended to be portable.
> -On Linux, this call first appeared on the MIPS archititecture,
> +On Linux, this call first appeared on the MIPS architecture,
>  but nowadays, Linux provides a
>  .BR cacheflush ()
>  system call on some other architectures, but with different arguments.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
