From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Changes.old: tfix
Date: Mon, 25 Jan 2016 14:33:17 +0100
Message-ID: <56A6241D.6030009@gmail.com>
References: <1453474138-2742-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453474138-2742-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/22/2016 03:48 PM, Jakub Wilk wrote:
> Remove duplicated words.

Thanks, Jakub. Applied.

Cheers,

Michael

> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  Changes.old | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Changes.old b/Changes.old
> index 7a7ce22..97d4b5e 100644
> --- a/Changes.old
> +++ b/Changes.old
> @@ -1210,7 +1210,7 @@ listen.2
>  semop.2
>      mtk
>          Added BUG: in some circumstances, a process that is
> -        waiting for a semaphore to become zero is not not woken
> +        waiting for a semaphore to become zero is not woken
>          up when the value does actually reach zero.
>          http://marc.theaimsgroup.com/?l=linux-kernel&m=110260821123863&w=2
>          http://marc.theaimsgroup.com/?l=linux-kernel&m=110261701025794&w=2
> @@ -16331,7 +16331,7 @@ path_resolution.7
>          Global fix: s/mount-point namespace/mount namespace/
>              This is more consistent with the term "mounts namespace"
>              used in the 2008 ACM SIGOPS paper, "Virtual servers
> -            and and checkpoint/restart in mainstream Linux".
> +            and checkpoint/restart in mainstream Linux".
>              (I avoided the "s", because using the plural strikes me
>              as klunky English, and anyway we don't talk about
>              the "PIDs namespace" or the "networks namespace", etc..)
> @@ -16557,7 +16557,7 @@ pthread_setschedparam.3
>      Michael Kerrisk
>          PTHREAD_INHERIT_SCHED is default for inherit scheduler attribute
>              In EXAMPLE, note that PTHREAD_INHERIT_SCHED is the default for
> -            the inherit scheduler attribute attribute.
> +            the inherit scheduler attribute.
>  
>  syslog.3
>      Masanari Iida
> @@ -18060,7 +18060,7 @@ splice.2
>  syscalls.2
>      Michael Kerrisk
>          Note that getpmsg(2) and putmsg(2) are unimplemented
> -            See See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=514771
> +            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=514771
>  
>  timerfd_create.2
>      Michael Kerrisk
> @@ -19891,7 +19891,7 @@ socket.7
>  udp.7
>      Michael Kerrisk
>          Add FIONREAD warning.
> -            Warn that FIONREAD can't can't distinguish case of a zero-length
> +            Warn that FIONREAD can't distinguish case of a zero-length
>              datagram from the case where no datagrams are available.
>  
>  
> @@ -26090,7 +26090,7 @@ rtnetlink.7
>  socket.7
>      Pavel Emelyanov
>          SO_BINDTODEVICE is now readable
> -            SO_BINDTODEVICE is readable since since kernel 3.8.
> +            SO_BINDTODEVICE is readable since kernel 3.8.
>  
>  
>  ==================== Changes in man-pages-3.49 ====================
> @@ -26425,7 +26425,7 @@ clone.2
>              and the wrapper function in the introductory text.
>      Michael Kerrisk
>          Update feature test macro requirements
> -            The requirements quietly changed changed in glibc 2.14
> +            The requirements quietly changed in glibc 2.14
>  
>              See also http://www.sourceware.org/bugzilla/show_bug.cgi?id=4749
>      Michael Kerrisk  [Mike Frysinger]
> @@ -26537,7 +26537,7 @@ umask.2
>  unshare.2
>      Michael Kerrisk
>          Update feature test macro requirements
> -            The requirements quietly changed changed in glibc 2.14
> +            The requirements quietly changed in glibc 2.14
>  
>              See also http://www.sourceware.org/bugzilla/show_bug.cgi?id=4749
>  
> @@ -26576,7 +26576,7 @@ scalb.3
>  sched_getcpu.3
>      Michael Kerrisk
>          Update feature test macro requirements
> -            The requirements quietly changed changed in glibc 2.14
> +            The requirements quietly changed in glibc 2.14
>  
>              See also http://www.sourceware.org/bugzilla/show_bug.cgi?id=4749
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
