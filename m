From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] a64l.3: ATTRIBUTES: Note function that is not thread-safe
Date: Tue, 21 May 2013 13:11:13 +0200
Message-ID: <519B5651.1000108@gmail.com>
References: <1369026746-9831-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369026746-9831-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/13 07:12, Peng Haitao wrote:
> The function l64a() is not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks, Peng. Applied in my local branch for this work.

Cheers,

Michael


> ---
>  man3/a64l.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/a64l.3 b/man3/a64l.3
> index 1f14b68..762ec79 100644
> --- a/man3/a64l.3
> +++ b/man3/a64l.3
> @@ -59,6 +59,15 @@ a-z	represent 38-63
>  .fi
>  .RE
>  So 123 = 59*64^0 + 1*64^1 = "v/".
> +.SH ATTRIBUTES
> +.SS Multithreading(see pthreads(7))
> +The
> +.BR l64a ()
> +function is not thread-safe.
> +.LP
> +The
> +.BR a64l ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
