From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strtok.3: ATTRIBUTES: Note function that is not thread-safe
Date: Sat, 08 Jun 2013 05:53:41 +0200
Message-ID: <51B2AAC5.30801@gmail.com>
References: <1370489117-21350-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370489117-21350-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/06/13 05:25, Peng Haitao wrote:
> The function strtok() is not thread safe.

Thanks, Peng. Applied in my local branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strtok.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/strtok.3 b/man3/strtok.3
> index 6895d38..754ed3e 100644
> --- a/man3/strtok.3
> +++ b/man3/strtok.3
> @@ -110,6 +110,15 @@ and
>  .BR strtok_r ()
>  functions return a pointer to
>  the next token, or NULL if there are no more tokens.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strtok ()
> +function is not thread-safe.
> +.LP
> +The
> +.BR strtok_r ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  .TP
>  .BR strtok ()
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
