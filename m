From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] crypt.3: ffix
Date: Mon, 03 Mar 2014 05:51:00 +0100
Message-ID: <53140A34.2050102@gmail.com>
References: <1393685978-23268-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393685978-23268-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 03/01/2014 03:59 PM, Simon Paillard wrote:
> ---
>  man3/crypt.3 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 0999532..9baa80a 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -168,7 +168,8 @@ function was not implemented, probably because of U.S.A. export restrictions.
>  .\" to be considered insecure for the given reasons.
>  .TP
>  .B EPERM
> -.I /proc/sys/crypto/fips_enabled has a nonzero value,
> +.I /proc/sys/crypto/fips_enabled
> +has a nonzero value,
>  and an attempt was made to use a weak encryption type, such as DES.
>  .SH ATTRIBUTES
>  .SS Multithreading (see pthreads(7))
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
