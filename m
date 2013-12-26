From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mcheck.3: typo in compiler flag
Date: Fri, 27 Dec 2013 07:28:18 +1300
Message-ID: <52BC7542.1000905@gmail.com>
References: <1387394893-7789-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387394893-7789-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/19/13 08:28, Simon Paillard wrote:
> See http://bugs.debian.org/732464

Thanks. Applied.

Cheers,

Michael



> Reported-by: Raphael Geissert <geissert-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
>  man3/mcheck.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/mcheck.3 b/man3/mcheck.3
> index 17b38cb..9c52a8e 100644
> --- a/man3/mcheck.3
> +++ b/man3/mcheck.3
> @@ -55,7 +55,7 @@ function must be called before the first call to
>  .BR malloc (3)
>  or a related function.
>  In cases where this is difficult to ensure, linking the program with
> -.IR \-mcheck
> +.IR \-lmcheck
>  inserts an implicit call to
>  .BR mcheck ()
>  (with a NULL argument)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
