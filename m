From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] crypt.3: ATTRIBUTES: Note function that is not thread-safe
Date: Sat, 18 May 2013 20:08:18 +0200
Message-ID: <5197C392.2040302@gmail.com>
References: <1367827391-3564-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367827391-3564-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/06/13 10:03, Peng Haitao wrote:
> The function crypt() is not thread safe.


Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/crypt.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index ca52b92..ed02440 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -160,6 +160,15 @@ function was not implemented, probably because of U.S.A. export restrictions.
>  .\" .PP
>  .\" Making encrypted data computed using crypt() publicly available has
>  .\" to be considered insecure for the given reasons.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR crypt ()
> +function is not thread-safe.
> +.LP
> +The
> +.BR crypt_r ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  .BR crypt ():
>  SVr4, 4.3BSD, POSIX.1-2001.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
