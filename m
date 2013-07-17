From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getmntent.3: tfix
Date: Thu, 18 Jul 2013 01:32:35 +0200
Message-ID: <51E72993.7020209@gmail.com>
References: <1374096281-19350-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374096281-19350-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

Cheers,

Michael


On 07/17/13 23:24, Simon Paillard wrote:
> ---
>  man3/getmntent.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/getmntent.3 b/man3/getmntent.3
> index e8ca467..29de035 100644
> --- a/man3/getmntent.3
> +++ b/man3/getmntent.3
> @@ -66,7 +66,7 @@ _BSD_SOURCE || _SVID_SOURCE
>  These routines are used to access the file system description file
>  .I /etc/fstab
>  and the mounted file system description file
> -.IR etc/mtab .
> +.IR /etc/mtab .
>  .PP
>  The
>  .BR setmntent ()
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
