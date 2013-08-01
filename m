From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fma.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 01 Aug 2013 11:11:09 +0200
Message-ID: <51FA262D.7030405@gmail.com>
References: <1375149274-23768-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375149274-23768-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/30/13 03:54, Peng Haitao wrote:
> The functions fma(), fmaf() and fmal() are thread safe.

Thanks. Applied.  
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fma.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/fma.3 b/man3/fma.3
> index 29bb670..e7c065f 100644
> --- a/man3/fma.3
> +++ b/man3/fma.3
> @@ -9,7 +9,7 @@
>  .\" Modified 2004-11-15, Added further text on FLT_ROUNDS
>  .\" 	as suggested by AEB and Fabian Kreutz
>  .\"
> -.TH FMA 3  2010-09-20 "" "Linux Programmer's Manual"
> +.TH FMA 3  2013-07-30 "" "Linux Programmer's Manual"
>  .SH NAME
>  fma, fmaf, fmal \- floating-point multiply and add
>  .SH SYNOPSIS
> @@ -153,6 +153,14 @@ These functions do not set
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6801
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR fma (),
> +.BR fmaf (),
> +and
> +.BR fmal ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
