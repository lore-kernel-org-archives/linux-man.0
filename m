From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getline.3: document ENOMEM error case
Date: Tue, 27 Dec 2016 17:41:29 +0100
Message-ID: <096c2ba5-ce76-8c44-c8e0-77f994052954@gmail.com>
References: <1482850896-85601-1-git-send-email-jannh@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482850896-85601-1-git-send-email-jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/27/2016 04:01 PM, Jann Horn wrote:
> see the error handling in libio/iogetdelim.c
> 
> Signed-off-by: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Thanks, Jann. Applied.

Cheers,

Michael



> ---
>  man3/getline.3 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/man3/getline.3 b/man3/getline.3
> index 7020777..5f1d9c8 100644
> --- a/man3/getline.3
> +++ b/man3/getline.3
> @@ -134,6 +134,9 @@ or
>  is NULL, or
>  .I stream
>  is not valid).
> +.TP
> +.B ENOMEM
> +Allocation or reallocation of the line buffer failed.
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
