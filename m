From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fcntl.2: tfix
Date: Thu, 26 Feb 2015 06:52:41 +0100
Message-ID: <54EEB4A9.6060401@gmail.com>
References: <1424872305-450-1-git-send-email-mityada@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424872305-450-1-git-send-email-mityada-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Deshevoy <mityada-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/25/2015 02:51 PM, Dmitry Deshevoy wrote:
> Signed-off-by: Dmitry Deshevoy <mityada-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks, Dmitry.

Applied.

Cheers,

Michael


> ---
>  man2/fcntl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index 60cec41..143c61f 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -1703,7 +1703,7 @@ but work is being done to have them included in the next version of POSIX.1.
>  .BR F_ADD_SEALS
>  and
>  .BR F_GET_SEALS
> -are Lnux-specific.
> +are Linux-specific.
>  .\" FIXME . Once glibc adds support, add a note about FTM requirements
>  .SH NOTES
>  The errors returned by
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
