From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] console_ioctl.4: Add K_OFF keyboard mode
Date: Wed, 12 Oct 2016 08:52:14 +0200
Message-ID: <ba562029-5e0e-8881-a6d3-e569be66dacc@gmail.com>
References: <20161010204700.GA2111@mkoskar.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161010204700.GA2111-B9lWeqBdd0FBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miroslav Koskar <mk-B9lWeqBdd0FBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Miroslav

On 10/10/2016 10:47 PM, Miroslav Koskar wrote:
> In addition to the already documented keyboard modes (K_RAW, K_XLATE,
> K_MEDIUMRAW, and K_UNICODE) there is also K_OFF one, defined for
> KDGKBMODE and KDSKBMODE ioctl requests in <linux/kd.h>.

Thanks. Applied.

Cheers,

Michael

> ---
>  man4/console_ioctl.4 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
> index bb138ea..7f2e12b 100644
> --- a/man4/console_ioctl.4
> +++ b/man4/console_ioctl.4
> @@ -371,6 +371,7 @@ K_RAW	0x00
>  K_XLATE	0x01
>  K_MEDIUMRAW	0x02
>  K_UNICODE	0x03
> +K_OFF	0x04
>  .TE
>  .TP
>  .B KDSKBMODE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
