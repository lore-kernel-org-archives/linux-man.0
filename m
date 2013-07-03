From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] signbit.3: ATTRIBUTES: Note macro that is thread-safe
Date: Wed, 03 Jul 2013 12:04:55 +0200
Message-ID: <51D3F747.5090305@gmail.com>
References: <1372817711-3709-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372817711-3709-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/03/13 04:15, Peng Haitao wrote:
> The macro signbit() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks. Applied!

Cheers,

Michael



> ---
>  man3/signbit.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/signbit.3 b/man3/signbit.3
> index 2f412ad..5615b9c 100644
> --- a/man3/signbit.3
> +++ b/man3/signbit.3
> @@ -58,6 +58,11 @@ macro returns nonzero if the sign of
>  is negative; otherwise it returns zero.
>  .SH ERRORS
>  No errors occur.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR signbit ()
> +macro is thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  This function is defined in IEC 559 (and the appendix with
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
