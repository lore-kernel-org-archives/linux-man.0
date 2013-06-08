From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] abs.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sat, 08 Jun 2013 05:53:44 +0200
Message-ID: <51B2AAC8.8060207@gmail.com>
References: <1370486831-18245-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370486831-18245-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/06/13 04:47, Peng Haitao wrote:
> The functions abs(), labs(), llabs() and imaxabs() are thread
> safe.


Thanks, Peng. Applied in my local branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/abs.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/abs.3 b/man3/abs.3
> index 1abc231..2856084 100644
> --- a/man3/abs.3
> +++ b/man3/abs.3
> @@ -79,6 +79,15 @@ appropriate integer type for the function.
>  .SH RETURN VALUE
>  Returns the absolute value of the integer argument, of the appropriate
>  integer type for the function.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR abs (),
> +.BR labs (),
> +.BR llabs ()
> +and
> +.BR imaxabs ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  SVr4, POSIX.1-2001, 4.3BSD, C99.
>  .\" POSIX.1 (1996 edition) requires only the
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
