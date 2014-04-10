From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] isalpha.3, stat.2: tfix
Date: Thu, 10 Apr 2014 21:15:58 +0200
Message-ID: <5346EDEE.7060202@gmail.com>
References: <1396892778-11630-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396892778-11630-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 04/07/2014 07:46 PM, Simon Paillard wrote:
> ---
>  man2/stat.2    | 2 +-
>  man3/isalpha.3 | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/stat.2 b/man2/stat.2
> index 7cbf088..0ac48d5 100644
> --- a/man2/stat.2
> +++ b/man2/stat.2
> @@ -547,7 +547,7 @@ field and the file-type component of the
>  field of the
>  .IR stat
>  structure.
> -POSIX.-2008 tightens the specification, requiring
> +POSIX.1-2008 tightens the specification, requiring
>  .BR lstat ()
>  to return valid information in all fields except the permission bits in
>  .IR st_mode .
> diff --git a/man3/isalpha.3 b/man3/isalpha.3
> index 4364d52..6ebe741 100644
> --- a/man3/isalpha.3
> +++ b/man3/isalpha.3
> @@ -289,7 +289,7 @@ POSIX.1-2008 marks
>  as obsolete,
>  noting that it cannot be used portably in a localized application.
>  
> -POSIX.-1-2008 specifies
> +POSIX.1-2008 specifies
>  .BR isalnum_l (),
>  .BR isalpha_l (),
>  .BR isblank_l (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
