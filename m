From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] execve.2: fix a couple typos
Date: Wed, 5 Jul 2017 10:40:51 +0200
Message-ID: <efe75ccd-8d65-612f-82f7-2fc7977ce056@gmail.com>
References: <20170622021527.24281-1-ebiggers3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170622021527.24281-1-ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Eric Biggers <ebiggers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/22/2017 04:15 AM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Thanks, Eric. Applied.

Cheers,

Michael

> Signed-off-by: Eric Biggers <ebiggers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/execve.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/execve.2 b/man2/execve.2
> index 029f8ea8b..694457b80 100644
> --- a/man2/execve.2
> +++ b/man2/execve.2
> @@ -127,7 +127,7 @@ similarly, the effective group ID is copied to the saved set-group-ID.
>  This copying takes place after any effective ID changes that occur
>  because of the set-user-ID and set-group-ID mode bits.
>  
> -The process's read UID and real GID, as well its supplementary group IDs,
> +The process's real UID and real GID, as well its supplementary group IDs,
>  are unchanged by a call to
>  .BR execve ().
>  
> @@ -590,7 +590,7 @@ signal.
>  .\"
>  .SS Interpreter scripts
>  A maximum line length of 127 characters is allowed for the first line in
> -an interpreter scripts.
> +an interpreter script.
>  
>  The semantics of the
>  .I optional-arg
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
