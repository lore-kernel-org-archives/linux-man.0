From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nextafter.3: tfix
Date: Mon, 02 Sep 2013 07:46:57 +0200
Message-ID: <52242651.80106@gmail.com>
References: <1378092662-4207-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378092662-4207-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/02/13 05:31, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Applied. Thanks.

Cheers,

Michael


> ---
>  man3/nextafter.3 | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/nextafter.3 b/man3/nextafter.3
> index 69289d8..5548908 100644
> --- a/man3/nextafter.3
> +++ b/man3/nextafter.3
> @@ -69,7 +69,10 @@ or
>  .ad b
>  .SH DESCRIPTION
>  The
> -.BR nextafter ()
> +.BR nextafter (),
> +.BR nextafterf (),
> +and
> +.BR nextafterl ()
>  functions return the next representable floating-point value following
>  .I x
>  in the direction of
> @@ -89,8 +92,11 @@ the functions return
>  .IR y .
>  
>  The
> -.BR nexttoward ()
> -functions do the same as the
> +.BR nexttoward (),
> +.BR nexttowardf (),
> +and
> +.BR nexttowardl ()
> +functions do the same as the corresponding
>  .BR nextafter ()
>  functions, except that they have a
>  .I "long double"
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
