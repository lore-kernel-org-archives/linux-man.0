From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpwnam.3: tfix
Date: Tue, 16 Jul 2013 08:20:19 +0200
Message-ID: <51E4E623.8020006@gmail.com>
References: <1373913780-25846-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373913780-25846-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.


On 07/15/13 20:43, Simon Paillard wrote:
> ---
>  man3/getpwnam.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
> index 9ee31d6..ae986a8 100644
> --- a/man3/getpwnam.3
> +++ b/man3/getpwnam.3
> @@ -220,7 +220,7 @@ The functions
>  .BR getpwnam ()
>  and
>  .BR getpwuid ()
> -are not thread_safe.
> +are not thread-safe.
>  .LP
>  The functions
>  .BR getpwnam_r ()
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
