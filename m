From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sk98lin.4: tfix
Date: Tue, 11 Feb 2014 09:59:41 +0100
Message-ID: <52F9E67D.4050203@gmail.com>
References: <1391808260-2295-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391808260-2295-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael

On 02/07/2014 10:24 PM, Simon Paillard wrote:
> ---
>  man4/sk98lin.4 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man4/sk98lin.4 b/man4/sk98lin.4
> index 43b3be3..5541ed9 100644
> --- a/man4/sk98lin.4
> +++ b/man4/sk98lin.4
> @@ -268,7 +268,7 @@ This parameter indicates the duplex mode to be used for port B
>  of an adapter card.
>  Possible values are:
>  .IR Half ,
> -.IR Full .
> +.IR Full ,
>  or
>  .IR Both ;
>  .I Both
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
