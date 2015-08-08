From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sendfile.2: tfix
Date: Sat, 08 Aug 2015 10:06:35 +0200
Message-ID: <55C5B88B.3000904@gmail.com>
References: <20150808080128.GA7304@glebfm.cloud.tilaa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150808080128.GA7304-N9aU+Tdk7XkoO014n+3aBsY9il7ykmry@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Gleb. Applied.

Cheers,

Michael


On 08/08/2015 10:03 AM, Gleb Fotengauer-Malinovskiy wrote:
> ---
>  man2/sendfile.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/sendfile.2 b/man2/sendfile.2
> index ef9ba6c..93cf7e1 100644
> --- a/man2/sendfile.2
> +++ b/man2/sendfile.2
> @@ -140,7 +140,7 @@ operation is not available for
>  .TP
>  .B EINVAL
>  .I out_fd
> -was has the
> +has the
>  .B O_APPEND
>  flag set.
>  This is not currently supported by
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
