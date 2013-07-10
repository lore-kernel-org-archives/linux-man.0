From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] _syscall.2: ffix
Date: Wed, 10 Jul 2013 19:58:42 +0200
Message-ID: <51DDA0D2.7020402@gmail.com>
References: <1373400451-26243-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373400451-26243-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Simon.

Michael

On 07/09/13 22:07, Simon Paillard wrote:
> ---
>  man2/_syscall.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/_syscall.2 b/man2/_syscall.2
> index 9a79108..c29ca55 100644
> --- a/man2/_syscall.2
> +++ b/man2/_syscall.2
> @@ -105,7 +105,7 @@ System calls are not required to return only positive or negative error
>  codes.
>  You need to read the source to be sure how it will return errors.
>  Usually, it is the negative of a standard error code,
> -for example, i
> +for example,
>  .RI \- EPERM .
>  The _syscall() macros will return the result
>  .I r
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
