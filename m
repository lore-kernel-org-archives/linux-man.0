From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fmin.3: tfix
Date: Thu, 01 Aug 2013 11:26:47 +0200
Message-ID: <51FA29D7.6000202@gmail.com>
References: <1375151961-24855-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375151961-24855-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

Cheers,

Michael



On 07/30/13 04:39, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fmin.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/fmin.3 b/man3/fmin.3
> index 74d78b0..db0de06 100644
> --- a/man3/fmin.3
> +++ b/man3/fmin.3
> @@ -38,7 +38,7 @@ or
>  .RE
>  .ad
>  .SH DESCRIPTION
> -These functions the lesser value of
> +These functions return the lesser value of
>  .I x
>  and
>  .IR y .
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
