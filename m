From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] futex.2: tfix
Date: Sat, 11 Apr 2015 08:55:46 +0200
Message-ID: <5528C572.7040606@gmail.com>
References: <1427653404-26501-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427653404-26501-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/29/2015 08:23 PM, Heinrich Schuchardt wrote:
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Thanks, Heinrich. Applied.

Cheers,

Michael



> ---
>  man2/futex.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index 0959ca0..b4a52b1 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -44,7 +44,7 @@ system call provides a method for waiting until a certain condition becomes
>  true.
>  It is typically used as a blocking construct in the context of
>  shared-memory synchronization: The program implements the majority of
> -the synchronization in user space, and uses one of operations of
> +the synchronization in user space, and uses one of the operations of
>  the system call when it is likely that it has to block for
>  a longer time until the condition becomes true.
>  The program uses another operation of the system call to wake
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
