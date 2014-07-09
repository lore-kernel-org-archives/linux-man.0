From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usleep.3: Reformat thread-safety information
Date: Wed, 09 Jul 2014 13:09:25 +0200
Message-ID: <53BD22E5.3080905@gmail.com>
References: <1404898621-3895-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404898621-3895-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Haitao,

Applied. Thanks.

Cheers,

Michael



On 07/09/2014 11:37 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/usleep.3 | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/usleep.3 b/man3/usleep.3
> index 3229fe8..e98847e 100644
> --- a/man3/usleep.3
> +++ b/man3/usleep.3
> @@ -89,10 +89,17 @@ Interrupted by a signal; see
>  \fIusec\fP is not smaller than 1000000.
>  (On systems where that is considered an error.)
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR usleep ()
> -function is thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  4.3BSD, POSIX.1-2001.
>  POSIX.1-2001 declares this function obsolete; use
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
