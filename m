From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: ffix and tfix
Date: Sat, 24 Mar 2012 12:14:06 +1300
Message-ID: <CAKgNAkji-0miFw5hRar+R07PRtGkO44rZJmRNKckHv=VCmpRLg@mail.gmail.com>
References: <1332444186-16345-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332444186-16345-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

I applied pieces of this. See below.

On Fri, Mar 23, 2012 at 8:23 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
> =A0man2/ptrace.2 | =A0 51 ++++++++++++++++++++++++++++++++-----------=
--------
> =A01 files changed, 32 insertions(+), 19 deletions(-)
>
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 5a8b648..457c6ac 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -277,7 +277,7 @@ which are specified by the following flags:
> =A0.BR PTRACE_O_TRACESYSGOOD " (since Linux 2.4.6)"
> =A0When delivering system call traps, set bit 7 in the signal number
> =A0(i.e., deliver
> -.IR "SIGTRAP|0x80" ).
> +.BR "SIGTRAP\ |\ 0x80" ).

In general, I format expressions completely in italics, so I didn't
apply this part. (And I'm sure there's some inconsistency in man-pages
on this point.)

> =A0This makes it easy for the tracer to distinguish
> =A0normal traps from those caused by a system call.
> =A0.RB ( PTRACE_O_TRACESYSGOOD
> @@ -468,7 +468,7 @@ The
> =A0.I data
> =A0argument is treated as for
> =A0.BR PTRACE_CONT .
> -.RI (addr
> +.RI ( addr

Applied.

> =A0is ignored.)
> =A0.TP
> =A0.BR PTRACE_SYSEMU ", " PTRACE_SYSEMU_SINGLESTEP " (since Linux 2.6=
=2E14)"
> @@ -539,7 +539,9 @@ but will not necessarily have stopped
> =A0by the completion of this call; use
> =A0.BR waitpid (2)
> =A0to wait for the tracee to stop.
> -See the "Attaching and detaching" subsection for additional informat=
ion.
> +See the
> +.B Attaching and detaching
> +subsection for additional information.

I don't tend to format headings in bold when used inline in text, so
I've skipped this piece. (And I wonder if there is some inconsistency
in man-pages on this point.)

> =A0.RI ( addr
> =A0and
> =A0.I data
> @@ -716,7 +718,9 @@ Example:
> =A0.\" =A0 =A0 describe how wait notifications queue (or not queue)
> =A0.LP
> =A0The following kinds of ptrace-stops exist: signal-delivery-stops,
> -group-stop, PTRACE_EVENT stops, syscall-stops.
> +group-stop,
> +.B PTRACE_EVENT
> +stops, syscall-stops.

Applied.

> =A0They all are reported by
> =A0.BR waitpid (2)
> =A0with
> @@ -730,7 +734,7 @@ and if there is ambiguity in that value, by query=
ing
> =A0.I WSTOPSIG(status)
> =A0macro can't be used to perform this examination,
> =A0because it returns the value
> -(\fIstatus\>>8)\ \fB&\ 0xff\fP\fP.)
> +(\fIstatus\>>8\fP)\ \fB&\ 0xff\fP.)

I agree the formatting was broken here, but I made it:

=2EIR "(status\>>8)\ &\ 0xff" .)

(See comments above about expressions.)

> =A0.SS Signal-delivery-stop
> =A0When a (possibly multithreaded) process receives any signal except
> =A0.BR SIGKILL ,
> @@ -761,7 +765,11 @@ true, with the signal returned by
> =A0If the signal is
> =A0.BR SIGTRAP ,
> =A0this may be a different kind of ptrace-stop;
> -see the "Syscall-stops" and "execve" sections below for details.
> +see the
> +.B Syscall-stops
> +and
> +.B execve(2) under ptrace
> +sections below for details.

Not applied. See comments above.

> =A0If
> =A0.I WSTOPSIG(status)
> =A0returns a stopping signal, this may be a group-stop; see below.
> @@ -837,7 +845,7 @@ The
> =A0signal has a side effect of waking up (all threads of)
> =A0a group-stopped process.
> =A0This side effect happens before signal-delivery-stop.
> -The tracer can't suppress this side-effect (it can
> +The tracer can't suppress this side effect (it can

Applied.

> =A0only suppress signal injection, which only causes the
> =A0.BR SIGCONT
> =A0handler to not be executed in the tracee, if such a handler is ins=
talled).
> @@ -997,7 +1005,7 @@ with the exit signal set to
> =A0.TP
> =A0.B PTRACE_EVENT_CLONE
> =A0Stop before return from
> -.BR clone (2)
> +.BR clone (2).

Applied.

> =A0.TP
> =A0.B PTRACE_EVENT_VFORK_DONE
> =A0Stop before return from
> @@ -1039,12 +1047,13 @@ to finish exiting.
> =A0on
> =A0.B PTRACE_EVENT
> =A0stops returns
> -.B SIGTRAP in
> +.B SIGTRAP
> +in

Already fixed by another patch (from Denys Vlasenko, I think).

> =A0.IR si_signo ,
> =A0with
> =A0.I si_code
> =A0set to
> -.IR "(event<<8)\ |\ SIGTRAP" .
> +(\fIevent<<8\fP)\ \fB|\ SIGTRAP\fP.

Not applied (see comments above).

> =A0.SS Syscall-stops
> =A0If the tracee was restarted by
> =A0.BR PTRACE_SYSCALL ,
> @@ -1086,7 +1095,7 @@ If the
> =A0option was set by the tracer, then
> =A0.I WSTOPSIG(status)
> =A0will give the value
> -.IR "(SIGTRAP\ |\ 0x80)" .
> +.RB ( "SIGTRAP\ |\ 0x80" ).

Not aplied.

> =A0.LP
> =A0Syscall-stops can be distinguished from signal-delivery-stop with
> =A0.B SIGTRAP
> @@ -1173,7 +1182,7 @@ with
> =A0set to
> =A0.B SIGTRAP
> =A0or
> -.IR (SIGTRAP|0x80) .
> +.RB ( "SIGTRAP\ |\ 0x80" ).

Not applied.

> =A0.SS PTRACE_SINGLESTEP, PTRACE_SYSEMU, PTRACE_SYSEMU_SINGLESTEP sto=
ps
> =A0[Details of these kinds of stops are yet to be documented.]
> =A0.\"
> @@ -1243,7 +1252,7 @@ is
> =A0.BR PTRACE_SINGLESTEP ,
> =A0.BR PTRACE_SYSEMU ,
> =A0or
> -.BR PTRACE_SYSEMU_SINGLESTEP.
> +.BR PTRACE_SYSEMU_SINGLESTEP .

Applied.

> =A0If the tracee is in signal-delivery-stop,
> =A0.I sig
> =A0is the signal to be injected (if it is nonzero).
> @@ -1252,7 +1261,7 @@ Otherwise,
> =A0may be ignored.
> =A0(When restarting a tracee from a ptrace-stop other than signal-del=
ivery-stop,
> =A0recommended practice is to always pass 0 in
> -.I sig .)
> +.IR sig .)

Applied.

> =A0.SS Attaching and detaching
> =A0A thread can be attached to the tracer using the call
>
> @@ -1285,9 +1294,11 @@ may be lost.
> =A0Since attaching sends
> =A0.B SIGSTOP
> =A0and the tracer usually suppresses it, this may cause a stray
> -.I EINTR
> +.B EINTR

Applied.

> =A0return from the currently executing system call in the tracee,
> -as described in the "signal injection and suppression" section.
> +as described in the
> +.B Signal injection and suppression
> +section.

Not applied.

> =A0.LP
> =A0The request
>
> @@ -1479,10 +1490,10 @@ Example: two threads call
> =A0at the same time:
> =A0.LP
> =A0.nf
> -*** we get syscall-entry-stop in thread 1: **
> +*** we get syscall-enter-stop in thread 1: **
> =A0PID1 execve("/bin/foo", "foo" <unfinished ...>
> =A0*** we issue PTRACE_SYSCALL for thread 1 **
> -*** we get syscall-entry-stop in thread 2: **
> +*** we get syscall-enter-stop in thread 2: **
> =A0PID2 execve("/bin/bar", "bar" <unfinished ...>
> =A0*** we issue PTRACE_SYSCALL for thread 2 **
> =A0*** we get PTRACE_EVENT_EXEC for PID0, we issue PTRACE_SYSCALL **

Applied. (Nice catch!)

> @@ -1539,7 +1550,9 @@ several kinds of
> =A0notifications when the child process is traced by some other proce=
ss.
> =A0.LP
> =A0Many of these bugs have been fixed, but as of Linux 2.6.38 several=
 still
> -exist; see BUGS below.
> +exist; see
> +.B BUGS
> +below.

Not applied.

> =A0.LP
> =A0As of Linux 2.6.38, the following is believed to work correctly:
> =A0.IP * 3
> --
> 1.7.9.1
>

Thanks for this David!

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
