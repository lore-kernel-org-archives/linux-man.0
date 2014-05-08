From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] Fix various inconsistencies
Date: Thu, 08 May 2014 11:43:49 +0200
Message-ID: <536B51D5.8010406@gmail.com>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/30/2014 09:42 PM, Rasmus Villemoes wrote:
> With the help of a perl script (which will be sent separately once
> it's no longer as embarrassing as it is currently), I checked the
> man2-pages for consistency with the actual installed headers.

Great stuff, Rasmus. Who knows, that script might be handy again 
one day, if you want to polish it up.

All of the patches look correct to me, and I've applied.
In a few cases, the errors came about because glibc
has changed the prototypes (in the distant past).

Thanks for the patches!

Cheers,

Michael


> Rasmus Villemoes (10):
>   Fix return type of readlinkat()
>   Fix prototype for stime()
>   Fix prototypes for semop() and semtimedop()
>   Fix prototypes for [sg]etpriority()
>   Fix prototype for sched_setaffinity()
>   Add <sys/types.h> to synopsis of get_robust_list()
>   Fix prototype for mbind(2)
>   Add <signal.h> to synopsis for ppoll()
>   Fix prototype for set_mempolicy(2)
>   Fix prototype for syscall(2)
> 
>  man2/get_robust_list.2   | 1 +
>  man2/getpriority.2       | 4 ++--
>  man2/mbind.2             | 6 +++---
>  man2/poll.2              | 1 +
>  man2/readlink.2          | 4 ++--
>  man2/sched_setaffinity.2 | 2 +-
>  man2/semop.2             | 6 +++---
>  man2/set_mempolicy.2     | 4 ++--
>  man2/stime.2             | 2 +-
>  man2/syscall.2           | 2 +-
>  10 files changed, 17 insertions(+), 15 deletions(-)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
