From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] console_ioctl.4: tfix
Date: Tue, 09 Jul 2013 02:30:32 +0200
Message-ID: <51DB59A8.8090703@gmail.com>
References: <1373322466-14811-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373322466-14811-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/09/13 00:27, Simon Paillard wrote:
> ---
>  man4/console_ioctl.4 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Applied. Thanks.

Michael


> diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
> index 5cb3e2f..7f5a444 100644
> --- a/man4/console_ioctl.4
> +++ b/man4/console_ioctl.4
> @@ -213,7 +213,7 @@ and
>  .I charheight
>  are filled with
>  the respective data for the currently loaded font, and the
> -.I hardata
> +.I chardata
>  array contains the font data if the initial value of
>  .I charcount
>  indicated enough space was available; otherwise the
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
