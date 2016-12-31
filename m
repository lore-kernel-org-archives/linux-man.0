From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ptrace.2: clarify PTRACE_O_EXITKILL
Date: Sat, 31 Dec 2016 20:40:42 +0100
Message-ID: <37688af4-2a23-709b-6418-15b4a1d86154@gmail.com>
References: <a7d1da44d6003fc848baf286b5290fb8060fafea.1483121806.git.osandov@osandov.com>
 <2c1e7e59622e5024aea925e0f30a3a270c3689c5.1483121806.git.osandov@osandov.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2c1e7e59622e5024aea925e0f30a3a270c3689c5.1483121806.git.osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/30/2016 07:26 PM, Omar Sandoval wrote:
> The description in the man page is confusing; it makes it sound like
> setting the PTRACE_O_EXITKILL flag on any tracee makes it so that all
> tracees are killed if the tracer exits. The description from the commit
> that introduced PTRACE_O_EXITKILL offers a different explanation: "If
> the tracer exits it sends SIGKILL to every tracee which has this bit
> set".

Thanks, Omar. Applied!

Cheers,

Michael


> Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
> ---
>  man2/ptrace.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 4f1e7d865..96dfc0003 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -464,9 +464,9 @@ which are specified by the following flags:
>  .TP
>  .BR PTRACE_O_EXITKILL " (since Linux 3.8)"
>  .\" commit 992fb6e170639b0849bace8e49bf31bd37c4123
> -If a tracer sets this flag, a
> +Send a
>  .B SIGKILL
> -signal will be sent to every tracee if the tracer exits.
> +signal to the tracee if the tracer exits.
>  This option is useful for ptrace jailers that
>  want to ensure that tracees can never escape the tracer's control.
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
