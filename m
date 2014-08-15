From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open.2: grfix
Date: Fri, 15 Aug 2014 20:23:45 +0200
Message-ID: <53EE5031.3020400@gmail.com>
References: <1407187582-25469-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407187582-25469-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 08/04/2014 11:26 PM, Simon Paillard wrote:
> ---
>  man2/open.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index c413d96..4cd5edd 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -101,8 +101,8 @@ By default, the new file descriptor is set to remain open across an
>  (i.e., the
>  .B FD_CLOEXEC
>  file descriptor flag described in
> -.BR fcntl (2))
> -is initially disabled; the
> +.BR fcntl (2)
> +is initially disabled); the
>  .B O_CLOEXEC
>  flag, described below, can be used to change this default.
>  The file offset is set to the beginning of the file (see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
