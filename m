From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] memfd_create.2: spfix
Date: Thu, 26 Feb 2015 06:54:30 +0100
Message-ID: <54EEB516.80905@gmail.com>
References: <1424717657-9580-1-git-send-email-wfp5p@worldbroken.com> <1424717657-9580-3-git-send-email-wfp5p@worldbroken.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424717657-9580-3-git-send-email-wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/23/2015 07:54 PM, wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org wrote:
> From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>


Thanks, Bill. Applied.

Cheers,

Michael


> Change "behaviour" to American spelling "behavior".
> 
> Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
> ---
>  man2/memfd_create.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/memfd_create.2 b/man2/memfd_create.2
> index 06c86012a516..e661336103e5 100644
> --- a/man2/memfd_create.2
> +++ b/man2/memfd_create.2
> @@ -69,7 +69,7 @@ and as such multiple files can have the same name without any side effects.
>  
>  The following values may be bitwise ORed in
>  .IR flags
> -to change the behaviour of
> +to change the behavior of
>  .BR memfd_create ():
>  .TP
>  .BR MFD_CLOEXEC
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
