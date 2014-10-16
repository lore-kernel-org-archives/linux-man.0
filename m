From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tzset.3: grfix
Date: Thu, 16 Oct 2014 11:56:51 +0200
Message-ID: <543F9663.9060404@gmail.com>
References: <1413240082-18983-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413240082-18983-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/14/2014 12:41 AM, Simon Paillard wrote:
> The sentence is missing a word somewhere.

Thanks, Simon. Applied.

Cheers,

Michael


> ---
>  man3/tzset.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 1ae47e5..c1c98e1 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -196,7 +196,7 @@ the system timezone directory is determined using the
>  the environment variable.
>  If
>  .BR TZDIR
> -the default depends on the system setup, but is normally
> +is not set, the default depends on the system setup, but is normally
>  .IR /usr/share/zoneinfo .
>  .LP
>  This timezone directory contains the files
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
