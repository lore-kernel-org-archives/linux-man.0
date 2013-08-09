From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] syscall.2: clarify example, add missing parameter
Date: Fri, 09 Aug 2013 09:34:59 +0200
Message-ID: <52049BA3.4080109@gmail.com>
References: <CALiXj0BkB-0bSw6gcDnCFDkqO0_7836=a0kCOQF0gAzaG6cUQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALiXj0BkB-0bSw6gcDnCFDkqO0_7836=a0kCOQF0gAzaG6cUQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Erlandsson <jeoerl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/09/13 01:53, Johan Erlandsson wrote:
> An attempt to clarify example by adding a missing parameter.

Thanks. for the note. I've applied the patch, but it looks like your
mailer mangled it, so I had to do that manually.

Cheers,

Michael

> 
> ---
>  man2/syscall.2 |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/syscall.2 b/man2/syscall.2
> index 0560634..1cca9ce 100644
> --- a/man2/syscall.2
> +++ b/man2/syscall.2
> @@ -205,6 +205,7 @@ architectures may indiscriminately clobber other
> registers not listed here.
>  #include <unistd.h>
>  #include <sys/syscall.h>
>  #include <sys/types.h>
> +#include <signal.h>
> 
>  int
>  main(int argc, char *argv[])
> @@ -212,7 +213,7 @@ main(int argc, char *argv[])
>      pid_t tid;
> 
>      tid = syscall(SYS_gettid);
> -    tid = syscall(SYS_tgkill, getpid(), tid);
> +    tid = syscall(SYS_tgkill, getpid(), tid, SIGHUP);
>  }
>  .fi
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
