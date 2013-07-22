From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] finite.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 22 Jul 2013 12:58:36 +0200
Message-ID: <51ED105C.8080705@gmail.com>
References: <1374476333-7199-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374476333-7199-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/22/13 08:58, Peng Haitao wrote:
> The functions finite(), finitef(), finitel(), isinf(), isinff(),
> isinfl(), isnan(), isnanf() and isnanl() are thread safe.

Thanks, Peng Haitao. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/finite.3 | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/finite.3 b/man3/finite.3
> index a308fd2..72b8646 100644
> --- a/man3/finite.3
> +++ b/man3/finite.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH FINITE 3  2008-08-05 "" "Linux Programmer's Manual"
> +.TH FINITE 3  2013-07-22 "" "Linux Programmer's Manual"
>  .SH NAME
>  finite, finitef, finitel, isinf, isinff, isinfl, isnan, isnanf, isnanl \-
>  BSD floating-point classification functions
> @@ -109,6 +109,20 @@ functions return 1 if
>  is positive infinity, \-1 if
>  .I x
>  is negative infinity, and 0 otherwise.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR finite (),
> +.BR finitef (),
> +.BR finitel (),
> +.BR isinf (),
> +.BR isinff (),
> +.BR isinfl (),
> +.BR isnan (),
> +.BR isnanf (),
> +and
> +.BR isnanl ()
> +functions are thread-safe.
>  .SH NOTES
>  Note that these functions are obsolete.
>  C99 defines macros
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
