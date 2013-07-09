From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bootparam.7: tfix
Date: Tue, 09 Jul 2013 02:30:24 +0200
Message-ID: <51DB59A0.9090309@gmail.com>
References: <1373319961-7322-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373319961-7322-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/08/13 23:46, Simon Paillard wrote:
> ---
>  man7/bootparam.7 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Applied. Thanks.

Michael




> diff --git a/man7/bootparam.7 b/man7/bootparam.7
> index 18a1410..fa4c5c3 100644
> --- a/man7/bootparam.7
> +++ b/man7/bootparam.7
> @@ -466,7 +466,7 @@ a "normal" ramdisk, which is mounted read-write as root device;
>  then
>  .I /linuxrc
>  is executed; afterward the "real" root file system is mounted,
> -and the initrd file system is moved over tocw
> +and the initrd file system is moved over to
>  .IR /initrd ;
>  finally
>  the usual boot sequence (e.g., invocation of
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
