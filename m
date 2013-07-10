From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fabs.3: ffix
Date: Wed, 10 Jul 2013 20:00:17 +0200
Message-ID: <51DDA131.50202@gmail.com>
References: <1373427475-1072-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373427475-1072-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/10/13 05:37, Peng Haitao wrote:
> "The fabs() functions" should be replaced with "These functions".
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks. Applied.

Cheers,

Michael


> ---
>  man3/fabs.3 | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/man3/fabs.3 b/man3/fabs.3
> index a907fa6..d608915 100644
> --- a/man3/fabs.3
> +++ b/man3/fabs.3
> @@ -62,9 +62,7 @@ or
>  .RE
>  .ad b
>  .SH DESCRIPTION
> -The
> -.BR fabs ()
> -functions return the absolute value of the floating-point
> +These functions return the absolute value of the floating-point
>  number
>  .IR x .
>  .SH RETURN VALUE
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
