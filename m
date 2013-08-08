From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ilogb.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 08 Aug 2013 15:03:21 +0200
Message-ID: <52039719.6040306@gmail.com>
References: <1375779560-10388-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375779560-10388-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/06/13 10:59, Peng Haitao wrote:
> The functions ilogb(), ilogbf() and ilogbl() are thread safe.

Thanks. Applied.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ilogb.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/ilogb.3 b/man3/ilogb.3
> index a4624a3..481099b 100644
> --- a/man3/ilogb.3
> +++ b/man3/ilogb.3
> @@ -26,7 +26,7 @@
>  .\"
>  .\" Inspired by a page by Walter Harms created 2002-08-10
>  .\"
> -.TH ILOGB 3 2010-09-20 "" "Linux Programmer's Manual"
> +.TH ILOGB 3 2013-08-06 "" "Linux Programmer's Manual"
>  .SH NAME
>  ilogb, ilogbf, ilogbl \- get integer exponent of a floating-point value
>  .SH SYNOPSIS
> @@ -143,6 +143,14 @@ or raise an exception for this case.
>  .\" or raise an exception?
>  .\" log(), log2(), log10() do set errno
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6794
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR ilogb (),
> +.BR ilogbf (),
> +and
> +.BR ilogbl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
