From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lrint.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 22 Aug 2013 09:28:15 +0200
Message-ID: <5215BD8F.1060105@gmail.com>
References: <1376905627-25802-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376905627-25802-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/19/13 11:47, Peng Haitao wrote:
> The functions lrint(), lrintf(), lrintl(), llrint(), llrintf(),
> and llrintl() are thread safe.

Applied. Thanks.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/lrint.3 | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/lrint.3 b/man3/lrint.3
> index a2e2805..b698977 100644
> --- a/man3/lrint.3
> +++ b/man3/lrint.3
> @@ -24,7 +24,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH LRINT 3  2010-09-20 "" "Linux Programmer's Manual"
> +.TH LRINT 3  2013-08-19 "" "Linux Programmer's Manual"
>  .SH NAME
>  lrint, lrintf, lrintl, llrint, llrintf, llrintl \- round to nearest integer
>  .SH SYNOPSIS
> @@ -106,6 +106,17 @@ These functions do not set
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6798
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR lrint (),
> +.BR lrintf (),
> +.BR lrintl (),
> +.BR llrint (),
> +.BR llrintf (),
> +and
> +.BR llrintl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
