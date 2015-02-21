From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] futex.7: remove commonplace
Date: Sat, 21 Feb 2015 13:31:30 +0100
Message-ID: <54E87AA2.50704@gmail.com>
References: <1424166247-6446-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424166247-6446-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/17/2015 10:44 AM, Heinrich Schuchardt wrote:
> The sentence is true for all man-pages. Remove it.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/futex.7 | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/man7/futex.7 b/man7/futex.7
> index c3c57f0..c829886 100644
> --- a/man7/futex.7
> +++ b/man7/futex.7
> @@ -24,9 +24,6 @@ Futexes are very basic and lend themselves well for building higher-level
>  locking abstractions such as
>  mutexes, condition variables, read-write locks, barriers, and semaphores.
>  .PP
> -This page does not set out to document all design decisions
> -but restricts itself to issues relevant for
> -application and library development.
>  Most programmers will in fact not be using futexes directly but will
>  instead rely on system libraries built on them,
>  such as the Native POSIX Thread Library (NPTL) (see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
