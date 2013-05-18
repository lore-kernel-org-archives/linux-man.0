From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] bindresvport.3: ATTRIBUTES: Note function that is
 thread-safe
Date: Sat, 18 May 2013 20:24:44 +0200
Message-ID: <5197C76C.6070202@gmail.com>
References: <1366785972-12231-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366785972-12231-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/24/13 08:46, Peng Haitao wrote:
> Before glibc 2.17, bindresvport() is not thread-safe.
> Since glibc 2.17, it is thread-safe, the patch can refer to URL:
> http://sourceware.org/git/?p=glibc.git;a=commit;h=f6da27e53695ad1cc0e2a9490358decbbfdff5e5
	
Applied to my local branch for this work, but see some comments below.

> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/bindresvport.3 | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/man3/bindresvport.3 b/man3/bindresvport.3
> index d2e73a4..2c7152d 100644
> --- a/man3/bindresvport.3
> +++ b/man3/bindresvport.3
> @@ -89,6 +89,16 @@ is not NULL and
>  .I sin->sin_family
>  is not
>  .BR AF_INET .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +Before glibc 2.17, the
> +.BR bindresvport ()
> +uses a static variable that is not protected, so it is not thread-safe.

Missing word "function" here (function uses..."). This was also the
case in a number of the other patches you sent recently. (I fixed them all.)

> +Since glibc 2.17, the
> +.BR bindresvport ()

(Missing word "function".)

> +uses a lock to protect static variable, so it is thread-safe.

"uses a lock to protect *a* static variable"
(I fixed this, and also in a few other patches.)

> +.\" Modified in commit f6da27e53695ad1cc0e2a9490358decbbfdff5e5

Here, its is enough just to write

+.\" commit f6da27e53695ad1cc0e2a9490358decbbfdff5e5

And I'd rearrange things a little, so that the patch is better as:

==
+Since glibc 2.17,
+.\" commit f6da27e53695ad1cc0e2a9490358decbbfdff5e5
+the
+.BR bindresvport ()
...
==

I made that fix (and also in one other patch.)

Cheers,

Michael


>  .SH CONFORMING TO
>  Not in POSIX.1-2001.
>  Present on the BSDs, Solaris, and many other systems.

Thank you, Peng.

Cheers,

Michael


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
