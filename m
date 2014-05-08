From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/10] Fix prototypes for semop() and semtimedop()
Date: Thu, 08 May 2014 11:44:01 +0200
Message-ID: <536B51E1.7030106@gmail.com>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk> <1398886962-10633-4-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-4-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/30/2014 09:42 PM, Rasmus Villemoes wrote:
> The nsops arguments have type size_t, not unsigned, and the
> timeout argument of semtimedop() is const.

Looks like the semop() prototype changed between glibc 2.1 and 2.2.
(The semtimedop() prototype was always "size_t". Probably, 
I cut-pasted...)

Applied!

Thanks,

Michael


> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man2/semop.2 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man2/semop.2 b/man2/semop.2
> index c55473b..8f70e63 100644
> --- a/man2/semop.2
> +++ b/man2/semop.2
> @@ -41,10 +41,10 @@ semop, semtimedop \- System V semaphore operations
>  .B #include <sys/ipc.h>
>  .B #include <sys/sem.h>
>  .sp
> -.BI "int semop(int " semid ", struct sembuf *" sops ", unsigned " nsops );
> +.BI "int semop(int " semid ", struct sembuf *" sops ", size_t " nsops );
>  .sp
> -.BI "int semtimedop(int " semid ", struct sembuf *" sops ", unsigned " nsops ,
> -.BI "               struct timespec *" timeout );
> +.BI "int semtimedop(int " semid ", struct sembuf *" sops ", size_t " nsops ,
> +.BI "               const struct timespec *" timeout );
>  .fi
>  .sp
>  .in -4n
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
