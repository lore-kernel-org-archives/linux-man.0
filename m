From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rint.3: tfix
Date: Mon, 02 Sep 2013 07:37:52 +0200
Message-ID: <52242430.2090806@gmail.com>
References: <1377508383-15065-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377508383-15065-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/26/13 11:13, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Applied. Thanks.

Cheers,

Michael



> ---
>  man3/rint.3 | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/rint.3 b/man3/rint.3
> index 8bb9ba8..f79e990 100644
> --- a/man3/rint.3
> +++ b/man3/rint.3
> @@ -85,7 +85,10 @@ or
>  .ad b
>  .SH DESCRIPTION
>  The
> -.BR nearbyint ()
> +.BR nearbyint (),
> +.BR nearbyintf (),
> +and
> +.BR nearbyintl ()
>  functions round their argument to an integer value in floating-point
>  format, using the current rounding direction (see
>  .BR fesetround (3))
> @@ -94,7 +97,10 @@ and without raising the
>  exception.
>  .LP
>  The
> -.BR rint ()
> +.BR rint (),
> +.BR rintf (),
> +and
> +.BR rintl ()
>  functions do the same, but will raise the
>  .I inexact
>  exception
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
