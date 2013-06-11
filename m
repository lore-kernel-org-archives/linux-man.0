From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ceil.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 11 Jun 2013 14:51:34 +0200
Message-ID: <51B71D56.6010409@gmail.com>
References: <1370944375-12224-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370944375-12224-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/11/13 11:52, Peng Haitao wrote:
> The functions ceil(), ceilf() and ceill() are thread safe.

Thanks, Peng. Applied in my local branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ceil.3 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man3/ceil.3 b/man3/ceil.3
> index 14f6748..edea688 100644
> --- a/man3/ceil.3
> +++ b/man3/ceil.3
> @@ -75,6 +75,14 @@ If \fIx\fP is integral, +0, \-0, NaN, or infinite,
>  .SH ERRORS
>  No errors occur.
>  POSIX.1-2001 documents a range error for overflows, but see NOTES.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR ceil (),
> +.BR ceilf ()
> +and
> +.BR ceill ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
