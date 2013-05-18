From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] hsearch.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Sat, 18 May 2013 20:16:04 +0200
Message-ID: <5197C564.8040503@gmail.com>
References: <1368584933-8428-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368584933-8428-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/15/13 04:28, Peng Haitao wrote:
> The functions hsearch(), hcreate() and hdestroy() are not thread safe.

Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/hsearch.3 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man3/hsearch.3 b/man3/hsearch.3
> index e66c840..3d6ae2e 100644
> --- a/man3/hsearch.3
> +++ b/man3/hsearch.3
> @@ -223,6 +223,21 @@ was not found in the table.
>  POSIX.1-2001 specifies only the
>  .B ENOMEM
>  error.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The functions
> +.BR hcreate (),
> +.BR hsearch (),
> +and
> +.BR hdestroy ()
> +use a global space for storing the table, so they are not thread-safe.
> +.LP
> +The functions
> +.BR hcreate_r (),
> +.BR hsearch_r (),
> +and
> +.BR hdestroy_r ()
> +are thread-safe.
>  .SH CONFORMING TO
>  The functions
>  .BR hcreate (),
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
