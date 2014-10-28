From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] credentials.7: Cross-reference getgroups(2)
Date: Tue, 28 Oct 2014 15:26:48 +0100
Message-ID: <544FA7A8.5060301@gmail.com>
References: <20141020080724.GA22792@thin>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141020080724.GA22792@thin>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/20/2014 10:07 AM, Josh Triplett wrote:
> Since credentials.7 discusses supplementary GIDs, it should reference
> getgroups(2).

Thanks, Josh. Applied.

Cheers,

Michael


> Signed-off-by: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
> ---
>  man7/credentials.7 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man7/credentials.7 b/man7/credentials.7
> index 51d5312..acb799d 100644
> --- a/man7/credentials.7
> +++ b/man7/credentials.7
> @@ -309,6 +309,7 @@ is carried through to all of the POSIX threads in a process.
>  .BR execve (2),
>  .BR faccessat (2),
>  .BR fork (2),
> +.BR getgroups (2),
>  .BR getpgrp (2),
>  .BR getpid (2),
>  .BR getppid (2),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
