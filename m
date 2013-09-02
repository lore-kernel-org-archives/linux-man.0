From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rint.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 02 Sep 2013 07:38:35 +0200
Message-ID: <5224245B.3040402@gmail.com>
References: <1377508016-14246-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377508016-14246-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/26/13 11:06, Peng Haitao wrote:
> The functions nearbyint(), nearbyintf(), nearbyintl(), rint(),
> rintf() and rintl() are thread safe.

Applied. Thanks.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/rint.3 | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/rint.3 b/man3/rint.3
> index 8dde6bc..8bb9ba8 100644
> --- a/man3/rint.3
> +++ b/man3/rint.3
> @@ -24,7 +24,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH RINT 3  2010-09-20 "" "Linux Programmer's Manual"
> +.TH RINT 3  2013-08-26 "" "Linux Programmer's Manual"
>  .SH NAME
>  nearbyint, nearbyintf, nearbyintl, rint, rintf, rintl \- round
>  to nearest integer
> @@ -113,6 +113,17 @@ itself is returned.
>  .SH ERRORS
>  No errors occur.
>  POSIX.1-2001 documents a range error for overflows, but see NOTES.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR nearbyint (),
> +.BR nearbyintf (),
> +.BR nearbyintl (),
> +.BR rint (),
> +.BR rintf (),
> +and
> +.BR rintl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
