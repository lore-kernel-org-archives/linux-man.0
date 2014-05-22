From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stdio.3: tfix
Date: Thu, 22 May 2014 08:20:17 +0200
Message-ID: <537D9721.5020107@gmail.com>
References: <1400708118-19390-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400708118-19390-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 05/21/2014 11:35 PM, Simon Paillard wrote:
> See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=748887
> 
> Reported-by: Colin Williams <colinwilliams1968-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/stdio.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/stdio.3 b/man3/stdio.3
> index 6002353..0058819 100644
> --- a/man3/stdio.3
> +++ b/man3/stdio.3
> @@ -106,7 +106,7 @@ opened explicitly:
>  .I standard input
>  (for reading conventional input),
>  .I standard output
> -(for writing conventional input), and
> +(for writing conventional output), and
>  .I standard error
>  (for writing diagnostic output).
>  These streams are abbreviated
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
