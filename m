From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigsetops.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 14 Apr 2014 12:27:04 +0200
Message-ID: <534BB7F8.7090600@gmail.com>
References: <1397442371-19537-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397442371-19537-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 04/14/2014 04:26 AM, Peng Haitao wrote:
> The functions sigemptyset(), sigfillset(), sigaddset(),
> sigdelset(), sigismember(), sigisemptyset(), sigorset() and
> sigandset() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sigsetops.3 | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/sigsetops.3 b/man3/sigsetops.3
> index 504c559..a2a3554 100644
> --- a/man3/sigsetops.3
> +++ b/man3/sigsetops.3
> @@ -28,7 +28,7 @@
>  .\" 2007-10-26 mdw   added wording that a sigset_t must be initialized
>  .\"                  prior to use
>  .\"
> -.TH SIGSETOPS 3 2013-09-24 "Linux" "Linux Programmer's Manual"
> +.TH SIGSETOPS 3 2014-04-14 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  sigemptyset, sigfillset, sigaddset, sigdelset, sigismember \- POSIX
>  signal set operations
> @@ -128,6 +128,19 @@ to indicate the cause.
>  .B EINVAL
>  .I sig
>  is not a valid signal.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR sigemptyset (),
> +.BR sigfillset (),
> +.BR sigaddset (),
> +.BR sigdelset (),
> +.BR sigismember (),
> +.BR sigisemptyset (),
> +.BR sigorset (),
> +and
> +.BR sigandset ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
