From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] openpty.3: tfix
Date: Fri, 22 Sep 2017 10:05:26 +0200
Message-ID: <00eed3bf-858f-af09-d8b9-3639d1d8db5d@gmail.com>
References: <20170921214800.10824-1-julien@arista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170921214800.10824-1-julien-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien Gomes <julien-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/21/2017 11:48 PM, Julien Gomes wrote:
> Signed-off-by: Julien Gomes <julien-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>

Thanks, Julien! Applied.

Cheers,

Michael


> ---
>  man3/openpty.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/openpty.3 b/man3/openpty.3
> index 45e5a8257..c35a74bcb 100644
> --- a/man3/openpty.3
> +++ b/man3/openpty.3
> @@ -103,7 +103,7 @@ descriptor of the master side of the pseudoterminal is returned in
>  If
>  .I name
>  is not NULL, the buffer it points to is used to return the
> -the filename of the slave.
> +filename of the slave.
>  The
>  .I termp
>  and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
