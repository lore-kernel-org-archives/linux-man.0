From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] system.3: wfix
Date: Tue, 7 Nov 2017 23:14:56 +0100
Message-ID: <c1f317f1-e441-677d-1b92-75fae5ad103e@gmail.com>
References: <20171107220948.13675-1-mail@lucaswerkmeister.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171107220948.13675-1-mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Werkmeister <mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/07/2017 11:09 PM, Lucas Werkmeister wrote:
> ---
>  man3/system.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Lukas. Applied.

Cheers,

Michael


> diff --git a/man3/system.3 b/man3/system.3
> index 07d0d92bd..9c66242f9 100644
> --- a/man3/system.3
> +++ b/man3/system.3
> @@ -69,7 +69,7 @@ If
>  .I command
>  is NULL, then
>  .BR system ()
> -returns a status indicating whether a shell is available on the system
> +returns a status indicating whether a shell is available on the system.
>  .SH RETURN VALUE
>  The return value of
>  .BR system ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
