From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bootparam.7: ffix
Date: Tue, 09 Jul 2013 02:29:49 +0200
Message-ID: <51DB597D.1000901@gmail.com>
References: <1373319298-5130-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373319298-5130-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/08/13 23:34, Simon Paillard wrote:
> ---
>  man7/bootparam.7 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

Michael


> diff --git a/man7/bootparam.7 b/man7/bootparam.7
> index ecfd3c5..1c5bfe6 100644
> --- a/man7/bootparam.7
> +++ b/man7/bootparam.7
> @@ -188,7 +188,7 @@ use 'root=/dev/fd1'.
>  
>  The root device can be specified symbolically or numerically.
>  A symbolic specification has the form
> -.I /dev/XXYN,
> +.IR /dev/XXYN ,
>  where XX designates
>  the device type ('hd' for ST-506 compatible hard disk, with Y in
>  \&'a'-'d'; 'sd' for SCSI compatible disk, with Y in 'a'-'e';
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
