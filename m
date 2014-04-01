From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpt.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 01 Apr 2014 20:42:26 +0200
Message-ID: <533B0892.9030203@gmail.com>
References: <1396337124-32617-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396337124-32617-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael


On 04/01/2014 09:25 AM, Peng Haitao wrote:
> The function getpt() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getpt.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/getpt.3 b/man3/getpt.3
> index 7ec96b4..82be3ac 100644
> --- a/man3/getpt.3
> +++ b/man3/getpt.3
> @@ -4,7 +4,7 @@
>  .\" Redistribute and modify at will.
>  .\" %%%LICENSE_END
>  .\"
> -.TH GETPT 3 2010-09-10 "GNU" "Linux Programmer's Manual"
> +.TH GETPT 3 2014-04-01 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  getpt \- open the pseudoterminal master (PTM)
>  .SH SYNOPSIS
> @@ -39,6 +39,11 @@ can fail with various errors described in
>  .SH VERSIONS
>  .BR getpt ()
>  is provided in glibc since version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getpt ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  .BR getpt ()
>  is glibc-specific;
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
