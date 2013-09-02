From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lround.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 02 Sep 2013 07:35:53 +0200
Message-ID: <522423B9.6000507@gmail.com>
References: <1377501670-4247-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377501670-4247-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/26/13 09:21, Peng Haitao wrote:
> The functions lround(), lroundf(), lroundl(), llround(),
> llroundf() and llroundl() are thread safe.

Applied. Thanks.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/lround.3 | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/lround.3 b/man3/lround.3
> index 3708455..8998def 100644
> --- a/man3/lround.3
> +++ b/man3/lround.3
> @@ -24,7 +24,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH LROUND 3  2010-09-20 "" "Linux Programmer's Manual"
> +.TH LROUND 3  2013-08-26 "" "Linux Programmer's Manual"
>  .SH NAME
>  lround, lroundf, lroundl, llround, llroundf, llroundl \- round to
>  nearest integer, away from zero
> @@ -109,6 +109,17 @@ These functions do not set
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6797
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR lround (),
> +.BR lroundf (),
> +.BR lroundl (),
> +.BR llround (),
> +.BR llroundf (),
> +and
> +.BR llroundl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
