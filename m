From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptsname.3: ATTRIBUTES: Note function that is not thread-safe
Date: Sat, 18 May 2013 20:07:01 +0200
Message-ID: <5197C345.9060609@gmail.com>
References: <1367827417-3650-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367827417-3650-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/06/13 10:03, Peng Haitao wrote:
> The function ptsname() is not thread safe.

Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ptsname.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/ptsname.3 b/man3/ptsname.3
> index 9ebafc3..c4d0fa1 100644
> --- a/man3/ptsname.3
> +++ b/man3/ptsname.3
> @@ -76,6 +76,15 @@ is too small.
>  .SH VERSIONS
>  .BR ptsname ()
>  is provided in glibc since version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR ptsname ()
> +function is not thread-safe.
> +.LP
> +The
> +.BR ptsname_r ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  .BR ptsname ()
>  is part of the UNIX 98 pseudoterminal support (see
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
