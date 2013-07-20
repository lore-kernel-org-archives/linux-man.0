From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] console_ioctl.4: ffix
Date: Sat, 20 Jul 2013 22:08:13 +0200
Message-ID: <51EAEE2D.1010005@gmail.com>
References: <1374174000-16740-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374174000-16740-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.

Thanks, Simon,

Cheers,

Michael


On 07/18/13 21:00, Simon Paillard wrote:
> ---
>  man4/console_ioctl.4 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
> index 7f5a444..ddb1d02 100644
> --- a/man4/console_ioctl.4
> +++ b/man4/console_ioctl.4
> @@ -285,7 +285,7 @@ Get full Unicode screen mapping from kernel.
>  .I argp
>  points to an
>  area of size
> -.IR E_TABSZ*sizeof(unsigned short) ,
> +.IR "E_TABSZ*sizeof(unsigned short)" ,
>  which is loaded with the
>  Unicodes each character represent.
>  A special set of Unicodes,
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
