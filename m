From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ptrace.2: Clarify PTRACE_INTERRUPT, PTRACE_LISTEN
 and group-stop behavior
Date: Tue, 02 Jul 2013 06:16:54 +0200
Message-ID: <51D25436.2070305@gmail.com>
References: <1372627631-3702-1-git-send-email-dvlasenk@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372627631-3702-1-git-send-email-dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/30/13 23:27, Denys Vlasenko wrote:
> v2: Improved wording in PTRACE_INTERRUPT explanation.

Oleg (or any other interested parties):

An Acked-by or objections before I apply this?

Cheers,

Michael


> Signed-off-by: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> CC: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> CC: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> CC: Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> CC: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> ---
>  man2/ptrace.2 | 56 +++++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 0d77e3f..79d14cc 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -598,14 +598,28 @@ directly has no such limitation.
>  .TP
>  .BR PTRACE_INTERRUPT " (since Linux 3.4)"
>  Stop a tracee.
> -If the tracee is running, it will stop with
> -.BR PTRACE_EVENT_STOP .
> -If the tracee is already stopped by a signal, or receives a signal
> -in parallel with
> -.BR PTRACE_INTERRUPT ,
> -it may report a group-stop
> -or a signal-delivery-stop instead of
> -.BR PTRACE_EVENT_STOP .
> +If the tracee is running or sleeping in kernel space and
> +.B PTRACE_SYSCALL
> +is in effect,
> +the system call is interrupted and syscall-exit-stop is reported.
> +(The interrupted system call is restarted when the tracee is restarted.)
> +If the tracee was already stopped by a signal and
> +.B PTRACE_LISTEN
> +was sent to it,
> +the tracee stops with
> +.B PTRACE_EVENT_STOP
> +with
> +.I WSTOPSIG(status)
> +== stop_sig.
> +If any other ptrace-stop is generated at the same time (for example,
> +if a signal is sent to the tracee), this ptrace-stop happens.
> +If none of the above applies (for example, if the tracee is running in userspace),
> +it stops with
> +.B PTRACE_EVENT_STOP
> +with
> +.I WSTOPSIG(status)
> +==
> +.BR SIGTRAP .
>  .B PTRACE_INTERRUPT
>  only works on tracees attached by
>  .BR PTRACE_SEIZE .
> @@ -760,6 +774,22 @@ and any subsequent ptrace stops will be reported under
>  the thread group leader's PID.
>  .SS Stopped states
>  A tracee can be in two states: running or stopped.
> +For the purposes of ptrace, tracee which is blocked in a syscall
> +(such as
> +.BR read (2),
> +.BR pause (2)
> +etc)
> +is nevertheless considered to be running, even if tracee is blocked
> +for a long time.
> +The state of the tracee after
> +.BR PTRACE_LISTEN
> +is somewhat of a gray area: it is not in any ptrace-stop (ptrace commands
> +won't work on it, and it will deliver waitpid notifications),
> +but it also may be considered "stopped" because
> +it is not executing instructions (is not scheduled), and if it was
> +in group-stop before
> +.BR PTRACE_LISTEN ,
> +it will not respond to signals until SIGCONT is received.
>  .LP
>  There are many kinds of states when the tracee is stopped, and in ptrace
>  discussions they are often conflated.
> @@ -1045,6 +1075,14 @@ then it is definitely a group-stop.
>  .B SIGKILL
>  killed the tracee.)
>  .LP
> +If tracee was attached using PTRACE_SEIZE, group-stop
> +is indicated by
> +.BR PTRACE_EVENT_STOP :
> +status>>16 == PTRACE_EVENT_STOP. This allows detection of group-stops
> +without extra
> +.B PTRACE_GETSIGINFO
> +call.
> +.LP
>  As of Linux 2.6.38,
>  after the tracer sees the tracee ptrace-stop and until it
>  restarts or kills it, the tracee will not run,
> @@ -1170,7 +1208,7 @@ to finish exiting.
>  .B PTRACE_EVENT_STOP
>  Stop induced by
>  .B PTRACE_INTERRUPT
> -command.
> +command, or group-stop (only if attached using PTRACE_SEIZE).
>  .LP
>  .B PTRACE_GETSIGINFO
>  on
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
