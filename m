From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] qecvt.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Sat, 18 May 2013 20:06:14 +0200
Message-ID: <5197C316.9020503@gmail.com>
References: <1368585802-8689-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368585802-8689-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/15/13 04:43, Peng Haitao wrote:
> The functions qecvt() and qfcvt() are not thread safe.

Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael

> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/qecvt.3 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/man3/qecvt.3 b/man3/qecvt.3
> index 9cfa68d..07cbe59 100644
> --- a/man3/qecvt.3
> +++ b/man3/qecvt.3
> @@ -69,6 +69,17 @@ See
>  .BR ecvt (3)
>  and
>  .BR gcvt (3).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The functions
> +.BR qecvt ()
> +and
> +.BR qfcvt ()
> +are not thread-safe.
> +.LP
> +The function
> +.BR qgcvt ()
> +is thread-safe.
>  .SH CONFORMING TO
>  SVr4.
>  Not seen in most common UNIX implementations,
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
