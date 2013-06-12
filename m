From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] siginterrupt.3: tfix missing dot
Date: Wed, 12 Jun 2013 15:10:41 +0200
Message-ID: <51B87351.901@gmail.com>
References: <1370980770-25405-1-git-send-email-spaillard@debian.org> <1370980770-25405-2-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370980770-25405-2-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.


On 06/11/13 21:59, Simon Paillard wrote:
> ---
>  man3/siginterrupt.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/siginterrupt.3 b/man3/siginterrupt.3
> index 56a8b91..bdf8b21 100644
> --- a/man3/siginterrupt.3
> +++ b/man3/siginterrupt.3
> @@ -73,7 +73,7 @@ amount of data transferred.
>  .SH RETURN VALUE
>  The
>  .BR siginterrupt ()
> -function returns 0 on success
> +function returns 0 on success.
>  It returns \-1 if the
>  signal number
>  .I sig
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
