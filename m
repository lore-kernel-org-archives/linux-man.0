From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fabs.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 10 Jul 2013 19:59:51 +0200
Message-ID: <51DDA117.3070802@gmail.com>
References: <1373426986-720-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373426986-720-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/10/13 05:29, Peng Haitao wrote:
> The functions fabs(), fabsf() and fabsl() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thank you. Applied.

Cheers,

Michael



> ---
>  man3/fabs.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/fabs.3 b/man3/fabs.3
> index 1407f4d..a907fa6 100644
> --- a/man3/fabs.3
> +++ b/man3/fabs.3
> @@ -29,7 +29,7 @@
>  .\" Modified Sat Jul 24 19:42:04 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Added fabsl, fabsf, aeb, 2001-06-07
>  .\"
> -.TH FABS 3  2010-09-20 "" "Linux Programmer's Manual"
> +.TH FABS 3  2013-07-10 "" "Linux Programmer's Manual"
>  .SH NAME
>  fabs, fabsf, fabsl \- absolute value of floating-point number
>  .SH SYNOPSIS
> @@ -84,6 +84,14 @@ If
>  is negative infinity or positive infinity, positive infinity is returned.
>  .SH ERRORS
>  No errors occur.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR fabs (),
> +.BR fabsf (),
> +and
> +.BR fabsl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
