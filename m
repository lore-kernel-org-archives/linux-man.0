From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] msgop.2: remove EAGAIN as msgrcv errno
Date: Mon, 09 Mar 2015 10:05:08 +0100
Message-ID: <54FD6244.9040701@gmail.com>
References: <1424993760-15047-1-git-send-email-wfp5p@worldbroken.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424993760-15047-1-git-send-email-wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/27/2015 12:36 AM, wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org wrote:
> From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>

Thanks, Bill. Applied.

Cheers,

Michael


> The list of errnos for msgrcv lists both EAGAIN and ENOMSG as the
> errno for no message available with the IPC_NOWAIT flag.  ENOMSG is
> the errno that will be set.
> 
> Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
> ---
>  man2/msgop.2 | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/man2/msgop.2 b/man2/msgop.2
> index d1bd2125344d..286c9965d595 100644
> --- a/man2/msgop.2
> +++ b/man2/msgop.2
> @@ -417,12 +417,6 @@ and does not have the
>  .B CAP_IPC_OWNER
>  capability.
>  .TP
> -.B EAGAIN
> -No message was available in the queue and
> -.B IPC_NOWAIT
> -was specified in
> -.IR msgflg .
> -.TP
>  .B EFAULT
>  The address pointed to by
>  .I msgp
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
