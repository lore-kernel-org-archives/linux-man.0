From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getdirentries.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Jun 2014 10:40:00 +0200
Message-ID: <539815E0.9080703@gmail.com>
References: <1402475140-22564-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402475140-22564-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael



On 06/11/2014 10:25 AM, Peng Haitao wrote:
> The function getdirentries() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getdirentries.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/getdirentries.3 b/man3/getdirentries.3
> index 6b4ad5f..523bc38 100644
> --- a/man3/getdirentries.3
> +++ b/man3/getdirentries.3
> @@ -61,6 +61,11 @@ If an error occurs, \-1 is returned, and
>  is set appropriately.
>  .SH ERRORS
>  See the Linux library source code for details.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getdirentries ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  Not in POSIX.1-2001.
>  Present on the BSDs, and a few other systems.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
