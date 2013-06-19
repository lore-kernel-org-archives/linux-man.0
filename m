From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cimag.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 19 Jun 2013 03:21:49 +0200
Message-ID: <51C107AD.3000704@gmail.com>
References: <1371460072-25690-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371460072-25690-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/17/13 11:07, Peng Haitao wrote:
> The functions cimag(), cimagf() and cimagl() are thread safe.

Thanks Peng. Applied in my branch.

> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/cimag.3 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man3/cimag.3 b/man3/cimag.3
> index 3440bd2..5dee5f8 100644
> --- a/man3/cimag.3
> +++ b/man3/cimag.3
> @@ -30,6 +30,14 @@ One has:
>  .fi
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR cimag (),
> +.BR cimagf (),
> +and
> +.BR cimagl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
