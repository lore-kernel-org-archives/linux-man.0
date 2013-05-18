From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpwent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Sat, 18 May 2013 20:25:31 +0200
Message-ID: <5197C79B.80905@gmail.com>
References: <1367572791-22023-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367572791-22023-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/03/13 11:19, Peng Haitao wrote:
> The function getpwent() is not thread safe.


Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getpwent.3 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/man3/getpwent.3 b/man3/getpwent.3
> index bccc064..cd83936 100644
> --- a/man3/getpwent.3
> +++ b/man3/getpwent.3
> @@ -151,6 +151,17 @@ Insufficient buffer space supplied.
>  .TP
>  .I /etc/passwd
>  local password database file
> +.SH ATTRIBUTES
> +.SS Multithreading(see pthreads(7))
> +The
> +.BR getpwent()
> +is not thread-safe.
> +.LP
> +The
> +.BR setpwent()
> +and
> +.BR endpwent()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
>  The
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
