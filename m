From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] cmsg: be not --> not be
Date: Sun, 29 Dec 2013 00:34:44 +1300
Message-ID: <52BEB754.4000105@gmail.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com> <1387586263-9002-2-git-send-email-shawn@churchofgit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-2-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Shawn. Applied.

Cheers,

Michael


On 12/21/13 13:37, Shawn Landden wrote:
> Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
> ---
>  man3/cmsg.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/cmsg.3 b/man3/cmsg.3
> index 22057c0..9677233 100644
> --- a/man3/cmsg.3
> +++ b/man3/cmsg.3
> @@ -147,7 +147,7 @@ is a Linux extension.
>  For portability, ancillary data should be accessed using only the macros
>  described here.
>  .BR CMSG_ALIGN ()
> -is a Linux extension and should be not used in portable programs.
> +is a Linux extension and should not be used in portable programs.
>  .PP
>  In Linux,
>  .BR CMSG_LEN (),
> @@ -157,7 +157,7 @@ and
>  are constant expressions (assuming their argument is constant);
>  this could be used to declare the size of global
>  variables.
> -This may be not portable, however.
> +This may not be portable, however.
>  .SH EXAMPLE
>  This code looks for the
>  .B IP_TTL
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
