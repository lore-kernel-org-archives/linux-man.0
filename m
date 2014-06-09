From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mkdtemp.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 09 Jun 2014 19:56:36 +0200
Message-ID: <5395F554.7020001@gmail.com>
References: <1402279403-10795-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402279403-10795-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/09/2014 04:03 AM, Peng Haitao wrote:
> The function mkdtemp() is thread safe.

Thanks, Haitao. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mkdtemp.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/mkdtemp.3 b/man3/mkdtemp.3
> index 09744b5..b453d2c 100644
> --- a/man3/mkdtemp.3
> +++ b/man3/mkdtemp.3
> @@ -83,6 +83,11 @@ Also see
>  for other possible values for \fIerrno\fP.
>  .SH VERSIONS
>  Available since glibc 2.1.91.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mkdtemp ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2008.
>  This function is present on the BSDs.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
