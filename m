From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] round.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 11 Jun 2013 14:51:47 +0200
Message-ID: <51B71D63.7060908@gmail.com>
References: <1370945982-12941-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370945982-12941-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/11/13 12:19, Peng Haitao wrote:
> The functions round(), roundf() and roundl() are thread safe.

Thanks, Peng. Applied in my local branch.

Cheers,

Michael




> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/round.3 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man3/round.3 b/man3/round.3
> index ee2dfeb..9bea807 100644
> --- a/man3/round.3
> +++ b/man3/round.3
> @@ -80,6 +80,14 @@ No errors occur.
>  POSIX.1-2001 documents a range error for overflows, but see NOTES.
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR round (),
> +.BR roundf ()
> +and
> +.BR roundl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
