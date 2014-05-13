From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_self.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 13 May 2014 10:31:38 +0200
Message-ID: <5371D86A.2060808@gmail.com>
References: <1399966885-13139-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399966885-13139-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael

On 05/13/2014 09:41 AM, Peng Haitao wrote:
> The function pthread_self() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_self.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_self.3 b/man3/pthread_self.3
> index 4c85df7..2273bea 100644
> --- a/man3/pthread_self.3
> +++ b/man3/pthread_self.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_SELF 3 2008-10-24 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_SELF 3 2014-05-13 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_self \- obtain ID of the calling thread
>  .SH SYNOPSIS
> @@ -47,6 +47,11 @@ call that created this thread.
>  This function always succeeds, returning the calling thread's ID.
>  .SH ERRORS
>  This function always succeeds.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_self ()
> +function is thread-safe.
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
