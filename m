From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ualarm.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 27 Dec 2013 07:24:04 +1300
Message-ID: <52BC7444.4000102@gmail.com>
References: <1387769514-20661-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387769514-20661-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/23/13 16:31, Peng Haitao wrote:
> The function ualarm() is thread safe.

Thanks. Applied!

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ualarm.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/ualarm.3 b/man3/ualarm.3
> index 7a9165c..e69d2ff 100644
> --- a/man3/ualarm.3
> +++ b/man3/ualarm.3
> @@ -21,7 +21,7 @@
>  .\" <http://www.gnu.org/licenses/>.
>  .\" %%%LICENSE_END
>  .\"
> -.TH UALARM 3  2013-04-18 "" "Linux Programmer's Manual"
> +.TH UALARM 3  2013-12-23 "" "Linux Programmer's Manual"
>  .SH NAME
>  ualarm \- schedule signal after given number of microseconds
>  .SH SYNOPSIS
> @@ -89,6 +89,11 @@ Interrupted by a signal.
>  .B EINVAL
>  \fIusecs\fP or \fIinterval\fP is not smaller than 1000000.
>  (On systems where that is considered an error.)
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR ualarm ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  4.3BSD, POSIX.1-2001.
>  POSIX.1-2001 marks
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
