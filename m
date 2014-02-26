From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scandir.3: tfix
Date: Wed, 26 Feb 2014 10:22:10 +0100
Message-ID: <530DB242.1030202@gmail.com>
References: <1393285264-4984-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393285264-4984-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

On 02/25/2014 12:41 AM, Simon Paillard wrote:
> Introduced in cadd38ba
> ---
>  man3/scandir.3 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/scandir.3 b/man3/scandir.3
> index a3e9159..aee2c86 100644
> --- a/man3/scandir.3
> +++ b/man3/scandir.3
> @@ -146,7 +146,7 @@ on the strings \fI(*a)\->d_name\fP and \fI(*b)\->d_name\fP.
>  The
>  .BR scandirat ()
>  function operates in exactly the same way as
> -.BR scnadir (),
> +.BR scandir (),
>  except for the differences described here.
>  
>  If the pathname given in
> @@ -156,7 +156,7 @@ referred to by the file descriptor
>  .I dirfd
>  (rather than relative to the current working directory of
>  the calling process, as is done by
> -.BR scnadir ()
> +.BR scandir ()
>  for a relative pathname).
>  
>  If
> @@ -169,7 +169,7 @@ then
>  .I dirp
>  is interpreted relative to the current working
>  directory of the calling process (like
> -.BR scnadir ()).
> +.BR scandir ()).
>  
>  If
>  .I dirp
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
