From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] io_submit.2: acknowledge possibility of short return
Date: Thu, 14 Sep 2017 14:42:31 +0200
Message-ID: <e2ff5561-9bb3-2b7e-06e8-691451679193@gmail.com>
References: <20170907204428.8344-1-sage@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170907204428.8344-1-sage-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sage Weil <sage-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Sage,

On 09/07/2017 10:44 PM, Sage Weil wrote:
> Note that the return value may be a value less than nr
> if not all iocbs were queued at once.  This would have saved
> me an embarrassing amount of time.

Thanks. Applied!

Cheers,

Michael


> Signed-off-by: Sage Weil <sage-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>   man2/io_submit.2 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/io_submit.2 b/man2/io_submit.2
> index 36465b64b..77ba34671 100644
> --- a/man2/io_submit.2
> +++ b/man2/io_submit.2
> @@ -32,7 +32,7 @@ which will be submitted to context \fIctx_id\fP.
>   On success,
>   .BR io_submit ()
>   returns the number of \fIiocb\fPs submitted (which may be
> -0 if \fInr\fP is zero).
> +less than \fInr\fP, or 0 if \fInr\fP is zero).
>   For the failure return, see NOTES.
>   .SH ERRORS
>   .TP
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
