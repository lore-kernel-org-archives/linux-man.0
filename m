From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace(2): userspace->user space
Date: Wed, 01 Jan 2014 23:49:30 +1300
Message-ID: <52C3F2BA.6070309@gmail.com>
References: <1388473153-17590-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388473153-17590-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/31/13 19:59, Mike Frysinger wrote:
> ---
>  man2/ptrace.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index fa5d63f..f70471a 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -628,8 +628,8 @@ and
>  returns the stop signal.
>  If any other ptrace-stop is generated at the same time (for example,
>  if a signal is sent to the tracee), this ptrace-stop happens.
> -If none of the above applies (for example, if the tracee is running in userspace),
> -it stops with
> +If none of the above applies (for example, if the tracee is running in user
> +space), it stops with
>  .B PTRACE_EVENT_STOP
>  with
>  .I WSTOPSIG(status)
> 

Thanks. Applied.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
