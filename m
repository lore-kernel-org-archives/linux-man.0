From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] rint.3: Document that halfway cases are rounded to even.
Date: Sun, 22 Mar 2015 20:31:47 +0100
Message-ID: <550F18A3.8090102@gmail.com>
References: <CAEdQ38EGO7wONjO-3qBNm_aWMX+1WOj0xGrRvE81hTpG-xE79w@mail.gmail.com> <1426211007-9986-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426211007-9986-1-git-send-email-mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/13/2015 02:43 AM, Matt Turner wrote:
> Per IEEE-754 rounding rules.
> 
> The round(3) page describes the behavior of rint and nearbyint in the
> halfway cases by saying:
> 
>    These functions round x to the nearest integer, but round halfway
>    cases away from zero [...], instead of to the nearest even integer
>    like rint(3)

Thanks, Matt. Applied.

Cheers,

Michael


> Signed-off-by: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/rint.3 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/rint.3 b/man3/rint.3
> index d1bd302..59402a7 100644
> --- a/man3/rint.3
> +++ b/man3/rint.3
> @@ -94,7 +94,9 @@ format, using the current rounding direction (see
>  .BR fesetround (3))
>  and without raising the
>  .I inexact
> -exception.
> +exception. When the current rounding direction is to nearest, these
> +functions round halfway cases to the even integer in accordance with
> +IEEE-754.
>  .LP
>  The
>  .BR rint (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
