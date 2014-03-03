From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] access.2n chmod.2, chown.2: ffix regression
Date: Mon, 03 Mar 2014 05:50:17 +0100
Message-ID: <53140A09.3040208@gmail.com>
References: <1393621460-19801-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393621460-19801-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/28/2014 10:04 PM, Simon Paillard wrote:
> Introduced in my previous commit 9d3ea7a2995cbae483742f0f572b6e9dc4e0a58f


Thanks, Simon. Applied.

Cheers,

Michael


> ---
>  man2/access.2 | 4 ++--
>  man2/chmod.2  | 2 +-
>  man2/chown.2  | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/man2/access.2 b/man2/access.2
> index f909848..050fbc9 100644
> --- a/man2/access.2
> +++ b/man2/access.2
> @@ -138,7 +138,7 @@ then
>  .I pathname
>  is interpreted relative to the current working
>  directory of the calling process (like
> -.BR access () ).
> +.BR access ()).
>  
>  If
>  .I pathname
> @@ -154,7 +154,7 @@ Perform access checks using the effective user and group IDs.
>  By default,
>  .BR faccessat ()
>  uses the real IDs (like
> -.BR access () ).
> +.BR access ()).
>  .TP
>  .B AT_SYMLINK_NOFOLLOW
>  If
> diff --git a/man2/chmod.2 b/man2/chmod.2
> index f4636d5..b46c0fa 100644
> --- a/man2/chmod.2
> +++ b/man2/chmod.2
> @@ -206,7 +206,7 @@ then
>  .I pathname
>  is interpreted relative to the current working
>  directory of the calling process (like
> -.BR chmod () ).
> +.BR chmod ()).
>  
>  If
>  .I pathname
> diff --git a/man2/chown.2 b/man2/chown.2
> index b1ef4a5..c7b2bd6 100644
> --- a/man2/chown.2
> +++ b/man2/chown.2
> @@ -169,7 +169,7 @@ then
>  .I pathname
>  is interpreted relative to the current working
>  directory of the calling process (like
> -.BR chown () ).
> +.BR chown ()).
>  
>  If
>  .I pathname
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
